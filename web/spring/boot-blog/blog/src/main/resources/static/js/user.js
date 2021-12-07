let index={
	init:function(){
		$("#btn-save").on("click",()=>{ //function(){}이 아닌 ()=>{}을 사용-> this를 바인딩 하기 위해
			this.save();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
//    전통적 로그인 방법
//		$("#btn-login").on("click",()=>{ //function(){}이 아닌 ()=>{}을 사용-> this를 바인딩 하기 위해
//			this.login();
//		});
	},
	 
	save:function(){
		//alert('user의 save함수 호출됨');
		let data = {
			username:$("#username").val(),
			password:$("#password").val(),
			email:$("#email").val(),
		};
		
		//consoloe.log(data);
		
		//ajax 호출시 default가 비동기 호출
		//ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청
		//ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환해줌. 
		$.ajax({
			type:"POST",
			url:"/auth/joinProc",
			data:JSON.stringify(data), //http body데이터
			contentType:"application/json; charset=utf-8", //body데이터가 어떤 타입인지(MIME)
			dataType:"json" //요청을 서버로 해서 응답이 왔을 때 기본적으로 모든것이 문자열인데 생긴게 json이면 자바스크립트 오브젝트로 변환해줌
			
		}).done(function(resp){
			alert("회원가입이 완료되었습니다");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
			
		});// ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청
	},


	update:function(){
		//alert('user의 save함수 호출됨');
		let data = {
			id:$("#id").val(),
			username: $("#username").val(),
			password:$("#password").val(),
			email:$("#email").val(),
		};
		

		$.ajax({
			type:"PUT",
			url:"/user",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8", 
			dataType:"json" 
			
		}).done(function(resp){
			alert("회원수정이 완료되었습니다");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
			
		});// ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청
	},
//		전통적 로그인 방법
//		login:function(){
//		//alert('user의 login함수 호출됨');
//		let data = {
//			username:$("#username").val(),
//			password:$("#password").val(),
//		};
//		
//		console.log(data);
//		
//		$.ajax({
//			type:"POST",
//			url:"/api/user/login",
//			data:JSON.stringify(data), //http body데이터
//			contentType:"application/json; charset=utf-8", //body데이터가 어떤 타입인지(MIME)
//			dataType:"json" //요청을 서버로 해서 응답이 왔을 때 기본적으로 모든것이 문자열인데 생긴게 json이면 자바스크립트 오브젝트로 변환해줌
//			
//		}).done(function(resp){
//			alert("로그인이 완료되었습니다");
//			location.href="/";
//		}).fail(function(error){
//			alert(JSON.stringify(error));
//		});
//	}
	
	
}



index.init();
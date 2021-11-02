<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style>
* {
	font-size: 20pt;
}
#code_ch{
	margin-left:50pt;
	color:red;
	font-size:15pt;
}
#title_ch{
	margin-left:50pt;
	color:red;
	font-size:15pt;
}
#pay_ch{
	margin-left:50pt;
	color:red;
	font-size:15pt;
}
.link{
	text-align: center;
}

</style>
<script>
	let codeCheck=false;
	let tmp;
	function codecheck() {
		codeCheck=false;
		code_reg = /^[0-9]{4}$/;
		code = document.getElementById("code").value;
		codeLength = document.getElementById("code").value.length;
		if (code_reg.test(code) == false){
			document.getElementById("code_ch").innerHTML = "code에는 4자리 숫자를 입력해주세요";
			return;
		}else{
			document.getElementById("code_ch").innerHTML = "";	
			window.open("openID.jsp?idx="+code,"bb","width=500,height=200,left=700,top=200");
		}

	}

	function subcheck() {
		let id;
		let pay;
		let idCheck = false;
		let payCheck = false;
		id = document.getElementById("title").value;
		pay = document.getElementById("pay").value;
		if(confirm("선택한 데이터 내용이 맞습니까?")==true){
			if (id == null || id == "") {
				//alert("id를입력해주세요");
				document.getElementById("title_ch").innerHTML = "id를 입력해주세요";
	
			} else {
				document.getElementById("title_ch").innerHTML = "";
				idCheck = true;
			}
	
			if (pay == null || pay == "") {
				//alert("pay를입력해주세요")
				document.getElementById("pay_ch").innerHTML = "pay를 입력해주세요";
			} else {
				let code_reg = /^[0-9]{2}$/;
				if (code_reg.test(pay) == false) {
					//alert("pay에는 숫자만 입력할 수 있습니다")
					document.getElementById("pay_ch").innerHTML = "pay에는 두자리 숫자만 입력해주세요";
	
				} else {
					document.getElementById("pay_ch").innerHTML = "";
					payCheck = true;
				}
			}
			
			if (idCheck == true && payCheck == true &&codeCheck==true && (tmp==document.getElementById("code").value)) {
				//document.getElementById("form1").submit(); //->form에 onsubmit 안쓸때
				return true; //->form에 onsubmit 쓸때
			} 
			else if(codeCheck==false||(tmp!=document.getElementById("code").value)){
				document.getElementById("code_ch").innerHTML = "code 중복검사를 수행해주세요";
				return false;
			} 
			else{
				return false; //->form에 onsubmit 쓸때
			}
		}
	}
	function cCheck(){
		codeCheck=true;
		tmp=document.getElementById("code").value;
	}
</script>
</head>
<body>
	<h2>guestWrite.jsp</h2>
	<form method="post" action="guestSave.jsp" id=form1  onsubmit="return subcheck();"> <!-- submit쓸땐 onsubmit, 버튼쓸땐 id가지고 쓰기. -->
		코드: <input type="text" name="code" id="code" size="9">
		<input type="button" value="중복체크" onclick=codecheck();>
		<br>
		<span id=code_ch></span><br>
		제목: <input type="text" name="title" id="title"> <br> 
		<span id="title_ch"></span><br>
		가격: <input type="text" name="pay" id="pay"> <br> 
		<span id="pay_ch"></span><br>
		<!-- <input type="button" value="데이터저장" id="submitbutton" onclick="subcheck()"> --> <!-- button쓸때. -->
		<input type="submit" value="데이터저장"">  <!-- summit쓸때 -->
		<input type="reset" value="입력취소">
	</form>
	<p>
	<div class="link">
	<a href="gugudan.jsp">[gugudan]</a> 
	<a href="guestWrite.jsp">[방명록등록]</a> 
	<a href="list.jsp">[확인]</a>
	</div>
</body>
</html>
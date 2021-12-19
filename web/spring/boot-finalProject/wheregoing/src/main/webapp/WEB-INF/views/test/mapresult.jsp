<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<head>
	<style>

	</style>

</head>

<body>

  <h1>지도결과</h1>


  <div id="googleMap" style="width:100%;height:400px;"></div>
	</br>
  <div id=plans></div>




  <script>
	
  let HongikU = {position : { lat: 37.5515814, lng: 126.9227864 }, label:'홍대', content:'홍대입니다',locationSelected : false};
  let SeoulU = {position : { lat: 37.4565095, lng: 126.9478498 }, label:'서울대', content:'서울대입니다',locationSelected : false};
  let Bitcamp = {position : { lat: 37.499506, lng: 127.028964 }, label:'비트',content:'비트캠프입니다',locationSelected : false};
  let YongsanS = {position : { lat: 37.5294194, lng: 126.9628168}, label:'용산',content:'용산입니다' ,locationSelected : false};
  let NowonS = {position : { lat: 37.654527, lng: 127.058357 }, label:'노원',content:'노원입니다',locationSelected : false};
  let UijeongbuS = {position : { lat: 37.7387295, lng: 127.0436968 }, label:'의정부',content:'의정부입니다',locationSelected : false};
  let SeoulS= {position : { lat: 37.553017, lng: 126.9376271 }, label:'서울역',content:'서울역입니다',locationSelected : false};
  let GyeongbokgungP = {position : { lat: 37.585055084889504   ,lng : 126.97659114710879} , label: '경복궁',content:'테스트용',locationSelected : false};
  let ChangdeokgungP = {position : { lat: 37.58634363065633,  lng : 126.99181662454347} , label: '창덕궁' ,content:'테스트용',locationSelected : false};
  let GyeongdongM = {position : { lat: 37.58634363065633,  lng : 127.03885184117183} , label: '경동시장' ,content:'테스트용',locationSelected : false};
  let StarfieldC = {position : { lat: 37.516935759039576,  lng : 127.06082449711501} , label: '스타필드 코엑스몰 ' ,content:'테스트용',locationSelected : false};
  let YonseiU = {position : { lat: 37.57273933928159,  lng : 126.94066153463814} , label: '연세대' ,content:'테스트용',locationSelected : false};
  let SeoulArtsC = {position : { lat: 37.48615788106978,  lng : 127.0144759255438} , label: '예술의전당' ,content:'테스트용',locationSelected : false};
  let LotteWorld = {position : { lat: 37.51611881086883,  lng : 127.09756003082893} , label: '롯데월드' ,content:'테스트용',locationSelected : false};
  let WarMemorialH = {position : { lat: 37.54144003511956,  lng : 126.97739706863972} , label: '전쟁기념관' ,content:'테스트용',locationSelected : false};
  let WarandWomen = {position : { lat: 37.56321485582398,  lng : 126.91525565084426} , label: '전쟁과여성인권박물관' ,content:'테스트용',locationSelected : false};
  let MangwonM = {position : { lat: 37.55797587095626,  lng : 126.90581427524369} , label: '망원시장' ,content:'테스트용',locationSelected : false};
  let Cheonggyecheon = {position : { lat: 37.57049439232437,  lng : 126.97842703697813} , label: '청계천' ,content:'테스트용',locationSelected : false};
  let Dongdaemun = {position : { lat: 37.57189986111966,  lng : 127.00942945048725} , label: '동대문' ,content:'테스트용',locationSelected : false};
  let NamsanT = {position : { lat: 37.55210095403334,  lng : 126.98840093234205} , label: '남산타워' ,content:'테스트용',locationSelected : false};
  let Gyeonglidangil = {position : { lat: 37.53954531316697,  lng : 126.98724221827294} , label: '경리단길' ,content:'테스트용',locationSelected : false};
  let MuseumofKorea = {position : { lat: 37.585055084889504   ,lng : 126.97659114710879} , label: '국립중앙박물관' ,content:'테스트용',locationSelected : false};
  let ApgujeongHyundaiD = {position : { lat: 37.528927511851386,  lng : 127.0275826412121} , label: '현대백화점압구정본점' ,content:'테스트용',locationSelected : false};
  let LotteWorldT = {position : { lat: 37.51306405337366,  lng : 127.10191633106517} , label: '롯데월드타워' ,content:'테스트용',locationSelected : false};
  let DreamForest = {position : { lat: 37.622144056950226,  lng : 127.04072049860147} , label: '북서울꿈의숲' ,content:'테스트용',locationSelected : false};
  let GyeonguiLineF = {position : { lat: 37.55956021204483,  lng : 126.92546487452844} , label: '경의선숲길 ' ,content:'테스트용',locationSelected : false};
  let TrickEyeMuseum = {position : { lat: 37.553734192808186,  lng : 126.92163874302071} , label: '트릭아이뮤지엄' ,content:'테스트용',locationSelected : false};
  let Dongmyo = {position : { lat: 37.573283023567186,  lng : 127.01654927557925} , label: '동묘앞' ,content:'테스트용',locationSelected : false};
  let HousesofParliament = {position : { lat: 37.528261036136726,  lng : 126.91772552193481} , label: '국회의사당' ,content:'테스트용',locationSelected : false};
  let BoramaeP = {position : { lat: 37.49392707859974,  lng : 126.91879809805897} , label: '보라매공원' ,content:'테스트용',locationSelected : false};
  let AsanMedicalCenter = {position : { lat: 37.527439583874866,  lng : 127.10889139526071} , label: '서울아산병원 ' ,content:'테스트용',locationSelected : false};
  let LH = {position : { lat: 37.52069065226224   ,lng : 127.09751421852974} , label: '롯데호텔월드(잠실)',content:'테스트용',locationSelected : false};
  let SH = {position : { lat: 37.55829809520702   ,lng : 127.00946954497128} , label: '신라호텔(동대입구)',content:'테스트용',locationSelected : false};
  let FH = {position : { lat: 37.52774053938984   ,lng : 126.93555005608506} , label: '페어몬트앰배서더(여의도)',content:'테스트용',locationSelected : false};
  let IH = {position : { lat: 37.51352707438062   ,lng : 127.05739992550794} , label: '인터컨티넨탈 서울 코엑스',content:'테스트용',locationSelected : false};
  let HH = {position : { lat: 37.56578757493458   ,lng : 126.92828971495234} , label: '홀리데이인익스프레스서울홍대',content:'테스트용',locationSelected : false};
  let NS = {position : { lat: 37.55610380930567   ,lng : 126.97345003934156} , label: '서울역8번출구',content:'테스트용',locationSelected : false};
  
  const $plans = document.querySelector('#plans');
  
  let daysList = []

  
//  let locations = ${dayPlan}; 원래 마커는 한번에 리스트에 넣고 띄우려고 했었음. 수정함.

  
  <c:forEach var="list" items="${dayPlan }">
  	daysList.push([${list}]);  //만일 "${list}"로 받아버릴 경우, 문자열이 된다. 이를 split(',') 해서 문자로 사용이 가능하다.
  </c:forEach>
//  console.log(daysList[1][0]);
//  //사용설명->daysList[i] 는 i일차 일정정보를 다 담고있다. daysList[i][j]는 i일차의 j번째 일정이 된다.

  
  
  
    function myMap() {
    	
      let mapProp = {
        center: new google.maps.LatLng(37.499506, 127.028964),
        zoom: 13,
      }; //맵의 기본적인것을 조정하는 객체 리터럴. center가 시작점.
      //zoom은 몇배줌이 될것인가? 1세계 5대륙, 10도시, 15거리, 20건물 이라한다.
      let map = new google.maps.Map(document.getElementById("googleMap"), mapProp);


      //첫번째이동위치로 화면포커스주기
      map.setCenter(daysList[0][0].position); //1일차 첫일정으로 보내버린다.
	  
      //선긋기
      for(let i=0;i<daysList.length;i++){
    	  
    	  //선 색깔. 나중에 switch문으로 바꾸거나 다른 방법으로 바꾸자.
    	  let color;
    	  if(i==0){
    		  color="#0000FF";
    	  }
    	  if(i==1){
    		  color="#FF0000";
    	  }
    	  if(i==2){
    		  color="#00FF00";
    	  }
    	  if(i==3){
    		  color="#000000";
    	  }
    	  if(i==4){
    		  color="#FFFF00"
    	  }
    	  if(i==5){
    		  color="#FF00FF";
    	  }
    	  if(i==6){
    		  color="#00FFFF";
    	  }
    	  
    	  
	      for(let j=0;j<daysList[i].length-1;j++){      
	          let flightPath = new google.maps.Polyline({
	            path:[daysList[i][j].position,daysList[i][j+1].position],
	            strokeColor:color,
	            strokeOpacity:0.8,
	            //strokeWeight:2
	            //화살표
	            icons: [
	                {
	                  icon: {
	                	    path: google.maps.SymbolPath.FORWARD_OPEN_ARROW,
	                  },
	                  offset: "85%",
	                },
	              ],
	          });
	          flightPath.setMap(map);	 
	      }//for end
      
      }//선긋기 end
      


	  //마커달기. 중복마커를 해결해야 한다. 관광지의 경우 중복이 나올 가능성은 거의 없다고 보고 있지만, 호텔의 경우 중복이 나올 가능성이 높다
	  
	  const iconImage='/image/marker.PNG'
	  
      for (let i = 0; i < daysList.length; i++) {
    	  for(let j = 0; j<daysList[i].length; j++){
	         let mker = new google.maps.Marker({
	            position: daysList[i][j].position,
	            label: daysList[i][j].label,
	            icon: iconImage,
	        	map,
	            }); 
      		}
      }
	  
      //버튼달기
	  for(let i=0;i<daysList.length;i++){
		  addButton(i)
	  }//for end
	  
	  //계획리스트 달기
	  for(let i=0;i<daysList.length;i++){
		  printPlan(i)
	  }//for end
  	  
	  
      
      
      
    }//myMap end
    	
    
      function addButton(number){
    		let planTemplate =`
    			<input type="button" value=\${number+1}일차 onClick=showPlan(\${number})></input>
    		`; 		
    		let span = document.createElement('span');
    		span.innerHTML=planTemplate;
    		$plans.appendChild(span)
    		
    		if(number==daysList.length-1){
        		planTemplate =`
        			<input type="button" value=전체보기 onClick=showPlan(-1)></input>

        		`; 		
        		span = document.createElement('span');
        		span.innerHTML=planTemplate;
        		$plans.appendChild(span)    			
    			
    		}
    	
    }
    
    
      function printPlan(number){
    	
    		let planTemplate =`
    		  </br>
    			<div class=dayPlans id=dayPlan\${number}>
    				<label>\${number+1}일차 일정입니다</label><br/>
    			</div>
    		`; 		
    		let div = document.createElement('div');
    		div.innerHTML=planTemplate;
    		$plans.appendChild(div)
  			for(let i=0;i<daysList[number].length;i++){
  				document.querySelector(`#dayPlan\${number}`).append(daysList[number][i].label);
    			if(i!=daysList[number].length-1){
    				document.querySelector(`#dayPlan\${number}`).append("->")
    				}
  			}
 
    
    }
      
      function showPlan(number) {
    	    let dayPlans = document.querySelectorAll('.dayPlans');
    	    for (let i = 0; i < daysList.length; i++) {
	            dayPlans[i].style.display = 'block';
	        }
    
    	    if (number != -1) {
    	        for (let i = 0; i < daysList.length; i++) {
    	        	if(i!=number){
    	            dayPlans[i].style.display = 'none';}
    	        }
    	        
    	    } else if (number == -1) {
    	        for (let i = 0; i < daysList.length; i++) {
    	            dayPlans[i].style.display = 'block';
    	        }
    	    }
    	}
    

  </script>

</body>

  <script
    src="https://maps.googleapis.com/maps/api/js?key=InsertYourKey&callback=myMap"></script>

  <!--  일단 발급받은 api키. -->


</html>
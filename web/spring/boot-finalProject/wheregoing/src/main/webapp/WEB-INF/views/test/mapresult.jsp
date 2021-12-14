<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<body>

  <h1>지도결과</h1>


  <div id="googleMap" style="width:100%;height:400px;"></div>
  <form id="locationForm">

    <label id='return'>넘어온값: "${arr}"</label>
  </form>

  <script>
	

    function myMap() {
    	
      let mapProp = {
        center: new google.maps.LatLng(37.499506, 127.028964),
        zoom: 13,
      }; //맵의 기본적인것을 조정하는 객체 리터럴. center가 시작점.
      //zoom은 몇배줌이 될것인가? 1세계 5대륙, 10도시, 15거리, 20건물 이라한다.
      let map = new google.maps.Map(document.getElementById("googleMap"), mapProp);


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
      
	  let locations = [${arr}];

	  let myTrip=[];
      for(let i=0;i<locations.length;i++){
    	  myTrip.push(locations[i].position);
      }
      console.log(myTrip);
     
      
      //첫번째이동위치로 화면포커스주기
      map.setCenter(locations[0].position);
	  
      //선긋기
      for(let i=0;i<myTrip.length-1;i++){      
          let flightPath = new google.maps.Polyline({
            path:[myTrip[i],myTrip[i+1]],
            strokeColor:"#0000FF",
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
    	  
      }
      


	  //마커달기
	  
	  const iconImage='/image/marker.PNG'
	  
      for (let i = 0; i < locations.length; i++) {
         let mker = new google.maps.Marker({
            position: locations[i].position,
            label: locations[i].label,
            icon: iconImage,
        	map,
            }); 
      }
	  
    }

  </script>

  <script
    src="https://maps.googleapis.com/maps/api/js?key=InsertYourKey&callback=myMap"></script>

  <!-- 일단 발급받은 api키. -->

</body>

</html>
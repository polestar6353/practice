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
    src="https://maps.googleapis.com/maps/api/js?key=keyvalue&callback=myMap"></script>

  <!--  일단 발급받은 api키. -->

</body>

</html>
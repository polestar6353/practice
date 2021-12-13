<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<style>
.clicked {
	background-color: red;
}
</style>

</head>

<body>

	<h1>지도테스트</h1>


	<div id="googleMap" style="width: 100%; height: 400px;"></div>
	<form id="locationForm" action="/newmap-result">
		<button id=HongikU>홍대</button>
		<button id=SeoulU>서울대</button>
		<button id=Bitcamp>비트캠프</button>
		<button id=YongsanS>용산역</button>
		<button id=NowonS>노원역</button>
		<button id=UijeongbuS>의정부</button>
		<br> 
		<label id="selected"></label> 
		<input type='hidden' id='selectedValue' name=locations /> 
		<input type='hidden' name=city value='seoul'/> 
		<input id="sss"> <br>
		<button id="btn-start">시작</button>
	</form>
	<br>


	<script>
  	let map;

  
    const $HongikU = document.querySelector('#HongikU');
    const $SeoulU = document.querySelector('#SeoulU');
    const $Bitcamp = document.querySelector('#Bitcamp');
    const $YongsanS = document.querySelector('#YongsanS');
    const $NowonS = document.querySelector('#NowonS');
    const $UijeongbuS = document.querySelector('#UijeongbuS');
    const $selected = document.querySelector('#selected')
    let $selectedValue = document.querySelector('#selectedValue')
    const $sss = document.querySelector('#sss')


    let locationArray=[$HongikU,$SeoulU,$Bitcamp,$YongsanS,$NowonS,$UijeongbuS]
    let selectedLocationArray = [];

    function locationSetting() {
      if (!selectedLocationArray.includes(event.target.id)) {
        selectedLocationArray.push(event.target.id);
        event.target.classList.add('clicked');
      }
      else if (selectedLocationArray.includes(event.target.id)) {
        selectedLocationArray.splice(selectedLocationArray.indexOf(event.target.id), 1);
        event.target.classList.remove('clicked');
      }
      $selected.innerHTML = `현재 선택된 값은 ${selectedLocationArray} 입니다 `;
      $selectedValue.value = selectedLocationArray;
      $sss.value = selectedLocationArray;

    }
	


    
    function myMap() {
      let mapProp = {
        center: new google.maps.LatLng(37.499506, 127.028964),
        //center: { lat: -28.024, lng: 140.887 },
        zoom: 13,
      }; //맵의 기본적인것을 조정하는 객체 리터럴. center가 시작점.
      //zoom은 몇배줌이 될것인가? 1세계 5대륙, 10도시, 15거리, 20건물 이라한다.
      map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
	
      



		for(let i=0;i<locationArray.length;i++){
			locationArray[i].addEventListener('click', (event) => {
		    	event.preventDefault();
		        locationSetting();
		        markers[i].setMap(map);
		        latlng_list[i].locationSelected=latlng_list[i].locationSelected?false:true;
		        });
			locationArray[i].addEventListener('mouseenter', (event) => {
		        event.preventDefault();
		        map.panTo(latlng_list[i].position);
		        markers[i].setMap(map);
		        infoWindows[i].open({
		            anchor: markers[i],
		            map,
		            shouldFocus: false,
		          });
		        })
		    locationArray[i].addEventListener('mouseleave', (event) => {
		        event.preventDefault();
		        if(!latlng_list[i].locationSelected){
		        markers[i].setMap(null);};
		        infoWindows[i].close();
		        })
		        
		}

        
		createMarkers();
    }
    
    //마커찍을위치
	let latlng_list = [
	  	  {position : { lat: 37.5515814, lng: 126.9227864 }, label:'홍대', content:'홍대입니다',locationSelected : false},
	  	  {position : { lat: 37.4565095, lng: 126.9478498 }, label:'서울대', content:'서울대입니다',locationSelected : false},
	  	  {position : { lat: 37.499506, lng: 127.028964 }, label:'비트',content:'비트캠프입니다',locationSelected : false},
	  	  {position : { lat: 37.5294194, lng: 126.9628168}, label:'용산',content:'용산입니다' ,locationSelected : false},
	  	  {position : { lat: 37.654527, lng: 127.058357 }, label:'노원',content:'노원입니다',locationSelected : false},
	  	  {position : { lat: 37.7387295, lng: 127.0436968 }, label:'의정부',content:'의정부입니다',locationSelected : false},
	  	];
    
    let markers = [];
    let infoWindows = [];
	const iconImage='/image/marker.PNG'

    // 마커 생성함수
    function createMarkers() {
        for (let i = 0; i < latlng_list.length; i++) {

            let mker = new google.maps.Marker({
                position: latlng_list[i].position,
                label: latlng_list[i].label,
                icon: iconImage,
            	});
            let infowindow=new google.maps.InfoWindow({content:latlng_list[i].content});
                 
            markers.push(mker);
            infoWindows.push(infowindow);
        }
    }

    
    



  </script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=keyValue&callback=myMap"></script>
	<script src="/js/test.js"></script>
	<!--  일단 발급받은 api키. -->

</body>

</html>
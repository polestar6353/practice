<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>

<head>

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
		<label>얼마나 여행하실 예정인가요?</label>  <!-- form에 조건걸기. 선택된 수보다 날짜가 짧으면 submit 대신 alert 뜨게하기. -->
		  <select name="days" >
		  	<!--  <option value="0">당일치기</option>  최단거리 함수로 보내버리기. -->
			<option value="1">1박 2일</option>
			<option value="2">2박 3일</option>
			<option value="3">3박 4일</option>
			<option value="4">4박 5일</option>
			<option value="5">5박 6일</option>
			<option value="6">6박 7일</option>
  		  </select>
		<br/>
		<br/>
		<!-- 나중에 자바스크립트로 반복문 html넣는다. 혹은 다른방법으로...  -->
		<label>1박째 숙소를 정해주세요</label>
		  <select id="firsthotel" onchange="changeHotelArray()" >
		  	<option value="NO">숙소를 선택해주세요</option>
			<option value="LH">롯데호텔월드(잠실)</option>
			<option value="SH">신라호텔(동대입구)</option>
			<option value="FH">페어몬트앰배서더(여의도)</option>
			<option value="IH">인터컨티넨탈 서울 코엑스</option>
			<option value="HH">홀리데이인익스프레스서울홍대</option>
			<option value="NS">서울역8번출구</option>
  		  </select>
  		  <br/>
		<label>2박째 숙소를 정해주세요</label>
		  <select id="secondhotel" onchange="changeHotelArray()" >
		  	<option value="NO">숙소를 선택해주세요</option>
			<option value="LH">롯데호텔월드(잠실)</option>
			<option value="SH">신라호텔(동대입구)</option>
			<option value="FH">페어몬트앰배서더(여의도)</option>
			<option value="IH">인터컨티넨탈 서울 코엑스</option>
			<option value="HH">홀리데이인익스프레스서울홍대</option>
			<option value="NS">서울역8번출구</option>
  		  </select>
  		  <br/>
		<label>3박째 숙소를 정해주세요</label>
		  <select id="thirdhotel" onchange="changeHotelArray()" >
			<option value="NO">숙소를 선택해주세요</option>
			<option value="LH">롯데호텔월드(잠실)</option>
			<option value="SH">신라호텔(동대입구)</option>
			<option value="FH">페어몬트앰배서더(여의도)</option>
			<option value="IH">인터컨티넨탈 서울 코엑스</option>
			<option value="HH">홀리데이인익스프레스서울홍대</option>
			<option value="NS">서울역8번출구</option>
  		  </select>
  		  <br/>
		<label>4박째 숙소를 정해주세요</label>
		  <select id="fourthhotel" onchange="changeHotelArray()" >
		  	<option value="NO">숙소를 선택해주세요</option>
			<option value="LH">롯데호텔월드(잠실)</option>
			<option value="SH">신라호텔(동대입구)</option>
			<option value="FH">페어몬트앰배서더(여의도)</option>
			<option value="IH">인터컨티넨탈 서울 코엑스</option>
			<option value="HH">홀리데이인익스프레스서울홍대</option>
			<option value="NS">서울역8번출구</option>
  		  </select>
  		  <br/>
		<label>5박째 숙소를 정해주세요</label>
		  <select id="fifthhotel" onchange="changeHotelArray()" >
			<option value="NO">숙소를 선택해주세요</option>
			<option value="LH">롯데호텔월드(잠실)</option>
			<option value="SH">신라호텔(동대입구)</option>
			<option value="FH">페어몬트앰배서더(여의도)</option>
			<option value="IH">인터컨티넨탈 서울 코엑스</option>
			<option value="HH">홀리데이인익스프레스서울홍대</option>
			<option value="NS">서울역8번출구</option>
  		  </select>
  		  <br/>
		<label>6박째 숙소를 정해주세요</label>
		  <select id="sixthhotel" onchange="changeHotelArray()" >
			<option value="NO">숙소를 선택해주세요</option>
			<option value="LH">롯데호텔월드(잠실)</option>
			<option value="SH">신라호텔(동대입구)</option>
			<option value="FH">페어몬트앰배서더(여의도)</option>
			<option value="IH">인터컨티넨탈 서울 코엑스</option>
			<option value="HH">홀리데이인익스프레스서울홍대</option>
			<option value="NS">서울역8번출구</option>
  		  </select>
		<br/>
		
		
		<br>
		<label>관광지를 정해주세요</label><br>/
		<button id=HongikU>홍대</button>
		<button id=SeoulU>서울대</button>
		<button id=Bitcamp>비트캠프</button>
		<button id=YongsanS>용산역</button>
		<button id=NowonS>노원역</button>
		<button id=UijeongbuS>의정부</button>
		<button id=GyeongbokgungP>경복궁</button>
		<button id=ChangdeokgungP>창덕궁</button>
		<button id=GyeongdongM>경동시장</button>
		<button id=StarfieldC>스타필드 코엑스몰</button>
		<button id=YonseiU>연세대</button> 
		<button id=SeoulArtsC>예술의전당</button>
		<button id=LotteWorld>롯데월드</button>
		<button id=WarMemorialH>전쟁기념관</button>
		<button id=WarandWomen>전쟁과여성인권박물관</button>
		<button id=MangwonM>망원시장</button>
		<button id=Cheonggyecheon>청계천</button>
		<button id=Dongdaemun>동대문</button>
		<button id=NamsanT>남산타워</button>
		<button id=Gyeonglidangil>경리단길</button>
		<button id=MuseumofKorea>국립중앙박물관</button>
		<button id=ApgujeongHyundaiD>현대백화점압구정본점</button>
		<button id=LotteWorldT>롯데월드타워</button>
		<button id=DreamForest>북서울꿈의숲</button> 
		<button id=GyeonguiLineF>경의선숲길</button>
		<button id=TrickEyeMuseum>트릭아이뮤지엄</button>
		<button id=Dongmyo>동묘앞</button>
		<button id=HousesofParliament>국회의사당</button>
		<button id=BoramaeP>보라매공원</button>
		<button id=AsanMedicalCenter>서울아산병원</button>
		<br>
		<label id="selected"></label> 
		<input type='hidden' id='selectedValue' name=locations /> 
		<input type='hidden' id='selectedHotel' name=hotels value='1234'/>
		<input type='hidden' name=city value='seoul'/> 
		
		<input id="sss"> <br>
		<input id="hhh"> <br>
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
    const $GyeongbokgungP = document.querySelector('#GyeongbokgungP');
    const $ChangdeokgungP = document.querySelector('#ChangdeokgungP');
    const $GyeongdongM = document.querySelector('#GyeongdongM');
    const $StarfieldC = document.querySelector('#StarfieldC');
    const $YonseiU = document.querySelector('#YonseiU');
    const $SeoulArtsC = document.querySelector('#SeoulArtsC');
    const $LotteWorld = document.querySelector('#LotteWorld');
    const $WarMemorialH = document.querySelector('#WarMemorialH');
    const $WarandWomen = document.querySelector('#WarandWomen');
    const $MangwonM = document.querySelector('#MangwonM');
    const $Cheonggyecheon = document.querySelector('#Cheonggyecheon');
    const $Dongdaemun = document.querySelector('#Dongdaemun');
    const $NamsanT = document.querySelector('#NamsanT');
    const $Gyeonglidangil = document.querySelector('#Gyeonglidangil');
    const $MuseumofKorea = document.querySelector('#MuseumofKorea');
    const $ApgujeongHyundaiD = document.querySelector('#ApgujeongHyundaiD');
    const $LotteWorldT = document.querySelector('#LotteWorldT');
    const $DreamForest = document.querySelector('#DreamForest');
    const $GyeonguiLineF = document.querySelector('#GyeonguiLineF');
    const $TrickEyeMuseum = document.querySelector('#TrickEyeMuseum');
    const $Dongmyo = document.querySelector('#Dongmyo');
    const $HousesofParliament = document.querySelector('#HousesofParliament');
    const $BoramaeP = document.querySelector('#BoramaeP');
    const $AsanMedicalCenter = document.querySelector('#AsanMedicalCenter');
    const $selected = document.querySelector('#selected');
    let $selectedValue = document.querySelector('#selectedValue');
    const $sss = document.querySelector('#sss');
    const $hhh = document.querySelector('#hhh');
    
    const $firsthotel=document.querySelector('#firsthotel');
    const $secondhotel=document.querySelector('#secondhotel');
    const $thirdhotel=document.querySelector('#thirdhotel');
    const $fourthhotel=document.querySelector('#fourthhotel');
    const $fifthhotel=document.querySelector('#fifthhotel');
	const $sixthhotel=document.querySelector('#sixthhotel');
	const $selectedHotel=document.querySelector('#selectedHotel');
	
	let hotelArray=[];
	
	function changeHotelArray(){
		hotelArray = [$firsthotel.value,$secondhotel.value,$thirdhotel.value,$fourthhotel.value,$fifthhotel.value,$sixthhotel.value];
		$hhh.value=hotelArray;
		$selectedHotel.value=hotelArray;
	}

    let locationArray=[$HongikU,$SeoulU,$Bitcamp,$YongsanS,$NowonS,$UijeongbuS,$GyeongbokgungP,$ChangdeokgungP,$GyeongdongM,$StarfieldC,$YonseiU,$SeoulArtsC,$LotteWorld,$WarMemorialH,$WarandWomen,$MangwonM,$Cheonggyecheon,$Dongdaemun,$NamsanT,$Gyeonglidangil,$MuseumofKorea,$ApgujeongHyundaiD,$LotteWorldT,$DreamForest,$GyeonguiLineF,$TrickEyeMuseum,$Dongmyo,$HousesofParliament,$BoramaeP,$AsanMedicalCenter];
    let selectedLocationArray = [];
	
    
	$hhh.value=hotelArray;
	
	
	
	
    function locationSetting() {
      if (!selectedLocationArray.includes(event.target.id)) {
        selectedLocationArray.push(event.target.id);
        event.target.classList.add('clicked');

      }
      else if (selectedLocationArray.includes(event.target.id)) {
        selectedLocationArray.splice(selectedLocationArray.indexOf(event.target.id), 1);
        event.target.classList.remove('clicked');
      }
      $selected.innerHTML = `현재 선택된 값은 \${selectedLocationArray} 입니다 `;
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
		  {position : { lat: 37.585055084889504   ,lng : 126.97659114710879} , label: '경복궁',content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.58634363065633,  lng : 126.99181662454347} , label: '창덕궁' ,content:'테스트용',locationSelected : false},
		  {position : { lat: 37.58634363065633,  lng : 127.03885184117183} , label: '경동시장' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.516935759039576,  lng : 127.06082449711501} , label: '스타필드 코엑스몰 ' ,content:'테스트용',locationSelected : false},
   		  {position : { lat: 37.57273933928159,  lng : 126.94066153463814} , label: '연세대' ,content:'테스트용',locationSelected : false},
		  {position : { lat: 37.48615788106978,  lng : 127.0144759255438} , label: '예술의전당' ,content:'테스트용',locationSelected : false},
		  {position : { lat: 37.51611881086883,  lng : 127.09756003082893} , label: '롯데월드' ,content:'테스트용',locationSelected : false},
		  {position : { lat: 37.54144003511956,  lng : 126.97739706863972} , label: '전쟁기념관' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.56321485582398,  lng : 126.91525565084426} , label: '전쟁과여성인권박물관' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.55797587095626,  lng : 126.90581427524369} , label: '망원시장' ,content:'테스트용',locationSelected : false},
		  {position : { lat: 37.57049439232437,  lng : 126.97842703697813} , label: '청계천' ,content:'테스트용',locationSelected : false},
		  {position : { lat: 37.57189986111966,  lng : 127.00942945048725} , label: '동대문' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.55210095403334,  lng : 126.98840093234205} , label: '남산타워' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.53954531316697,  lng : 126.98724221827294} , label: '경리단길' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.585055084889504   ,lng : 126.97659114710879} , label: '국립중앙박물관' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.528927511851386,  lng : 127.0275826412121} , label: '현대백화점압구정본점' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.51306405337366,  lng : 127.10191633106517} , label: '롯데월드타워' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.622144056950226,  lng : 127.04072049860147} , label: '북서울꿈의숲' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.55956021204483,  lng : 126.92546487452844} , label: '경의선숲길 ' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.553734192808186,  lng : 126.92163874302071} , label: '트릭아이뮤지엄' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.573283023567186,  lng : 127.01654927557925} , label: '동묘앞' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.528261036136726,  lng : 126.91772552193481} , label: '국회의사당' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.49392707859974,  lng : 126.91879809805897} , label: '보라매공원' ,content:'테스트용',locationSelected : false},	
		  {position : { lat: 37.527439583874866,  lng : 127.10889139526071} , label: '서울아산병원 ' ,content:'테스트용',locationSelected : false},
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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=InsertYourKey&callback=myMap"></script>
	<script src="/js/test.js"></script>
	<!-- 일단 발급받은 api키. -->

</body>

</html>
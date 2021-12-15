<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
		
		
		<label>얼마나 여행하실 예정인가요? ()</label><br>  <!-- form에 조건걸기. 선택된 수보다 날짜가 짧으면 submit 대신 alert 뜨게하기. -->
		
		<label>시작 날짜를 골라주세요 :</label>
		<input type="date" id=startDate onchange="changeStartDate()"></br>
		<label>종료 날짜를 골라주세요 :</label>
		<input type="date" id=endDate onchange="changeEndDate()"></br>

		<br/>
		<br/>
		
		<div id="Hotels"></div>
		<a href="#" onclick='test()'>테스트함수</a>
		
		
		
		
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
		<input type='hidden' id='selectedHotel' name=hotels />
		<input type='hidden' name=city value='seoul'/> 
		<input type='hidden' id='days', name='days'/>
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
	const $selectedHotel=document.querySelector('#selectedHotel');
	
	
	
	const $startDate = document.querySelector('#startDate');
	const $endDate = document.querySelector('#endDate');
	const $days = document.querySelector('#days');
	let today= new Date();
	//시작날짜는 다음날부터 받을래.
	$startDate.value=today.getFullYear()+"-"+("0"+(today.getMonth()+1)).slice(-2)+"-"+("0"+(today.getDate()+1)).slice(-2);
	$startDate.min=today.getFullYear()+"-"+("0"+(today.getMonth()+1)).slice(-2)+"-"+("0"+(today.getDate()+1)).slice(-2);
	$endDate.value=today.getFullYear()+"-"+("0"+(today.getMonth()+1)).slice(-2)+"-"+("0"+(today.getDate()+2)).slice(-2);
	$endDate.min=today.getFullYear()+"-"+("0"+(today.getMonth()+1)).slice(-2)+"-"+("0"+(today.getDate()+2)).slice(-2);
	$endDate.max=today.getFullYear()+"-"+("0"+(today.getMonth()+1)).slice(-2)+"-"+("0"+(today.getDate()+7)).slice(-2);
	
	//테스트버튼을 누르면 작동.
	function test(){
		console.log($endDate.value);
	};
	
	function changeStartDate(){
		let newDate = new Date($startDate.value);
		newDate.setDate(newDate.getDate()+1);
		$endDate.value=newDate.getFullYear()+"-"+("0"+(newDate.getMonth()+1)).slice(-2)+"-"+("0"+(newDate.getDate())).slice(-2);
		$endDate.min=newDate.getFullYear()+"-"+("0"+(newDate.getMonth()+1)).slice(-2)+"-"+("0"+(newDate.getDate())).slice(-2);
		
		newDate.setDate(newDate.getDate()+5);
		$endDate.max=newDate.getFullYear()+"-"+("0"+(newDate.getMonth()+1)).slice(-2)+"-"+("0"+(newDate.getDate())).slice(-2);
		
		changeEndDate();
	};
	function changeEndDate(){
		let diffDays=(new Date($endDate.value)-new Date($startDate.value))/(1000*3600*24); //ms->sec에 1000 sec->hour에 3600 hour->day에 24 
		createho(diffDays);
		$days.value = diffDays;
		
	};
	

	
	//호텔 물어볼 div들이 저장될 리스트
	let divList=[];
	//호텔 선택된 값이 들어갈 리스트
	let hotelList=[];
	function createHotoel(number){
		let hotelTemplate =`
			<label>\${number+1}일차 숙소를 정해주세요</label>
			  <select id='Hotels\${number}' onchange='changeHotelList(\${number}); test()' >
				<option value='NO'>숙소를 선택해주세요</option>
				<option value='LH'>롯데호텔월드(잠실)</option>
				<option value='SH'>신라호텔(동대입구)</option>
				<option value='FH'>페어몬트앰배서더(여의도)</option>
				<option value='IH'>인터컨티넨탈 서울 코엑스</option>
				<option value='HH'>홀리데이인익스프레스서울홍대</option>
				<option value='NS'>서울역8번출구</option>
	  		  </select>
	  		  <br/>
	  		<label>\${number+1}일차 일정 시작 시간을 입력해주세요</label>
	  		<input type="time" id='startTime\${number}' onchange='changeStartTime(\${number})' value="10:00"/>
	  		<label>\${number+1}일차 일정 종료 시간을 입력해주세요</label>
	  		<input type="time" id='endTime\${number}' onchange='changeEndTime(\${number})' value="22:00"/>
	  		  <br/>
		`;
		let div = document.createElement('div');
		div.innerHTML=hotelTemplate;
		document.querySelector('#Hotels').appendChild(div);
		divList.push(div);
		hotelList.push()
	};
	
	//호텔 선택이 바뀔때마다 적용될 함수
	function changeHotelList(number) {
		hotelList[number]=document.querySelector(`#Hotels\${number}`).value;
		$hhh.value=hotelList;
		$selectedHotel.value=hotelList;
		
	};
	
	function createho(number){
		//기존 divList를 통해 입력되어있던 날짜고르는것들을 지운다.
		for(let i=0;i<divList.length;i++){
			divList[i].parentNode.removeChild(divList[i]);
		}
		//인덱스가 넘어갈 수 있으므로 초기화
		divList=[];
		
		//호텔리스트도 초기화
		hotelList=[];
		
		
		for(let i=0;i<number;i++){
			createHotoel(i);
			hotelList.push('NO');	//초기화된 호텔리스트에 날짜 수만큼 안골랐음 을 넣는다!
	}};
	
	function changeStartTime(number){
//		let $startTime=document.querySelector(`#startTime\${number}`);
//		let $endTime=document.querySelector(`#endTime\${number}`);
		changeEndTime(number);
	};

	function changeEndTime(number){
		let $startTime=document.querySelector(`#startTime\${number}`);
		let $endTime=document.querySelector(`#endTime\${number}`);
		if($startTime.value>$endTime.value){
			alert('종료 시간이 시작 시간보다 적을 수 없습니다!');
			$startTime.value="09:00:00";
			$endTime.value="22:00:00";	
			return
		}
		if((new Date("1970-01-01 "+$endTime.value)-new Date("1970-01-01 "+$startTime.value))/(3600*1000)>2){
			alert((new Date("1970-01-01 "+$endTime.value)-new Date("1970-01-01 "+$startTime.value))/3600/1000)
			$startTime.value="09:00:00";
			$endTime.value="22:00:00";	
		}
		
	}
    
	//리스트들~
	
    let locationArray=[$HongikU,$SeoulU,$Bitcamp,$YongsanS,$NowonS,$UijeongbuS,$GyeongbokgungP,$ChangdeokgungP,$GyeongdongM,$StarfieldC,$YonseiU,$SeoulArtsC,$LotteWorld,$WarMemorialH,$WarandWomen,$MangwonM,$Cheonggyecheon,$Dongdaemun,$NamsanT,$Gyeonglidangil,$MuseumofKorea,$ApgujeongHyundaiD,$LotteWorldT,$DreamForest,$GyeonguiLineF,$TrickEyeMuseum,$Dongmyo,$HousesofParliament,$BoramaeP,$AsanMedicalCenter];
    let selectedLocationArray = [];
	
    
//	$hhh.value=hotelArray;
	
		
	//버튼 클릭이벤트 함수
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
	
      


		//이벤트를 달아준다. 굳이 여기 안에 없어도 되는데 왜?. 그냥. 아닌가? 있어야하나? 찾기귀찮다.
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

    
    
	changeStartDate();


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
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
            <label>얼마나 여행하실 예정인가요?
            </label><br>
            <label>시작 날짜를 골라주세요 :</label>
            <input type="date" id="startDate" onchange="changeStartDate()"><br>
            <label>종료 날짜를 골라주세요 :</label>
            <input type="date" id="endDate" onchange="changeEndDate()"><br><br/><br/>
            <div id="Hotels"></div>
            <a href="#" onclick='test()'>테스트함수</a>
            <br>
            <label>관광지를 정해주세요</label><br>
            <div id="locationButton"></div>
            <label id="selected"></label>
            <input type='hidden' id='selectedValue' name="locations"/>
            <input type='hidden' id='selectedHotel' name="hotels"/>
            <input type='hidden' name="city" value='seoul'/>
            <input type='hidden' id='days' name='days'/>
            <input type='hidden' id='timeList' name='timeList'/>
            <input id="sss">
            <br>
            <input id="hhh">
            <br>
            <input id="ttt">
            <br>
            <button id="btn-start">시작</button>
        </form>
        <br>

<script>
  	let map;
  	
  	
	
	const $locationButton = document.querySelector('#locationButton');
	
	function createLocationButton(code,name){
		let lotacionTemplate =`
			<button id=\${code}>\${name}</button>
		`;
		let span = document.createElement('span');  //이 줄과
		span.innerHTML=lotacionTemplate;			//이 줄과
		$locationButton.appendChild(span);			//이 줄만 span->타 태그로 바꾸는것으로 가능. ex)div
	};
	
	<c:forEach var="list" items="${list }">
		createLocationButton('${list.code}','${list.name}')
 	</c:forEach>

  
  	
	<c:forEach var="list" items="${list }">
		const $${list.code} = document.querySelector('#${list.code}')	
	</c:forEach>

    const $selected = document.querySelector('#selected');
    let $selectedValue = document.querySelector('#selectedValue');
    const $sss = document.querySelector('#sss');
    const $hhh = document.querySelector('#hhh');
	const $selectedHotel=document.querySelector('#selectedHotel');
	const $ttt = document.querySelector('#ttt');
	const $timeList=document.querySelector('#timeList');
	
	
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
		console.log($timeList.value);
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
		let diffDays=((new Date($endDate.value)-new Date($startDate.value))/(1000*3600*24)); //ms->sec에 1000 sec->hour에 3600 hour->day에 24 
		createho(diffDays);
		$days.value = diffDays;
		
	};
	

	
	//호텔 물어볼 div들이 저장될 리스트
	let divList=[];
	//호텔 선택된 값이 들어갈 리스트
	let hotelList=[];
	//일정 시간들이 들어갈 리스트.
	let timeList=[];
	function createHotoel(number){
		let hotelTemplate =`
			<label>\${number+1}일차 숙소를 정해주세요</label>
			  <select id='Hotels\${number}' onchange='changeHotelList(\${number}); test()' >
			  	<c:forEach var="hotelList" items="${hotelList}"> 
			  	  <option value='${hotelList.code}'>${hotelList.name}</option>  
				</c:forEach>
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
		
		//호텔리스트도 초기화, 시간리스트도 초기화한다.
		hotelList=[];
		timeList=[];
		
		for(let i=0;i<number;i++){
			createHotoel(i);
			hotelList.push('NO');	//초기화된 호텔리스트에 날짜 수만큼 안골랐음 을 넣는다!
			timeList.push('10');	//초기화된 시간리스트에 기본값 10시간을 넣는다.
		}
		
		$ttt.value=timeList;
		$timeList.value=timeList;
		$hhh.value=hotelList;
		$selectedHotel.value=hotelList;
	    $sss.value = selectedLocationArray;
		
	};
	
	function changeStartTime(number){
		changeEndTime(number);
	};

	function changeEndTime(number){
		let $startTime=document.querySelector(`#startTime\${number}`);
		let $endTime=document.querySelector(`#endTime\${number}`);
		if($startTime.value>$endTime.value){
			alert('종료 시간이 시작 시간보다 적을 수 없습니다!');
			$startTime.value="09:00:00";
			$endTime.value="22:00:00";	
			changeTimeList(number);
			return
		}
		if((new Date("1970-01-01 "+$endTime.value)-new Date("1970-01-01 "+$startTime.value))/(3600*1000)<2){
			alert('최소 일정 시간은 2시간 이상입니다')
			$startTime.value="09:00:00";
			$endTime.value="22:00:00";
		}	
		changeTimeList(number);
		
		
	}
	function changeTimeList(number) {
		let $startTime=document.querySelector(`#startTime\${number}`);
		let $endTime=document.querySelector(`#endTime\${number}`);
		let diffTime=(new Date("1970-01-01 "+$endTime.value)-new Date("1970-01-01 "+$startTime.value))/3600/1000
		timeList[number]=diffTime;
		$ttt.value=timeList;
		$timeList.value=timeList;
		
	};
    
	//리스트들~
	
    let locationArray=[
    	<c:forEach var="list" items="${list }">
		  $${list.code},
	    </c:forEach>
    	
    	
    	];
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
        center: {lat: ${startpoint.lat}, lng: ${startpoint.lng}},
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
		<c:forEach var="list" items="${list }">
		  {position : { lat: ${list.lat}, lng: ${list.lng}}, label:'${list.name}', content:'${list.content}',locationSelected : false},
 	    </c:forEach>
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
		src="https://maps.googleapis.com/maps/api/js?key=YourKey=myMap"></script>
	<script src="/js/test.js"></script>
	<!-- 일단 발급받은 api키. -->

</body>

</html>
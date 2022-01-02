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
  
  <c:forEach var="list" items="${list }">
	 let ${list.code}={position :{lat:${list.lat}, lng: ${list.lng}, wcx:${list.wcongnamulx}, wcy:${list.wcongnamuly}}, label:'${list.name}', content:'${list.content}'};
  </c:forEach>
	
  let ${startpoint.code} ={position :{lat:${startpoint.lat}, lng:${startpoint.lng}, wcx:${startpoint.wcongnamulx}, wcy:${startpoint.wcongnamuly}}, label: '${startpoint.name}', content: '${startpoint.content}'};
   
  <c:forEach var="hotelList" items="${hotelList }">
	let ${hotelList.code}={position :{lat:${hotelList.lat}, lng: ${hotelList.lng}, wcx:${hotelList.wcongnamulx}, wcy:${hotelList.wcongnamuly}}, label:'${hotelList.name}', content:'${hotelList.content}'};
  </c:forEach>
	

  const $plans = document.querySelector('#plans');
  
  let daysList = []

  
//  let locations = ${dayPlan}; 원래 마커는 한번에 리스트에 넣고 띄우려고 했었음. 수정함.

  
  <c:forEach var="list" items="${dayPlan }">
  	daysList.push([${list}]);  //만일 "${list}"로 받아버릴 경우, 문자열이 된다. 이를 split(',') 해서 문자로 사용이 가능하다.
  </c:forEach>
//  console.log(daysList[1][0]);
//  //사용설명->daysList[i] 는 i일차 일정정보를 다 담고있다. daysList[i][j]는 i일차의 j번째 일정이 된다.

  
  let map
  let polyLineList=[]
  let markerList=[]
    function myMap() {
    	
      let mapProp = {
    	center: {lat: ${startpoint.lat}, lng: ${startpoint.lng}},
        zoom: 13,
      }; //맵의 기본적인것을 조정하는 객체 리터럴. center가 시작점.
      //zoom은 몇배줌이 될것인가? 1세계 5대륙, 10도시, 15거리, 20건물 이라한다.
      map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

	  
	  
      //선긋기
      for(let i=0;i<daysList.length;i++){
    	  let innerList=[]
    	  
    	  
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
	          innerList.push(flightPath)
	          //flightPath.setMap(map);	 
	      }// jfor end
	      polyLineList.push(innerList);
      }//ifor end
      


	  //마커달기. 중복마커를 해결해야 한다. 관광지의 경우 중복이 나올 가능성은 거의 없다고 보고 있지만, 호텔의 경우 중복이 나올 가능성이 높다
	  
	  const iconImage='/image/marker.PNG'
	  
      for (let i = 0; i < daysList.length; i++) {
    	  let innerList=[];
    	  for(let j = 0; j<daysList[i].length; j++){
    		 const infoWindow = new google.maps.InfoWindow();
    		 
	         let mker = new google.maps.Marker({
	            position: daysList[i][j].position,
	            label: daysList[i][j].label,
	            title: daysList[i][j].content,
	            icon: iconImage,
	            });
	         mker.addListener("click", () => {
	             infoWindow.setContent(mker.getTitle());
	             infoWindow.open(mker.getMap(), mker);
	           });
	         innerList.push(mker); 
      		}//for j end
    	  markerList.push(innerList);
      }//for i end
	  
      //버튼,계획 달기
	  for(let i=0;i<daysList.length;i++){
		  addButton(i)  
	  }//for end
	  
	  for(let i=0;i<daysList.length;i++){
		  printPlan(i)
	  }
	  
      
	  showLine(-1);
      
    }//myMap end
    	
    
      function addButton(number){
    		let planTemplate =`
    			<input type="button" value=\${number+1}일차 onClick=showPlan(\${number});showLine(\${number})></input>
    		`; 		
    		let span = document.createElement('span');
    		span.innerHTML=planTemplate;
    		$plans.appendChild(span)
    		
    		if(number==daysList.length-1){
        		planTemplate =`
        			<input type="button" value=전체보기 onClick=showPlan(-1);showLine(-1)></input>

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
    				let kakaoTemplate=`<a href="https://map.kakao.com/?sX=\${daysList[number][i].position.wcx}&sY=\${daysList[number][i].position.wcy}
						&sName=\${daysList[number][i].label}&eX=\${daysList[number][i+1].position.wcx}&eY=\${daysList[number][i+1].position.wcy}&eName=\${daysList[number][i+1].label}"
						target=_blank>-></a>`
    				//console.log(kakaoTemplate);

    				let span = document.createElement('span');
    	    		span.innerHTML=kakaoTemplate;
    				document.querySelector(`#dayPlan\${number}`).appendChild(span)
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
      
      function showLine(number) {
    	    if (number != -1) {
    	        for (let i = 0; i < polyLineList.length; i++) {
    	            for (let j = 0; j < polyLineList[i].length; j++) {
    	                polyLineList[i][j].setMap(null);
    	            }
    	        }
    	        for (let j = 0; j < polyLineList[number].length; j++) {
    	            polyLineList[number][j].setMap(map);
    	        }
    	        
    	        for (let i = 0; i < markerList.length; i++) {
    	            for (let j = 0; j < markerList[i].length; j++) {
    	                markerList[i][j].setMap(null);
    	            }
    	        }
    	        for (let j = 0; j < markerList[number].length; j++) {
    	            
    	            markerList[number][j].setMap(map);
    	        }

    	    } else if (number == -1) {
    	        for (let i = 0; i < polyLineList.length; i++) {
    	            for (let j = 0; j < polyLineList[i].length; j++) {
    	                polyLineList[i][j].setMap(map);
    	            }
    	        }
    	        for (let i = 0; i < polyLineList.length; i++) {
    	            for (let j = 0; j < markerList[i].length; j++) {
    	                markerList[i][j].setMap(map);
    	            }
    	        }
    	    }
    	}

    

  </script>

</body>

  <script
    src="https://maps.googleapis.com/maps/api/js?key=InsertYourKey&callback=myMap"></script>

  <!--  일단 발급받은 api키. -->


</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Insert title here</title>

</head>
<body>

	<div id="map" style="width:500px;height:400px;"></div>
	<br/>
	<br/>
	<br/>
	<div id="result">
		<label>콩나물 파서~</label>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=InsertYourKey"></script>
	<script>
		//////////////////////////////////////////////////////////////
		var container = document.getElementById('map');				//
		var options = {												//
			center: new kakao.maps.LatLng(33.450701, 126.570667),	//
			level: 3												//
		};															//
		var map = new kakao.maps.Map(container, options);			//
		//////////////////////////////////////////////////////////////
		
		
		let touristattractionList=[];
		let startpointList=[]
		let hotelList=[];
		
		
		<c:forEach var="list" items="${list }">
	 		let ${list.code}={position :{lat:${list.lat}, lng: ${list.lng}}, label:'${list.name}', content:'${list.content}'};
	 		touristattractionList.push(${list.code});
  		</c:forEach>
	
  		let ${startpoint.code} ={position :{lat:${startpoint.lat}, lng:${startpoint.lng}}, label: '${startpoint.name}', content: '${startpoint.content}'} ;
  		startpointList.push(${startpoint.code});
   
  	  	<c:forEach var="hotelList" items="${hotelList }">
  			let ${hotelList.code}={position :{lat:${hotelList.lat}, lng: ${hotelList.lng}}, label:'${hotelList.name}', content:'${hotelList.content}'};
  			hotelList.push(${hotelList.code})
   		</c:forEach>

  /*
  		for(let i=0;i<touristattractionList.length;i++)	{
  			let latlng=new kakao.maps.LatLng(touristattractionList[i].position.lat,touristattractionList[i].position.lng);
  			console.log(touristattractionList[i].label)
  			console.log(latlng.toCoords().toString());
  			console.log(" ")
  		}
	*/	
  		for(let i=0;i<startpointList.length;i++)	{
  			let latlng=new kakao.maps.LatLng(startpointList[i].position.lat,startpointList[i].position.lng);
  			console.log(startpointList[i].label)
  			console.log(latlng.toCoords().toString());
  			console.log(" ")
  		}
  		/*
  		for(let i=0;i<hotelList.length;i++)	{
  			let latlng=new kakao.maps.LatLng(hotelList[i].position.lat,hotelList[i].position.lng);
  			console.log(hotelList[i].label)
  			console.log(latlng.toCoords().toString());
  			console.log(" ")
  		}
   		*/
  		
	</script>

</body>
</html>
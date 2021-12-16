package com.bit.wheregoing.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import org.springframework.stereotype.Service;


@Service
public class TestService {
	
	//갱신최단거리경로
	public String shortest(String city,String locations) {

		//city를 이용해서 DB에서 도시를 서치해서 출발지를 꺼내온다. 예시에서는 서울이니까 서울역을 가져옴
		Location start = new Location().builder().city(city).locations("SeoulS").build();
		start.setLat(37.553017);
		start.setLng(126.9376271);
		List<Location> locationList = new ArrayList<Location>();
		locationList.add(start);
		
		String[] locationSplit = locations.split(",");
		
		for(int i=0;i<locationSplit.length;i++) {
			Location loc = new Location().builder().city(city).locations(locationSplit[i]).build();
			locationList.add(loc);
		}
			
		
		//관광지를 이용해서 DB에서 위도경도를 꺼내온다. 일단 임의로 붙인다.
		locationList = locationSet(locationList);
		
		
		//두 점 사이의 거리로 갑시다. 왜냐? 마이로도 산을뚫고 가게하니까.
		
		for(int i=0;i<locationList.size();i++) {
			double distance=0;
			for(int j=i+1;j<locationList.size();j++) {
				double newDistance = twoPointDistance(locationList.get(i),locationList.get(j));
//				System.out.println(locationList.get(i).getLocations()+"과"+locationList.get(j).getLocations()+"의비교");
//				System.out.println(newDistance);
				if(distance==0) {
					distance=newDistance;
				}
				if(newDistance<distance) {
					Collections.swap(locationList, i+1, j);
					distance = newDistance;
				}

			}
			
		}
		
		String returnString="";
		
		for(int i=0;i<locationList.size();i++) {
//			System.out.println(locationList.get(i).getLocations());
			
			if(i==locationList.size()-1) {
				returnString+=locationList.get(i).getLocations();
			}
			else {
			returnString+=locationList.get(i).getLocations()+",";
			}
			
		}
//		System.out.println("333333333333");
//		System.out.println(returnString);
		
		
		return returnString;
	}
	
	//두점사이의거리
	public static double twoPointDistance(Location location, Location location2) {
		double a_lat=location.getLat();
		double a_lng=location.getLng();
		double b_lat=location2.getLat();
		double b_lng=location2.getLng();
		
		double distance = Math.sqrt(Math.pow((a_lat-b_lat),2)+Math.pow((a_lng-b_lng),2));
		return distance;
	}
	
	
	
	public List<String> wg(int days, String city,String locations,String hotels) {
		//days->몇일을 받을것인가? 
		//city->서울고정일것이다.
		//locations->컴마로 구분된 스트링으로 위치들이 적혀있음
		//hotels->컴마로 구분된 스트링으로 호텔 위치들이 적혀있음.
		double distance = standardDistance(city); //일단서울세팅. 실제에선 다르게 받으면 되겠지? 값은 임시적으로 0.05로 잡음.
		
		//토탈 일정을 관리할 리스트를 뽑음.
		List<List<Location>> dayslist = new ArrayList<List<Location>>();
		//토탈 일정을 관리할 리스트 안에 일자별 리스트를 넣음.
		for(int i=0; i<days; i++) {
			List<Location> innerList = new ArrayList<Location>();
			dayslist.add(innerList);
		}
		
		//기본 시작 위치인 서울을 세팅. 시작은 서울역이다.
		Location start = new Location().builder().city(city).locations("SeoulS").lat(37.55307).lng(126.9376271).build();
		dayslist.get(0).add(start);
		
		///////////////////////////////
		
		//여행지들의 정보가 담긴 리스트->locationList
		List<Location> locationList = new ArrayList<Location>();
		String[] locationSplit = locations.split(",");
		for(int i=0;i<locationSplit.length;i++) {
			Location loc = new Location().builder().city(city).locations(locationSplit[i]).build();
			locationList.add(loc);
		}
		//관광지를 이용해서 DB에서 위도경도를 꺼내온다. 일단 임의로 붙인다.
		locationList=locationSet(locationList);
		//호텔의 정보가 담긴 리스트->hotelList를 만든다. 똑같이 split을 한 다음에, 조금 다른것이 if문으로 NS일경우 LH로 보내자. 
		List<Location> hotelList = new ArrayList<Location>();
		String[] hotelSplit = hotels.split(",");
		for(int i=0;i<hotelSplit.length;i++) {
			Location hoLoc = new Location().builder().city(city).locations(hotelSplit[i]).build();
			hotelList.add(hoLoc);
		}
		//호텔을 이용해서 DB에서 위도 경도를 꺼내온다. 일단 임의로 붙인다.
		hotelList=hotelSet(hotelList);
		
		///////////////////////////////
		//선점하기
		//i=0번에 각 기본 호텔을 보내면 될거 같은데?
	
		for(int i=0;i<dayslist.size();i++) {
			dayslist.get(i).add(hotelList.get(i));
		}//해당 연산을 진행하면, 데이리스트(1)에는 서울역,1일차호텔. 데이리스트(2)에는 2일차호텔, 데이리스트(3)에는 3일차호텔... 이런식으로 데이리스트가 존재하는한 앞에서부터 호텔이 채워진다.
				
		//현재 1일차 인덱스 두개, 2일차~마지막날 1개인 상황.
		for(int i=0;i<dayslist.size();i++) {
			List<Double> distanceList = new ArrayList<Double>();
			for(int j=0;j<locationList.size();j++) {
			//두 점 사이의 거리중 가장 짧은 점을 찾는다. i일차의 마지막 지점과, 장소들 리스트 사이의 두점사이의 거리를 구한다. 이것을 리스트에 담자.
				distanceList.add(twoPointDistance(dayslist.get(i).get(dayslist.get(i).size()-1),locationList.get(j)));
				//최단거리를 찾고 그때의 j값을 알아야 하는데? j를 같이넣는다? 그럼소트가애매한데.
				//리스트에 넣지 않고 해결하는 방법? 해시맵으로 이때의 j값에 따른 두점사이의 거리를 구해서, 밸류를 낮은순으로 소팅한 뒤 그때의 key값을 따면 j를 알 수 있다?
				//거리가 적으면, 위치로 소트해버렸던 최단거리루트를 이용하는 방법은 어떤가?
				//리스트에서 빼버리면되지 그룹된건.. .그러면 매번 리스트에서 가장 짧은걸 찾으면 된다. 만약 리스트가 원본보다 적다면, distance를 줄여서 다시 함수를 재귀 실행한다.
			}
			Collections.sort(distanceList); //최단거리순으로 소트가 완료됐다.
			
		}
		
		

		
		
		List<String> returnList = new ArrayList<String>(); //길이가 일(日)자인 리스트를 만든다.
		
		for(int i=0;i<dayslist.size();i++) {
			System.out.println(i+"박차");
			
			String listString="";
			
			for(int j=0;j<(dayslist.get(i)).size();j++) {
				System.out.println(((Location) dayslist.get(i).get(j)).getLocations());
				listString += (dayslist.get(i).get(j)).getLocations();
				if(j!=dayslist.get(i).size()-1) {
					listString +=",";
				}
			}
			returnList.add(listString);
				
			}
		
		
//		for(int i=0;i<returnList.size();i++) {
//			System.out.println(i+"박차 리스트");
//			System.out.println(returnList.get(i));
//		}
//		
//		System.out.println("데이터를받아보자");
//		System.out.println(timeToDestination(dayslist.get(0).get(0),dayslist.get(0).get(1),dayslist.get(0).get(2)));
		
		
		return returnList;
	}
	
	//그룹화를 위한 기본거리. DB가 없어요..
	public static double standardDistance(String city) {
		double distance=0;
		
		if(city.equals("seoul")) {
			
			distance=0.05;
			}
		
		
		return distance;
		
	}
	
	//위치정보. DB가없어요..
	public static List<Location> locationSet(List<Location> locationList){
		for(int i=0;i<locationList.size();i++) {
			if(locationList.get(i).getLocations().equals("HongikU")) {
				locationList.get(i).setLat(37.5515814);
				locationList.get(i).setLng(126.9227864);
			};
			if(locationList.get(i).getLocations().equals("SeoulU")) {
				locationList.get(i).setLat(37.4565095);
				locationList.get(i).setLng(126.9478498);
			};
			if(locationList.get(i).getLocations().equals("Bitcamp")) {
				locationList.get(i).setLat(37.499506);
				locationList.get(i).setLng(127.028964);
			};
			if(locationList.get(i).getLocations().equals("YongsanS")) {
				locationList.get(i).setLat(37.5294194);
				locationList.get(i).setLng(126.9628168);
			};
			if(locationList.get(i).getLocations().equals("NowonS")) {
				locationList.get(i).setLat(37.654527);
				locationList.get(i).setLng(127.058357);
			};
			if(locationList.get(i).getLocations().equals("UijeongbuS")) {
				locationList.get(i).setLat(37.7387295);
				locationList.get(i).setLng(127.0436968);
			};
			if(locationList.get(i).getLocations().equals("SeoulS")) {
				locationList.get(i).setLat(37.553017);
				locationList.get(i).setLng(126.9376271);
			};
			if(locationList.get(i).getLocations().equals("GyeongbokgungP")) {
			    locationList.get(i).setLat(37.585055084889504);   
			    locationList.get(i).setLng(126.97659114710879);
			};
			    if(locationList.get(i).getLocations().equals("ChangdeokgungP")) {
			    locationList.get(i).setLat(37.58634363065633);  
			    locationList.get(i).setLng(126.99181662454347); 
			};
			    if(locationList.get(i).getLocations().equals("GyeongdongM")) {
			    locationList.get(i).setLat(37.58634363065633);  
			    locationList.get(i).setLng(127.03885184117183); 
			};
			    if(locationList.get(i).getLocations().equals("StarfieldC")) {
			    locationList.get(i).setLat(37.516935759039576);  
			    locationList.get(i).setLng(127.06082449711501);
			};
			    if(locationList.get(i).getLocations().equals("YonseiU")) {
			    locationList.get(i).setLat(37.57273933928159);  
			    locationList.get(i).setLng(126.94066153463814); 
			};
			    if(locationList.get(i).getLocations().equals("SeoulArtsC")) {
			    locationList.get(i).setLat(37.48615788106978);  
			    locationList.get(i).setLng(127.0144759255438); 
			};
			    if(locationList.get(i).getLocations().equals("LotteWorld")) {
			    locationList.get(i).setLat(37.51611881086883);  
			    locationList.get(i).setLng(127.09756003082893); 
			};
			    if(locationList.get(i).getLocations().equals("WarMemorialH")) {
			    locationList.get(i).setLat(37.54144003511956);  
			    locationList.get(i).setLng(126.97739706863972); 
			};
			    if(locationList.get(i).getLocations().equals("WarandWomen")) {
			    locationList.get(i).setLat(37.56321485582398);  
			    locationList.get(i).setLng(126.91525565084426); 
			};
			    if(locationList.get(i).getLocations().equals("MangwonM")) {
			    locationList.get(i).setLat(37.55797587095626);  
			    locationList.get(i).setLng(126.90581427524369); 
			};
			    if(locationList.get(i).getLocations().equals("Cheonggyecheon")) {
			    locationList.get(i).setLat(37.57049439232437);  
			    locationList.get(i).setLng(126.97842703697813); 
			};
			    if(locationList.get(i).getLocations().equals("Dongdaemun")) {
			    locationList.get(i).setLat(37.57189986111966);  
			    locationList.get(i).setLng(127.00942945048725); 
			};
			    if(locationList.get(i).getLocations().equals("NamsanT")) {
			    locationList.get(i).setLat(37.55210095403334);  
			    locationList.get(i).setLng(126.98840093234205); 
			};
			    if(locationList.get(i).getLocations().equals("Gyeonglidangil")) {
			    locationList.get(i).setLat(37.53954531316697);  
			    locationList.get(i).setLng(126.98724221827294); 
			};
			    if(locationList.get(i).getLocations().equals("MuseumofKorea")) {
			    locationList.get(i).setLat(37.585055084889504);  
			    locationList.get(i).setLng(126.97659114710879);
			};
			    if(locationList.get(i).getLocations().equals("ApgujeongHyundaiD")) {
			    locationList.get(i).setLat(37.528927511851386);  
			    locationList.get(i).setLng(127.0275826412121); 
			};
			    if(locationList.get(i).getLocations().equals("LotteWorldT")) {
			    locationList.get(i).setLat(37.51306405337366);  
			    locationList.get(i).setLng(127.10191633106517); 
			};
			    if(locationList.get(i).getLocations().equals("DreamForest")) {
			    locationList.get(i).setLat(37.622144056950226);  
			    locationList.get(i).setLng(127.04072049860147);
			};
			    if(locationList.get(i).getLocations().equals("GyeonguiLineF")) {
			    locationList.get(i).setLat(37.55956021204483);  
			    locationList.get(i).setLng(126.92546487452844); 
			};
			    if(locationList.get(i).getLocations().equals("TrickEyeMuseum")) {
			    locationList.get(i).setLat(37.553734192808186);  
			    locationList.get(i).setLng(126.92163874302071);
			};
			    if(locationList.get(i).getLocations().equals("Dongmyo")) {
			    locationList.get(i).setLat(37.573283023567186);  
			    locationList.get(i).setLng(127.01654927557925);
			};
			    if(locationList.get(i).getLocations().equals("HousesofParliament")) {
			    locationList.get(i).setLat(37.528261036136726);  
			    locationList.get(i).setLng(126.91772552193481);
			};
			    if(locationList.get(i).getLocations().equals("BoramaeP")) {
			    locationList.get(i).setLat(37.49392707859974);  
			    locationList.get(i).setLng(126.91879809805897); 
			};
			    if(locationList.get(i).getLocations().equals("AsanMedicalCenter")) {
			    locationList.get(i).setLat(37.527439583874866);  
			    locationList.get(i).setLng(127.10889139526071); 
			};
		}
		
		
		
		return locationList;
	}

	//호텔정보. DB가 없어요..
	public static List<Location> hotelSet(List<Location> hotelList){
		for(int i=0;i<hotelList.size();i++) {
			if(hotelList.get(i).getLocations().equals("NO")) {//안고르면 일단 롯데호텔로 보냄.
				hotelList.get(i).setLocations("LH");
				hotelList.get(i).setHotels("LH");
				hotelList.get(i).setLat(37.52069065226224);
				hotelList.get(i).setLng(127.09751421852974);
			};
			if(hotelList.get(i).getLocations().equals("LH")) {
				hotelList.get(i).setHotels("LH");
				hotelList.get(i).setLat(37.52069065226224);
				hotelList.get(i).setLng(127.09751421852974);
			};
			if(hotelList.get(i).getLocations().equals("SH")) {
				hotelList.get(i).setHotels("SH");
				hotelList.get(i).setLat(37.55829809520702);
				hotelList.get(i).setLng(127.00946954497128);
			};
			if(hotelList.get(i).getLocations().equals("FH")) {
				hotelList.get(i).setHotels("FH");
				hotelList.get(i).setLat(37.52774053938984);
				hotelList.get(i).setLng(126.93555005608506);
			};
			if(hotelList.get(i).getLocations().equals("IH")) {
				hotelList.get(i).setHotels("IH");
				hotelList.get(i).setLat(37.51352707438062);
				hotelList.get(i).setLng(127.05739992550794);
			};
			if(hotelList.get(i).getLocations().equals("HH")) {
				hotelList.get(i).setHotels("HH");
				hotelList.get(i).setLat(37.56578757493458);
				hotelList.get(i).setLng(126.92828971495234);
			};
			if(hotelList.get(i).getLocations().equals("NS")) {
				hotelList.get(i).setHotels("NS");
				hotelList.get(i).setLat(37.55610380930567);
				hotelList.get(i).setLng(126.97345003934156);
			};
		}
		
		return hotelList;
	}
	
	//카카오내비 길찾기에 REST API를 이용하여 A->B->C , A-B , B-C 사이의 거리를 정수값으로 변환된 시간을 받는 메소드 
	public static String timeToDestination(Location first, Location second, Location third) {
		String origin = first.getLng()+","+first.getLat();
		String waypoints = second.getLng()+","+second.getLat();
		String destination = third.getLng()+","+third.getLat();
		String url = "https://apis-navi.kakaomobility.com/v1/directions?origin="+origin+"&destination="+destination+"&waypoints="+waypoints;
		String addr = "";
		try {
			addr = getTimeToDestination(getJSONData(url));
		}catch (Exception e) {
			System.out.println("주소 api 요청 에러");
			e.printStackTrace();
		}
		
		return addr;
	}
	
	//REST API로 통신하여 받은 JSON 형태의 데이터를 String으로 받아오는 메소드.
	public static String getJSONData(String apiUrl) throws Exception {
		
		HttpURLConnection conn = null;
		StringBuffer response = new StringBuffer();
		
		//인증키
		String restAPIKey="InputYourKey";
		String auth = "KakaoAK "+restAPIKey;
		//URL 설정
		URL url = new URL(apiUrl);
		
		conn = (HttpURLConnection) url.openConnection();
		
		//Request 형식 설정
		conn.setRequestMethod("GET");
		//conn.setRequestProperty("X-Requested-With", "curl"); ->왜 필요한가?
		conn.setRequestProperty("Authorization", auth);
		
		//request에 JSON data 준비
		conn.setDoOutput(true);
		
		int responseCode = conn.getResponseCode();
		    if (responseCode == 400) {
		        System.out.println("400:: 해당 명령을 실행할 수 없음");
			} else if (responseCode == 401) {
			    System.out.println("401:: Authorization가 잘못됨");
			} else if (responseCode == 500) {
			    System.out.println("500:: 서버 에러, 문의 필요");
			} else { // 성공 후 응답 JSON 데이터받기
		 
				Charset charset = Charset.forName("UTF-8");
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));
		     
				String inputLine;
		    while ((inputLine = br.readLine()) != null) {
		     	response.append(inputLine); 
		    } 
		 }
		 
		 return response.toString();
	}
	
	//받은 JSON 파일을 파싱한다.
	public static String getTimeToDestination(String jsonString) {
		String value="";
		JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
		
		JSONArray routes = (JSONArray) jObj.get("routes");
		JSONObject routesFirstArray = (JSONObject) routes.get(0);
		JSONArray sectionsFirst = (JSONArray) routesFirstArray.get("sections");
		JSONObject sectionFirstArray = (JSONObject) sectionsFirst.get(0);
		long durationFirst = (long) sectionFirstArray.get("duration");
		JSONObject sectionSecondArray = (JSONObject) sectionsFirst.get(1);
		long durationSecond = (long) sectionSecondArray.get("duration");
		
		double firstHour = (double) durationFirst/3600;
		double seconHour = (double) durationSecond/3600;
		
		String aa =  Double.toString(firstHour);
		String bb =  Double.toString(seconHour);
		
		value = aa+"테스트"+bb;
		return value;
	}
	
}
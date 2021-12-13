package com.bit.wheregoing.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;


@Service
public class TestService {
	
	public String shotest(String city,String locations) {

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
		}
		
		
		List<Location> tempList = new ArrayList<Location>();
		
		//두 점 사이의 거리로 갑시다. 왜냐? 마이로도 산을뚫고 가게하니까.
		
		for(int i=0;i<locationList.size();i++) {
			double distance=0;
			for(int j=i+1;j<locationList.size();j++) {
				double newDistance = twoPointDistance(locationList.get(i).getLat(),locationList.get(i).getLng(), locationList.get(j).getLat(), locationList.get(j).getLng());
				System.out.println(locationList.get(i).getLocations()+"과"+locationList.get(j).getLocations()+"의비교");
				System.out.println(newDistance);
				if(distance==0) {
					distance=newDistance;
				}
				if(newDistance<distance) {
					Collections.swap(locationList, i+1, j);
					distance = newDistance;
				}
			
			//Collections.swap(tempList, i, j);
			
			}
			
		}
		
		String returnString="";
		
		for(int i=0;i<locationList.size();i++) {
			System.out.println(locationList.get(i).getLocations());
			
			if(i==locationList.size()-1) {
				returnString+=locationList.get(i).getLocations();
			}
			else {
			returnString+=locationList.get(i).getLocations()+",";
			}
			
		}
		System.out.println("333333333333");
		System.out.println(returnString);
		
		
		return returnString;
	}
	
	
	public static double twoPointDistance(double a_lat, double a_lng, double b_lat, double b_lng) {
		double distance = Math.sqrt(Math.pow((a_lat-b_lat),2)+Math.pow((a_lng-b_lng),2));
		return distance;
	}
	
	
	
	
}

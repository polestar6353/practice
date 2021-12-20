package com.bit.wheregoing.test.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Location {
	private String city;
	private String locations;
	
	private double lat;
	private double lng;
	
	
	
	//호텔편하게쓰려고.
	private String hotels;
	//그룹화를 위함.->DB에서는 null로 처리.
	private String group;
	//일정 분배를 위함
	//사용자가 관람하고자 하는 시간
	private double tourTime;
}

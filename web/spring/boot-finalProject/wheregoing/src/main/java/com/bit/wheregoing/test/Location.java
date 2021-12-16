package com.bit.wheregoing.test;

import java.util.List;

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
	private String hotels;
	
	private double lat;
	private double lng;
	
	//그룹화를 위함.->DB에서는 null로 처리.
	private String group;
}

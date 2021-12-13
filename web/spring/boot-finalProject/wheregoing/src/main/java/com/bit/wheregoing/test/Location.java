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
	
	private double lat;
	private double lng;
}

package com.bit.wheregoing.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.wheregoing.test.model.Hotels;
import com.bit.wheregoing.test.model.Startpoint;
import com.bit.wheregoing.test.model.TouristAttraction;
import com.bit.wheregoing.test.repository.HotelsRepository;
import com.bit.wheregoing.test.repository.StartpointRepository;
import com.bit.wheregoing.test.repository.TouristAttractionRepository;

@Service
public class IndexToCity {
	@Autowired
	private TouristAttractionRepository touristAttractionRepository;
	
	@Autowired
	private HotelsRepository hotelsRepository;
	
	@Autowired
	private StartpointRepository startpointRepository;
	
	
	public List<TouristAttraction> touristAttractionList(String city) {
		List<TouristAttraction> list= touristAttractionRepository.findAllByCity(city);
		return list;
	}
	
	public List<Hotels> hotelsList(String city) {
		List<Hotels> list = hotelsRepository.findAllByCity(city);
		return list;
	}
	
	public Startpoint setStartPoint(String city) {
		Startpoint startpoint = startpointRepository.findByCity(city);
		
		return startpoint;
	}
	
}

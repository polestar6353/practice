package com.bit.wheregoing.test.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.wheregoing.test.model.Hotels;
import com.bit.wheregoing.test.model.Location;
import com.bit.wheregoing.test.model.Startpoint;
import com.bit.wheregoing.test.model.TouristAttraction;
import com.bit.wheregoing.test.service.IndexToCity;
import com.bit.wheregoing.test.service.TestService;



@Controller
public class TestController {
	
	
	@Autowired
	TestService testservice;
	
	@Autowired
	IndexToCity indexToCity;
	
	
	@GetMapping({"","/"})
	public String index() {
		
		return "test/main";
	}
	
	@GetMapping("/city")
	public String citySeoul(Model model,String city) {
		
		List<TouristAttraction> list = indexToCity.touristAttractionList(city);
		List<Hotels> hotelList = indexToCity.hotelsList(city);
		Startpoint startpoint = indexToCity.setStartPoint(city);
		model.addAttribute("list",list);
		model.addAttribute("hotelList",hotelList);
		model.addAttribute("startpoint",startpoint);
		return "test/maptest";
	}

	@RequestMapping("/newmap-result")
	public String result(Location location, Model model,int days,String city,String timeList) {

//		String locations=location.getLocations();
//		String hotels=location.getHotels();
		//System.out.println(locations);
		
//		System.out.println(hotels);
//		System.out.println("-------");
//		System.out.println(days);
//		System.out.println("-------");
//		System.out.println(city);
		System.out.println(timeList);

		
		
//		String shortest = testservice.shortest(location.getCity(),location.getLocations()); 최단거리. 안씀. 다 완성되면 지울것.
		
		List<String> dayslist = testservice.wg(days, location.getCity(), location.getLocations(), location.getHotels(),timeList);
		
//		for(int i=0;i<dayslist.size();i++) {
//			System.out.println(i+"박차 리스트");
//			System.out.println(dayslist.get(i));
//		}
		
		//dayslist.set(0, testservice.shortest("seoul",dayslist.get(0)));
		
		List<TouristAttraction> list = indexToCity.touristAttractionList(city);
		List<Hotels> hotelList = indexToCity.hotelsList(city);
		Startpoint startpoint = indexToCity.setStartPoint(city);
		
		model.addAttribute("list",list);
		model.addAttribute("hotelList",hotelList);
		model.addAttribute("startpoint",startpoint);
		model.addAttribute("dayPlan",dayslist);
		return "test/mapresult";
	}
	
	
}

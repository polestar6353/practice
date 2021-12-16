package com.bit.wheregoing.test;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class TestController {
	
	
	@Autowired
	TestService testservice;
	
	@GetMapping({"","/"})
	public String index() {
		
		return "test/maptest";
	}
	
	

	@RequestMapping("/newmap-result")
	public String result(Location location, Model model,int days,String city,String timeList) {

		String locations=location.getLocations();
		String hotels=location.getHotels();
		//System.out.println(locations);
		
//		System.out.println(hotels);
//		System.out.println("-------");
//		System.out.println(days);
//		System.out.println("-------");
//		System.out.println(city);
		System.out.println(timeList);

		
		
		String shortest = testservice.shortest(location.getCity(),location.getLocations());
		
		List<String> dayslist = testservice.wg(days, location.getCity(), location.getLocations(), location.getHotels());
		
//		for(int i=0;i<dayslist.size();i++) {
//			System.out.println(i+"박차 리스트");
//			System.out.println(dayslist.get(i));
//		}
		
		//dayslist.set(0, testservice.shortest("seoul",dayslist.get(0)));
		
		
		model.addAttribute("dayPlan",dayslist);
		return "test/mapresult";
	}
	
	
}

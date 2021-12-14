package com.bit.wheregoing.test;



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
	public String result(Location location, Model model,int days,String city) {

		String locations=location.getLocations();
		String hotels=location.getHotels();
		//System.out.println(locations);
		
//		System.out.println(hotels);
//		System.out.println("-------");
//		System.out.println(days);
//		System.out.println("-------");
//		System.out.println(city);
		
		String shortest = testservice.shotest(location.getCity(),location.getLocations());
		
		String wg = testservice.wg(days, location.getCity(), location.getLocations(), location.getHotels());

		
//		String[] locationList = locations.split(",");
//		
//		for(int i=0;i<locationList.length;i++) {
//			System.out.println(locationList[i]);
//		}
		
		

		model.addAttribute("arr",shortest);
		return "test/mapresult";
	}
	
	
}

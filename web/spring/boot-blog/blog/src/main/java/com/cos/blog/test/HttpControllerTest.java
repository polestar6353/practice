package com.cos.blog.test;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HttpControllerTest {
	
	private static final String TAG = "HttpControllerTest:";
	
	@GetMapping("/http/lombok")
	public String lombokTest() {
		
		Member m1 = Member.builder().username("ssar").password("1234").email("email").build();
		System.out.println(TAG+"getter:"+m1.getId());
		m1.setId(5000);
		System.out.println(TAG+"getter:"+m1.getId());
		return "lombok test 완료";
	}
	
	@GetMapping("/http/get")
	public String getTest(Member mem) {
		
		Member m2 = new Member();
		
		return "get 요청: "+mem.getId()+","+mem.getUsername()+","+mem.getEmail();
	}
	
	@PostMapping("/http/post")
	public String postTest() {
		return "post 요청";
	}
	
	@PutMapping("/http/put")
	public String putTest() {
		return "put 요청";
	}
	
	@DeleteMapping("/http/delete")
	public String deleteTest() {
		return "delete 요청";
	}


}

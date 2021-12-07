package com.cos.blog.controller.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.controller.dto.ResponseDto;
import com.cos.blog.model.User;
import com.cos.blog.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) {
		System.out.println("UserApiController:save 호출됨");
		int result = userService.save(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),result);
	}
	
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody User user){
		userService.userUpdate(user);
		//여기서는 트랜잭션이 종료되기 떄문에 DB값은 변경이 됐음.
		
		//세션은 변경되지 않은 상태이기 떄문에 우리가 직접 변경해 줘야 한다.
		//세션 등록(변경완료시 변경된 값으로 세션 변경)
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
}


////전통적 로그인 방법
//@PostMapping("/api/user/login")
//public ResponseDto<Integer> login(@RequestBody User user, HttpSession session){
//	System.out.println("UserApiController:login 호출됨");
//	User principal = userService.login(user); //princital->접근주체
//	
//	if(principal!=null) {
//		session.setAttribute("principal", principal);
//	}
//	return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//}
//

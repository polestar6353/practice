package com.cos.blog.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.RoleType;
//스프링워크의 Transactional을 import 해야한다.
import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;

//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. IoC를 해준다.
@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Transactional //스프링워크의 Transactional을 import 해야한다.
	public int save(User user) {
		
		try {
			String rawPassword = user.getPassword();//원문
			String encPAssword = encoder.encode(rawPassword);//해쉬
			user.setPassword(encPAssword);
			user.setRole(RoleType.USER);
			userRepository.save(user);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("UserService : 회원가입() : "+e.getMessage());
		}
		return -1;
	}
	
}

////전통적인 로그인 방식
//@Transactional(readOnly=true) //Select할때 트랜잭션 시작, 서비스 종료시에 트랜잭션 종료(정합성)
////스프링워크의 Transactional을 import 해야한다.
//public User login(User user) {
//	return userRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
//}


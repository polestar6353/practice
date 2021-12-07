package com.cos.blog.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	@Transactional
	public void userUpdate(User user) {
		//수정시에는 영속성 컨텍스트 User 오브젝트를 영속화시키고, 영속화된 User 오브젝트르 수정
		//select 해서 User오브젝트를 DB로부터 가져오는 이유는 영속화를 하기 위해서!!
		//영속화된 오브젝트를 변경하면 자동으로 DB에서 Update를 날려주기 때문.
		User persistance = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("회원 찾기 실패");
		});
		
		//validate 체크. 외부 계정 로그인(oauth필드에 값이 있는) 이용자는 패스워드,이메일 수정을 못함.
		if(persistance.getOauth()==null || persistance.getOauth().equals("")) {
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			System.out.println(rawPassword);
			persistance.setPassword(encPassword);
			persistance.setEmail(user.getEmail());
		}


		//회원수정 함수 종료시 = 서비스 종료 = 트랜잭션 종료 = commit이 자동으로 된다.
		//영속화된 persistance 객체의 변화가 감지되면 더티체킹이 되어 update문을 날려줌
		
	
	}
	
	@Transactional(readOnly = true)
	public User searchUser(String username) {
		User user = userRepository.findByUsername(username).orElseGet(()->{
			return new User();		
		});
		return user;
	}
	
	
}

////전통적인 로그인 방식
//@Transactional(readOnly=true) //Select할때 트랜잭션 시작, 서비스 종료시에 트랜잭션 종료(정합성)
////스프링워크의 Transactional을 import 해야한다.
//public User login(User user) {
//	return userRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
//}


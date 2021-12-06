package com.cos.blog.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.blog.model.User;

//DAO
//자동으로 baen으로 등록이 된다.->@Repository 생략가능.
public interface UserRepository extends JpaRepository<User, Integer> {
													//테이블명,P-key타입
	Optional<User> findByUsername(String username);
	//SELECT * FROM user WHERE username = ?;
}


//JPA Naming 쿼리
//원래 이런 이름의 함수는 없지만 이렇게 만들면,
//SELECT * FROM user WHERE username = ?, AND password = ?; 이라는 쿼리가 실행됨

//전통적인 로그인 방식
//User findByUsernameAndPassword(String username, String password);

////혹은 아래방법과 같이 직접 쿼리를 기술하는 방법도 있다.
//@Query(value="SELECT * FROM user WHERE username = ?1, AND password = ?2", nativeQuery = true)
//User login(String username, String password);

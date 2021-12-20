package com.bit.wheregoing.test.repository;



import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;

import com.bit.wheregoing.test.model.Startpoint;

public interface StartpointRepository extends JpaRepository<Startpoint, Integer> {
	
	
//	@Query(value="SELECT * FROM startpoint where city = ?1",nativeQuery = true)
	Startpoint findByCity(String city);
	
}

package com.bit.wheregoing.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bit.wheregoing.test.model.Hotels;

public interface HotelsRepository extends JpaRepository<Hotels, Integer> {

	Hotels findByCodeAndCity(String code,String city);
	
	List<Hotels> findAllByCity(String city);
	
}

package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.entity.Trip;
import com.smhrd.repository.NormalRepository;

@RestController
public class NormalRestController {

	@Autowired
	private NormalRepository repo;
	
	@RequestMapping("/data")
	public List<Trip> data(){
		List<Trip> list = repo.findAll();
		return list;
	}
	
}

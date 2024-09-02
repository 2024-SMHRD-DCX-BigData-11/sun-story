package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.entity.tb_scenario;
import com.smhrd.repository.ScenarioRepository;

@RestController
public class ScenarioRestController {

	@Autowired
	private ScenarioRepository repo;
	
	@RequestMapping("/audio")
	public List<tb_scenario> audio(int idx) {
		
		List<tb_scenario> list = repo.findByTouridx_Touridx(idx);
		return list;
	}
	
}

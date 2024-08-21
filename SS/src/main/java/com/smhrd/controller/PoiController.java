package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.tb_poi;
import com.smhrd.repository.NormalRepository;
import com.smhrd.repository.PoiRepository;

@Controller
public class PoiController {
	@Autowired
	private PoiRepository repo;
	
	@RequestMapping("/t2")
	public String goT2(Model model) {
		List<tb_poi> list = repo.findAll();
		model.addAttribute("list", list);
		
		return "1";
	}
}

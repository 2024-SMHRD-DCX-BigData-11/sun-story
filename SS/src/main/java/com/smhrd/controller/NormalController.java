package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Trip;
import com.smhrd.repository.NormalRepository;

@Controller
public class NormalController {
	
@Autowired
private NormalRepository repo;

@RequestMapping("/main")
public String goMain() {
	return "main";
}

@RequestMapping("/test")
public String goTest(Model model) {
	
	List<Trip> list = repo.findAll();
	model.addAttribute("list", list);
	
	return "test";
}

}

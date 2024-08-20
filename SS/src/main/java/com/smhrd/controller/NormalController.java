package com.smhrd.controller;

import java.util.ArrayList;
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
public String goMain(Model model) {
	
	List<Trip> list = repo.findAll();
	model.addAttribute("list", list);
	
	return "main";
}

@RequestMapping("/test")
public String goTest(Model model) {
	
	List<Trip> list = repo.findAll();
	model.addAttribute("list", list);
	
	return "test";
}

@RequestMapping("/t2")
public String goT2(Model model) {
	List<String> names = new ArrayList<String>();
	names.add("순천만 국가정원");
	names.add("순천 낙안읍성");
	names.add("선암사 (유네스코 세계유산)");
	names.add("송광사(순천)");
	names.add("순천 드라마촬영장");
	
	
	List<Trip> list = repo.findByNameIn(names);
	model.addAttribute("list", list);
	
	return "test";
}

@RequestMapping("/t3")
public String goT3(Model model) {
	
	String s = "#관광지";
	List<Trip> list = repo.findByTagLike("%"+s+"%");
	model.addAttribute("list", list);
	
	return "test";
}

}

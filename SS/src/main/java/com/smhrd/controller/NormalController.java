package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.tb_tour_site;
import com.smhrd.repository.NormalRepository;

@Controller
public class NormalController {

	@Autowired
	private NormalRepository repo;

	@RequestMapping("/main")
	public String goMain(Model model) {
		List<tb_tour_site> list = repo.findAll();
		model.addAttribute("list", list);
		return "main";
	}

	@RequestMapping("/test")
	public String goTest(Model model) {

		List<tb_tour_site> list = repo.findAll();
		model.addAttribute("list", list);

		return "test";
	}

	@RequestMapping("/QrPage")
	public String goQrPage() {
		return "QrPage";
	}

	@RequestMapping("/Story")
	public String StoryPage(Model model,int idx) {
		List<tb_tour_site> list = repo.findById(idx);
		model.addAttribute("list", list.get(0));
		return "StoryPage";
	}
	
	@RequestMapping("/audio1")
	public String audio1() {
		return "audio1";
	}

}

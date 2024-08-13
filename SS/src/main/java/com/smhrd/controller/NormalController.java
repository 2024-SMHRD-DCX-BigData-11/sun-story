package com.smhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NormalController {

@RequestMapping("/main")
public String goMain() {
	return "main";
}

@RequestMapping("/test")
public String goTest() {
	return "test";
}

}

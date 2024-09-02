package com.smhrd.controller;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.NormalClass.response;
import com.smhrd.entity.tb_tour_site;
import com.smhrd.repository.NormalRepository;

@RestController
public class NormalRestController {

	@Autowired
	private NormalRepository repo;
	
	@RequestMapping("/data")
	public List<tb_tour_site> data(int type, String text){
		List<tb_tour_site> result = new ArrayList<tb_tour_site>();
		switch(type) {
		case 1:
			 result = repo.findAll();
			break;
		case 2:
			List<String> names = new ArrayList<String>();
			names.add("순천만 국가정원");
			names.add("순천만습지 (구, 순천만자연생태공원)");
			names.add("순천 낙안읍성");
			names.add("선암사 [유네스코 세계유산]");
			names.add("송광사(순천)");
			names.add("순천 드라마촬영장");
			
			result = repo.findByToursiteIn(names);
			break;
		case 3:
			result = repo.findByTourtagLike("%"+text+"%");
			break;
		case 4:
			result = repo.findByToursiteLike("%"+text+"%");
			break;
		}
		return result;
	}
	
}

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
import com.smhrd.entity.Trip;
import com.smhrd.repository.NormalRepository;

@RestController
public class NormalRestController {

	@Autowired
	private NormalRepository repo;
	
	@RequestMapping("/data")
	public List<Trip> data(int type){
		List<Trip> result = new ArrayList<Trip>();
		switch(type) {
		case 1:
			 result = repo.findAll();
			break;
		case 2:
			List<String> names = new ArrayList<String>();
			names.add("순천만 국가정원");
			names.add("순천만습지 (구, 순천만자연생태공원)");
			names.add("순천 낙안읍성");
			names.add("선암사 (유네스코 세계유산)");
			names.add("송광사(순천)");
			names.add("순천 드라마촬영장");
			
			result = repo.findByNameIn(names);
			break;
		case 3:
			String s = "#역사";
			result = repo.findByTagLike("%"+s+"%");
		}
		return result;
	}
	
	@RequestMapping("/audio")
	public response audio(
			@RequestParam( value="idx" ) int idx
			) throws IOException{
		
		response response = new response();
		String text = "";
		int resultCode = 0;
		String mem = "1";
		
		if( mem != null ) {
			text = "1";
			if( text != null && !text.equals("") ) {
				text = repo.getdetail(idx);
				
				String result = URLEncoder.encode(text, "UTF-8")
		        .replaceAll("\\+", "%20")
		        .replaceAll("\\%21", "!")
		        .replaceAll("\\%27", "'")
		        .replaceAll("\\%28", "(")
		        .replaceAll("\\%29", ")")
		        .replaceAll("\\%7E", "~");
				
				response.setResult( "http://localhost:5000/tts-server/api/infer-glowtts?text=" + result );
				resultCode = 200;
			} else {
				resultCode = -200;
			}
		} else {
			resultCode = -200;
		}
		
		
		response.setResultCode(resultCode);
		return response;
	}
	
}

package com.smhrd.controller;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/audio")
	public Trip audio(
			@RequestParam( value="idx" ) int idx
			) throws IOException{
		
		Trip response = new Trip();
		String text = "";
		int resultCode = 0;
		String mem = "1";
		
		if( mem != null ) {
			text = "1";
			if( text != null && !text.equals("") ) {
				text = "안녕하세요 여기는 스마트 인재개발원 순천점입니다. 앞으로 열릴 개강은 9월 10일 빅데이터 과정입니다.";
				
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

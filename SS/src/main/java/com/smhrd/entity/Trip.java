package com.smhrd.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity // JPA 한테 이 DTO 객체가 테이블과 관련있는 객체임을 알려주기
@Data
public class Trip {

		// JPA
		// ORM(Object Relational Mapping)
		// java 객체 <---> 관계형 데이터
		// java 객체를 생성하면, 그 객체에 맞춰서 테이블을 자동 생성
		// 개발 초기에 테이블, DTO를 변경하기 쉽다.
		// SQL문을 작성 X
		// >> 서버 시작시간이 살짝 길어짐
		
		
		@Id // PrimaryKey를 걸기위한 어노테이션, 반드시 하나는 존재해야함
		// Id는 제일 상단에 선언.
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(insertable = false,updatable = false ) 
		private int trip_id;
		
		@Column(nullable = false, length = 300)
		private String address;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String detail;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String fare;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String guide;
		
		@Column(columnDefinition = "DECIMAL(17,14)")
		private double lat;
		
		@Column(columnDefinition = "DECIMAL(17,14)")
		private double lon;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String name;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String page;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String park;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String rest;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String simple_name;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String tag;
		
		@Column(nullable = false, columnDefinition = "TEXT")
		private String use_hour;
}

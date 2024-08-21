package com.smhrd.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class tb_tour_site {
	@Id // PrimaryKey를 걸기위한 어노테이션, 반드시 하나는 존재해야함
	// Id는 제일 상단에 선언.
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable = false,updatable = false ) 
	private int tour_idx;
	
	@Column(nullable = false, length = 100)
	private String tour_site;
	
	@Column(nullable = false, length = 300)
	private String tour_title;
	
	@Column(nullable = false, columnDefinition = "TEXT")
	private String tour_desc;
	
	@Column(nullable = false, length = 20)
	private String tour_guide;
	
	@Column(nullable = false, length = 500)
	private String tour_url;
	
	@Column(nullable = false, length = 600)
	private String tour_addr;
	
	@Column(nullable = false, length = 100)
	private String tour_time;
	
	@Column(nullable = false, length = 100)
	private String tour_holiday;
	
	@Column(nullable = false, length = 100)
	private String tour_park;
	
	@Column(nullable = false, length = 300)
	private String tour_fare;
	
	@Column(nullable = false, length = 600)
	private String tour_tag;
	
	@Column(nullable = false, columnDefinition = "DECIMAL(17,14)")
	private double lat;
	
	@Column(nullable = false, columnDefinition = "DECIMAL(17,14)")
	private double lon;
	
	@Column(nullable = false, length = 1500)
	private String tour_photo;
	
	
	
	
	
	
	
	
	
	
	
	
	
}

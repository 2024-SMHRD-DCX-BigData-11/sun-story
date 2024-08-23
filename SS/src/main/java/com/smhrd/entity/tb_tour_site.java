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
	private int touridx;
	
	@Column(nullable = false, length = 100)
	private String toursite;
	
	@Column(nullable = false, length = 300)
	private String tourtitle;
	
	@Column(nullable = false, columnDefinition = "TEXT")
	private String tourdesc;
	
	@Column(nullable = false, length = 500)
	private String tourguide;
	
	@Column(nullable = false, length = 500)
	private String toururl;
	
	@Column(nullable = false, length = 600)
	private String touraddr;
	
	@Column(nullable = false, length = 500)
	private String tourtime;
	
	@Column(nullable = false, length = 500)
	private String tourholiday;
	
	@Column(nullable = false, length = 500)
	private String tourpark;
	
	@Column(nullable = false, length = 500)
	private String tourfare;
	
	@Column(nullable = false, length = 600)
	private String tourtag;
	
	@Column(nullable = false, columnDefinition = "DECIMAL(17,14)")
	private double lat;
	
	@Column(nullable = false, columnDefinition = "DECIMAL(17,14)")
	private double lon;
	
	@Column(nullable = false, length = 1500)
	private String tourphoto;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

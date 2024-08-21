package com.smhrd.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Entity
@Data
public class tb_poi {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable = false,updatable = false ) 
	private int poi_idx;
	
	@ManyToOne
	private tb_tour_site tour_idx;
	
	@Column(nullable = false, length = 100)
	private String poi_name;
	
	@Column(nullable = false,columnDefinition = "TEXT")
	private String poi_info;
	
	@Column(nullable = false, length = 1500)
	private String poi_photo;
	
	public String toString() {
		return "tb_poi";
	}
}

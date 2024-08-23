package com.smhrd.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Entity
@Data
public class tb_scenario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable = false,updatable = false ) 
	private int scenario_idx;
	
	@OneToOne
	private tb_tour_site tour_idx;
	
	@Column(nullable = false, columnDefinition = "TEXT")
	private String scenario;
	
	@Column(nullable = true, length = 1500)
	private String scenario_voice;
	public String toString() {
		return "tb_scenario";
	}
}

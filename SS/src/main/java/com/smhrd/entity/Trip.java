package com.smhrd.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
@Entity
@Data
public class Trip {
	@Id
	  @GeneratedValue(strategy=GenerationType.AUTO)
	  private Integer tripId;

	  private String name;

	  private String simpleName;
	  
	  private String detail;
	  
	  private String guide;
	  
	  private String page;
	  
	  private String address;
	  
	  private String useHour;
	  
	  private  String rest;
	  
	  private String park;
	  
	  private String fare;
	  
	  private String tag;
	  
	  private String let;
	  
	  private String lon;
	  public Integer getId() {
	    return tripId;
	  }


}

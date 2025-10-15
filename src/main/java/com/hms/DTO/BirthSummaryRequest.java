package com.hms.DTO;

import lombok.Data;

@Data
public class BirthSummaryRequest {

	  private String gender; 
	    private String motherName;
	    private String fatherName;
	    private String address;
	    private String deliveryDate;   
	    private String deliveryTime;   
	    private String deliveryMethod; 
}

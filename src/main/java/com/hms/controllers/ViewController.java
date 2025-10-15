package com.hms.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
	
	@GetMapping("/pdf")
	public String view() {
		System.out.println("helo ");
		return "pdf";
	}

}

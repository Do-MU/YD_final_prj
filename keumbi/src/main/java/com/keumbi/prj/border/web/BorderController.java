package com.keumbi.prj.border.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BorderController {
	
	@RequestMapping("/borderList")
	public String borderList() {
		return "border/borderList";
		
	}
	
	@RequestMapping("borderList/borderWriter")
	public String borderWriter() {
		return "border/borderWriter";	
	
	}
}

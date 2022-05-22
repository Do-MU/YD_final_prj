package com.keumbi.prj;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	public String home(Locale locale) {
		return "home/home";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "home/home";
	}
	
	@RequestMapping("/exam")
	public String exam() {
		return "example";
	}
	@RequestMapping("/exam2")
	public String exam2() {
		return "example2";
	}
}

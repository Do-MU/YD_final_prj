package com.keumbi.prj;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.main.service.MainService;

@Controller
public class HomeController {
	@Autowired MainService main;
	
	@RequestMapping("/")
	public String home(Locale locale) {
		return "home/home";
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("cntUser", main.cntUser());
		model.addAttribute("cntPrd", main.cntPrd());
		model.addAttribute("cntFinance", main.cntFinance());
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

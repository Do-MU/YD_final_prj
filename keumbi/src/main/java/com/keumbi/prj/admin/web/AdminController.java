package com.keumbi.prj.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	// 관리자 메인 화면
	@RequestMapping("admin/home")
	public String home() {
		
		return "admin/home";
	}
	
	// 관리자 상품 업데이트 페이지
	@RequestMapping("admin/prdUpdate")
	public String prdUpdate() {
			
		return "admin/prdUpdate";
	}
		
}

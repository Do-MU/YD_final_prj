package com.keumbi.prj.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.user.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired UserService u;

	// 관리자 메인 화면
	@RequestMapping("/home")
	public String home() {
		
		return "admin/home";
	}
	
	// 관리자 상품 업데이트 페이지
	@RequestMapping("/prdUpdate")
	public String prdUpdate() {
			
		return "admin/prdUpdate";
	}
}

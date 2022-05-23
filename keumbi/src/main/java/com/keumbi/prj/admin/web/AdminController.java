package com.keumbi.prj.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.user.service.UserService;

@Controller
public class AdminController {
	
	@Autowired UserService u;

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
	
	// 회원 더미 데이터 만들기
	@RequestMapping("admin/addUser")
	public String addUser() {
		return "admin/addUser";
	}
	
	@RequestMapping("admin/insertRandUser")
	@ResponseBody
	public void  insertRandUser() {
		for(int i=0;i<1005;i++) {
			u.insertRandUser();
		}
	}
	
	
}

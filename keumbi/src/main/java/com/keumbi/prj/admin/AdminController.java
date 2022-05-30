package com.keumbi.prj.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.prd.service.PrdCardService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired AccountService a;
	@Autowired PrdCardService c;
	
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
	
	// 더미 데이터 만들기
	@RequestMapping("/admin/dummyDep")
	@ResponseBody
	public int dummyDep() {
		
		return a.makeDummyDep();
	}
	@RequestMapping("/admin/dummySav")
	@ResponseBody
	public int dummySav() {
		
		return a.makeDummySav();
	}
	@RequestMapping("/admin/dummyLoa")
	@ResponseBody
	public int dummyLoa() {
		
		return a.makeDumLoa();
	}
	@RequestMapping("/dummyCard")
	@ResponseBody
	public int dummyCard() {
		
		return c.makeDummyCard();
	}
	
}

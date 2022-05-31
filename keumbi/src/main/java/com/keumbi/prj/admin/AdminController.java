package com.keumbi.prj.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.user.service.UserService;
import com.keumbi.prj.prd.service.PrdCardService;
import com.keumbi.prj.user.service.UserService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired AccountService a;
	@Autowired UserService us;
	@Autowired PrdCardService c;
	@Autowired ChallService ch;
	
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
	
	// 회원목록 페이지
	@RequestMapping("/admUserMng")
	public String adm_userMng(Model model) {
		model.addAttribute("allUser", us.allUser());
		return "admin/admUserMng";
	}
	
	// 더미 데이터 만들기
	@RequestMapping("/dummyDep")
	@ResponseBody
	public int dummyDep() {
		
		return a.makeDummyDep();
	}
	@RequestMapping("/dummySav")
	@ResponseBody
	public int dummySav() {
		
		return a.makeDummySav();
	}
	@RequestMapping("/dummyLoa")
	@ResponseBody
	public int dummyLoa() {
		
		return a.makeDumLoa();
	}
	@RequestMapping("/dummyCard")
	@ResponseBody
	public int dummyCard() {
		
		return c.makeDummyCard();
	}
	@RequestMapping("/dummyChall")
	@ResponseBody
	public int dummyChall() {
		int cnt=0;
		for(int i=0;i<4000;i++) {
			ch.makeDummyChall();
			cnt++;
		}
		return cnt;
	}
}

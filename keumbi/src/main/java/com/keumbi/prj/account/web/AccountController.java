package com.keumbi.prj.account.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccountController {
	
	@Autowired AccountService service;
	
	ObjectMapper om = new ObjectMapper();
	

	// 계좌 view page
	@RequestMapping("/accountView")
	public String accountView() {
		return "account/accountList";
	}
	
	// 계좌목록
	@RequestMapping("/accountList")
	@ResponseBody
	public String accountList(HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		List<AccountVO> listRes = BankAPI.getAccountList(vo);
		System.out.println("listRes : " + listRes);
		
		// db 저장
		for(AccountVO i : listRes) {
			service.insertAccount(i);
		}
		
		// 목록조회
		model.addAttribute(service.selectAll());
		System.out.println(model);
		
		return "account/accountList";
	}
}

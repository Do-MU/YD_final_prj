package com.keumbi.prj.account.web;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.keumbi.prj.common.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccountController {

	@RequestMapping("/accountView")
	public String accountView() {
		
		return "account/accountList";
	}
	
	@RequestMapping("/accountList")
	@ResponseBody
	public String accountList(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser") ;
		
		JsonNode res = BankAPI.getAccountList(vo);
		
		System.out.println("res : " + res);
		return "redirect : account/accountList";
	}
}

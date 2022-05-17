package com.keumbi.prj.account.web;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.keumbi.prj.bankAPI.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccountController {

	// 계좌 view page
	@RequestMapping("/accountView")
	public String accountView() {
		
		return "account/accountList";
	}
	
	// 계좌목록불러오기
	@RequestMapping("/accountList")
	@ResponseBody
	public JsonNode accountList(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser") ;
		
		JsonNode res = BankAPI.getAccountList(vo);
		
		//JsonNode -> 변환
		
		System.out.println("res : " + res);
		return res;
	}
}

package com.keumbi.prj.account.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccountController {
	@Autowired AccountMapper mapper;
	
	ObjectMapper om = new ObjectMapper();

	// 계좌 view page
	@RequestMapping("/accountView")
	public String accountView() {
		return "account/accountList";
	}
	
	// 계좌목록 및 잔액 불러오기
	@RequestMapping("/accountList")
	@ResponseBody
	public List<AccountVO> accountList(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		List<AccountVO> listRes = BankAPI.getAccountList(vo);
		System.out.println("listRes : " + listRes);
		//JsonNode balres =  BankAPI.getBalance(vo);
		//System.out.println("balres : " + balres);
		
		for(AccountVO i : listRes) {
			mapper.insertAccount(i);
		}
		
		return mapper.selectAll();
	}
}

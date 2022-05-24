package com.keumbi.prj.accDeposit.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.account.service.AccountService;

@Controller
public class accDepositController {
	
	@Autowired AccountService accountServiceImpl;

	// 출금 계좌목록 출력
	@RequestMapping("/accDepositView")
	public String accDepositView(HttpSession session, Model model) {
		model.addAttribute("accList", accountServiceImpl.selectAllAccount(session));
		
		return "account/accDeposit";
	}
	
	// view -> 각 vo로 받기 -> service 호출
	//	-> wit / dep 핀테크 이용 번호 있는지 확인하고 없으면 알람창
	//	-> insert 두번 입금 출금
	//	-> insert 가계부
	
}

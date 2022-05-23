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

	@RequestMapping("/accDepositView")
	public String accDepositView(HttpSession session, Model model) {
		model.addAttribute("accList", accountServiceImpl.selectAllAccount(session));
		
		return "account/accDeposit";
	}
}

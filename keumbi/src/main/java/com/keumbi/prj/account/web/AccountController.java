package com.keumbi.prj.account.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccountController {
	
	@Autowired AccountService acc;
	@Autowired AccTransService accTransServiceImpl;
	
	ObjectMapper om = new ObjectMapper();
	
	// 계좌목록 view page
	// 인증되지 않은 회원 : accountList > [내 계좌불러오기] > bankAuth > bankCallBack > accountList
	@RequestMapping("/accountList")
	public String accountView(HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		// 로그인 시
		if(vo != null) {
			// 인증된 회원일 시
			if(vo.getUser_seq_num() != null && !vo.getUser_seq_num().isEmpty()) {
				model.addAttribute("acc", acc.selectfirstAccount(session));
			}
			// 잔액 합산 출력
			model.addAttribute("accTotalSum", acc.selectAccTotalSum(vo.getId()));
		}
		return "account/accountList";
	}
}
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
	
	@Autowired AccountService accountServiceImpl;
	@Autowired AccTransService accTransServiceImpl;
	
	ObjectMapper om = new ObjectMapper();
	
	// 계좌 view page -> 목록출력
	@RequestMapping("/accountView")
	public String accountView(HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		// 비로그인시 -> 메세지???????????????????????
		 if(vo == null) {
			return "user/userLoginForm";
		 }
		 
		 String userSeq = vo.getUser_seq_num();
		 model.addAttribute("accTotalSum", accountServiceImpl.selectAccTotalSum(session)); // 잔액 합산 출력
		if(userSeq != null && !userSeq.isEmpty()) {
			model.addAttribute("acc", accountServiceImpl.selectfirstAccount(session)); //
		}
		return "account/accountList";
	}
	
	// 사용자 인증 -> 계좌목록출력
	@RequestMapping("/getAccount")
	public String saveAccount(HttpSession session, Model model) {
		model.addAttribute("acc", accountServiceImpl.selectfirstAccount(session)); // 최로 조회로
		model.addAttribute("accTotalSum", accountServiceImpl.selectAccTotalSum(session)); // 잔액 합산 출력
		return "account/accountList";
	}
}
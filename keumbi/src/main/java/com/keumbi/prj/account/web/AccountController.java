package com.keumbi.prj.account.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccountController {
	
	@Autowired AccountService service;
	
	ObjectMapper om = new ObjectMapper();
	
	// 계좌 view page -> 목록출력
	@RequestMapping("/accountView")
	public String accountView(HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		String userSeq = vo.getUser_seq_num();
		if(userSeq != null && !userSeq.isEmpty()) {
			model.addAttribute("acc", service.selectAll(session));
		}
		return "account/accountList";
	}
	
	// 사용자 인증 -> 계좌목록출력
	@RequestMapping("/getAccount")
	@ResponseBody
	public ModelAndView saveAccount(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		//계좌목록 조회 -> db 저장
		List<AccountVO> acclist = BankAPI.getAccountList(vo);
		//System.out.println("acclist : " + acclist);
		
		String userId = vo.getId();
		for(AccountVO accVO : acclist) {
			accVO.setUser_id(userId);
			//잔액조회
			long blist = BankAPI.getBalance(vo, accVO.getFintech_use_num());
			//System.out.println("blist : " + blist);
			accVO.setBalance_amt(blist);
			//db저장
			service.insertAccount(accVO);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("account/accountList");
		mv.addObject("acc", service.selectAll(session));

		return mv;
	}
	
	// 거래내역출력
	@RequestMapping("transaction")
	@ResponseBody
	public ModelAndView transaction() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("account/transList");
		return mv;
	}
	
}
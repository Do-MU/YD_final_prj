package com.keumbi.prj.accTrans.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.accTrans.vo.RemitVO;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccTransController {
	
	@Autowired AccountService accountS;
	@Autowired AccTransService accTransS;

	// 계좌 -> 거래내역 페이지 넘어가는곳
	@RequestMapping("/accTransList")
	public String accTransView(HttpSession session, Model model, AccountVO acc){
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		model.addAttribute("accList", accountS.selectAllAccount(user)); 				// 계좌목록 호출
		model.addAttribute("accTrans",accTransS.selectAllAccTrans(acc)); 				// 거래내역 호출
		
		return "account/transList";
	}
	
	// 송금 view
	@RequestMapping("/accRemitForm")
	public String accDepositView(HttpSession session, Model model, AccountVO acc) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {
			model.addAttribute("loginMsg", "로그인이 필요합니다.");
			return "user/userLoginForm";
		} else {
			model.addAttribute("accList", accountS.selectAllAccount(user)); 	// 계좌목록 호출
			model.addAttribute("finBal", accountS.selectOneAccount(acc)); 		// 단건 계좌 정보
			return "account/remitForm";			
		}
	}
	
	// view -> 각 vo로 받기 -> service 호출
	@RequestMapping("/accTranProcess")
	public String accTranProcess(HttpSession session, RemitVO vo, Model model) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		accTransS.insertRemit(user, vo);
		
		return "redirect:accTransList?fintech_use_num="+vo.getWit_fintech_use_num();
	}
	
	
	
	
	
	// 거래내역 > 선택일자 거래내역 조회 aJax
	@RequestMapping("/accTransRes")
	@ResponseBody
	public List<AccTransVO> accTransRes(AccTransReqVO vo) {
		
		return accTransS.selectAccTransDate(vo);
	}
	
	// 거래내역 > selectBox 계좌 변경 이벤트 aJax
	@RequestMapping("/chageSelect")
	@ResponseBody
	public List<AccTransVO> chageSelect(AccountVO acc) {
		
		return accTransS.selectAllAccTrans(acc);
	}
	
	// 이체화면 > 잔액 aJax
	@RequestMapping("/getAccInfo")
	@ResponseBody
	public AccountVO getAccInfo(AccountVO acc) {
		
		return accountS.selectOneAccount(acc);
		
	}
}
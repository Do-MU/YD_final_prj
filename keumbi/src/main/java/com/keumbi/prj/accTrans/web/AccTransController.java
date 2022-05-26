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
	
	@Autowired AccountService accountServiceImpl;
	@Autowired AccTransService accTransServiceImpl;

	// 계좌 -> 거래내역 페이지 넘어가는곳
	@RequestMapping("/accTransView")
	public String accTransView(HttpSession session, Model model, String fintech_use_num){
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		model.addAttribute("accList", accountServiceImpl.selectAllAccount(vo)); 				// 계좌목록 호출
		model.addAttribute("accTrans",accTransServiceImpl.selectAccTransAll(fintech_use_num)); 	// 거래내역 호출
		
		return "account/transList";
	}
	
	// 선택일자 거래내역 ajax
	@RequestMapping("/accTransRes")
	@ResponseBody
	public List<AccTransVO> accTransRes(AccTransReqVO vo) {
		//System.out.println(vo.getFintech_use_num());
		//System.out.println(vo.getFrom_date());
		//System.out.println(vo.getTo_date());
		//System.out.println("----" + accTransServiceImpl.selectAccTransDate(vo));		
		
		return accTransServiceImpl.selectAccTransDate(vo);
	}
	
	//selectBox 계좌 변경 이벤트
	@RequestMapping("/chageSelect")
	@ResponseBody
	public List<AccTransVO> chageSelect(String fintech_use_num) {
		
		return accTransServiceImpl.selectAccTransAll(fintech_use_num);
	}
	
	// 송금 view
	@RequestMapping("/accDepositView")
	public String accDepositView(HttpSession session, Model model, String fintech_use_num) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		//System.out.println(fintech_use_num);
		
		model.addAttribute("accList", accountServiceImpl.selectAllAccount(vo)); // 계좌목록 호출
		model.addAttribute("finBal", accountServiceImpl.selectOneAccount(fintech_use_num)); //단건 계좌 정보
		return "account/accDeposit";
	}
	
	// 잔액 ajax
	@RequestMapping("getAccInfo")
	@ResponseBody
	public AccountVO getAccInfo(String fintech_use_num) {
		System.out.println(fintech_use_num);
		
		return accountServiceImpl.selectOneAccount(fintech_use_num);
		
	}
	
	// view -> 각 vo로 받기 -> service 호출
	@RequestMapping("accTranProcess")
	public String accTranProcess(HttpSession session, RemitVO vo, Model model) {
		System.out.println("accTranProcess");
		System.out.println(vo);
		
		int result = accTransServiceImpl.insertRemit(session, vo);
		if(result != 0) {
			model.addAttribute("msg", "이체가 완료되었습니다.");
		} else {
			model.addAttribute("msg", "잠시 후 다시 시도해주세요.");
		}
		return "account/accDeposit";
	}
}
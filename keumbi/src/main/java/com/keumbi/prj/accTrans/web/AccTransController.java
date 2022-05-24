package com.keumbi.prj.accTrans.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccDepositVO;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.accTrans.vo.AccWithdrawVO;
import com.keumbi.prj.account.service.AccountService;

@Controller
public class AccTransController {
	
	@Autowired AccountService accountServiceImpl;
	@Autowired AccTransService accTransServiceImpl;

	// 계좌 -> 거래내역 페이지 넘어가는곳
	@RequestMapping("/accTransView")
	public String accTransView(HttpSession session, Model model, String fintech_use_num){
		//System.out.println("fintech_use_num :  " + fintech_use_num);
		model.addAttribute("accList", accountServiceImpl.selectAllAccount(session)); // 계좌목록 호출
		model.addAttribute("accTrans",accTransServiceImpl.selectAccTransAll(fintech_use_num)); // 거래내역 호출
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
		//System.out.println(fintech_use_num);
		model.addAttribute("accList", accountServiceImpl.selectAllAccount(session)); // 계좌목록 호출
		
		return "account/accDeposit";
	}
	
	// view -> 각 vo로 받기 -> service 호출
	@RequestMapping("accTranProcess")
	public String accTranProcess(AccWithdrawVO wvo, AccDepositVO dvo) {
		System.out.println("accTranProcess");
		System.out.println(wvo);
		System.out.println(dvo);
		return "";
	}
	//	-> wit / dep 핀테크 이용 번호 있는지 확인하고 없으면 알람창
	//	-> insert 두번 입금 출금
	//	-> insert 가계부
}

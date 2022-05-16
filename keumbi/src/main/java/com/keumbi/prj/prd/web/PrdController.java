package com.keumbi.prj.prd.web;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.prd.mapper.DepositMapper;
import com.keumbi.prj.prd.mapper.LoanMapper;
import com.keumbi.prj.prd.mapper.SavingMapper;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.prd.vo.LoanVO;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.prd.vo.SavingVO;

@Controller
public class PrdController {
	
	@Autowired DepositMapper depm;
	@Autowired SavingMapper savm;
	@Autowired LoanMapper loam;
	
	@RequestMapping("admin/prdUpdate")
	public String prdUpdate() {
		
		return "admin/prdUpdate";
	}
	
	@RequestMapping("admin/home")
	public String home() {
		return "admin/home";
	}
	
	@RequestMapping(value="admin/depUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> depUpdate(HttpServletResponse response) {
		int baseCnt = 0;
		int optCnt = 0;
		
		DepositVO deposits = PrdAPI.getDepositList();
		
		depm.deleteAllDepOpt();
		depm.deleteAllDepBase();
		
		for(DepositBaseVO vo : deposits.getBaseList()) {
			depm.insertDepBase(vo);
			baseCnt++;
		}
		
		for(DepositOptionVO vo : deposits.getOptionList()) {
			depm.insertDepOpt(vo);
			optCnt++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		String message = "예금상품 : " + baseCnt + "건\n예금상품옵션 : " + optCnt + "건\n업데이트 완료";
		
		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}
	
	@RequestMapping(value="admin/savUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> savUpdate(HttpServletResponse response){
		int baseCnt = 0;
		int optCnt = 0;
		
		SavingVO saving = PrdAPI.getSavingList();
		
		savm.deleteAllSavOpt();
		savm.deleteAllSavBase();
		
		for(SavingBaseVO vo : saving.getBaseList()) {
			savm.insertSavBase(vo);
			baseCnt++;
		}
		
		for(SavingOptionVO vo : saving.getOptionList()) {
			savm.insertSavOpt(vo);
			optCnt++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		String message = "적금상품 : " + baseCnt + "건\n적금상품옵션 : " + optCnt + "건\n업데이트 완료";
		
		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}
	
	@RequestMapping(value="admin/loanUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> loanUpdate(HttpServletResponse response){
		int baseCnt = 0;
		int optCnt = 0;
		
		LoanVO loan = PrdAPI.getLoanList();
		
		loam.deleteAllLoanOpt();
		loam.deleteAllLoanBase();
		
		for(LoanBaseVO vo : loan.getBaseList()) {
			loam.insertLoanBase(vo);
			baseCnt++;
		}
		
		for(LoanOptionVO vo : loan.getOptionList()) {
			loam.insertLoanOpt(vo);
			optCnt++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		String message = "대출상품 : " + baseCnt + "건\n대출상품옵션 : " + optCnt + "건\n업데이트완료";
		
		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}
}

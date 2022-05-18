package com.keumbi.prj.prd.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.prd.mapper.LoanMapper;
import com.keumbi.prj.prd.mapper.SavingMapper;
import com.keumbi.prj.prd.service.DepositService;
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
	
	@Autowired DepositService dep;
	@Autowired SavingMapper sav;
	@Autowired LoanMapper loa;
	
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
		
		dep.deleteAllDepOpt();
		dep.deleteAllDepBase();
		
		for(DepositBaseVO vo : deposits.getBaseList()) {
			dep.insertDepBase(vo);
			baseCnt++;
		}
		
		for(DepositOptionVO vo : deposits.getOptionList()) {
			dep.insertDepOpt(vo);
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
		
		sav.deleteAllSavOpt();
		sav.deleteAllSavBase();
		
		for(SavingBaseVO vo : saving.getBaseList()) {
			sav.insertSavBase(vo);
			baseCnt++;
		}
		
		for(SavingOptionVO vo : saving.getOptionList()) {
			sav.insertSavOpt(vo);
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
		
		loa.deleteAllLoanOpt();
		loa.deleteAllLoanBase();
		
		for(LoanBaseVO vo : loan.getBaseList()) {
			loa.insertLoanBase(vo);
			baseCnt++;
		}
		
		for(LoanOptionVO vo : loan.getOptionList()) {
			loa.insertLoanOpt(vo);
			optCnt++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		String message = "대출상품 : " + baseCnt + "건\n대출상품옵션 : " + optCnt + "건\n업데이트완료";
		
		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}
	
	@RequestMapping("/prdDepositList")
	public String prdDepositList(Model model) {
//		model.addAttribute("prdDepBase", dep.selectAllDepBase());
//		model.addAttribute("prdDepOpt", dep.selectAllDepOpt());
		
		return "product/deposit";
	}
	
	@RequestMapping("/prdDepBase")
	@ResponseBody
	public List<DepositBaseVO> prdDepBaseList(){
		return dep.selectAllDepBase();
	}
	
	@RequestMapping("/prdDepOpt")
	@ResponseBody
	public List<DepositOptionVO> prdDepOptList(int dep_id){
		System.out.println(dep_id);
		return dep.selectAllDepOpt(dep_id);
	}
}


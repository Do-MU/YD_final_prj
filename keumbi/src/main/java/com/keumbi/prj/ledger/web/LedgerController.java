package com.keumbi.prj.ledger.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.ledger.service.LedgerService;
import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;

@Controller
public class LedgerController {

	@Autowired LedgerService service;
	@Autowired CodeService code;

	// 캘린더 월간 페이지 출력
	@RequestMapping("/monthView")
	public String monthView(Model model) {
		model.addAttribute("code", code.categoryCode());
		return "ledger/monthView";
	}
	
	// 월지출 총액 출력
	

	// 입출금액 데이터 호출
	@RequestMapping("/totalTrans")
	@ResponseBody
	public List<LedgerMonthVO> totalTrans(LedgerMonthVO vo) {
		return service.totalTrans(vo);
	}

	// 선택한 날짜의 입출금 내역 호출
	@RequestMapping("/dayView")
	@ResponseBody
	public List<LedgerVO> dayTrans(LedgerVO vo) {
		return service.dayTrans(vo);
	}
	
	// 일지출 총액 출력
	@RequestMapping("/dayTotalAmt")
	@ResponseBody
	public List<LedgerVO> dayTotalAmt(LedgerVO vo) {
		
		return service.dayTotalAmt(vo);
		
	}
	
	// 현금 입출금 내역 등록
	@PostMapping("/cashInsert")
	@ResponseBody
	public void cashInsert(LedgerVO vo) {
		service.cashInsert(vo);
	}
	
	

}

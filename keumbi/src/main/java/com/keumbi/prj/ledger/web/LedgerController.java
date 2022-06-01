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
		return "ledger/ledgerList";
	}
	
	// 월지출 총액 출력
	@RequestMapping("/monthTotalAmt")
	@ResponseBody
	public int monthTotalAmt(LedgerMonthVO vo) {
		return service.monthTotalAmt(vo);
	}
	
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
	
	// 가계부 거래내역 키워드 검색
	@RequestMapping("/ledgerSearch")
	@ResponseBody
	public List<LedgerVO> LedgerSearch(LedgerVO vo) {
		return service.ledgerSearch(vo);
	}
	
	// 가계부 거래내역 수정
	@PostMapping("/ledgerUpdate")
	@ResponseBody
	public void ledgerUpdate(LedgerVO vo) {
		service.ledgerUpdate(vo); 
	}
	
	// 가계부 거래내역 삭제
	@RequestMapping("/ledgerDelete")
	@ResponseBody
	public void ledgerDelete(LedgerVO vo) {
		service.ledgerDelete(vo);
	}
}

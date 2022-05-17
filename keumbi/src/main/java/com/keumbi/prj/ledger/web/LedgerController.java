package com.keumbi.prj.ledger.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.ledger.service.LedgerService;
import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;

@Controller
public class LedgerController {

	@Autowired LedgerService service;

	// 캘린더 월간 페이지 출력
	@RequestMapping("/monthView")
	public String monthView() {
		return "ledger/monthView";
	}

	// 입출금액 데이터 호출
	@RequestMapping("/totalTrans")
	@ResponseBody
	public List<LedgerMonthVO> totalTrans() {
		return service.totalTrans();
	}

	// 선택한 날짜의 입출금 내역 호출
	@RequestMapping("/dayView")
	@ResponseBody
	public List<LedgerVO> dayTrans(LedgerVO vo) {
		return service.dayTrans(vo);
	}

	// 현금 입출금 내역 등록
	@PostMapping("/cashInsert")
	@ResponseBody
	public void cashInsert(LedgerVO vo) {
		service.cashInsert(vo);
	}

}

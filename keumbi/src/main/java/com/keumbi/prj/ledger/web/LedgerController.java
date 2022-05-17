package com.keumbi.prj.ledger.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.ledger.mapper.LedgerMapper;
import com.keumbi.prj.ledger.vo.LedgerVO;

@Controller
public class LedgerController {
	
	@Autowired LedgerMapper mapper;
	
	//입출금액 캘린더 출력
	@RequestMapping("/totalTrans")
	@ResponseBody
	public List<LedgerVO> totalTrans() {
		return mapper.totalTrans();
	}
		
	 @RequestMapping("/monthView") 
	 public String monthView() {
		return "ledger/monthView";
	 }
	 
}

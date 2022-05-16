package com.keumbi.prj.prd.web;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.prd.mapper.DepositMapper;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;

@Controller
public class PrdController {
	
	@Autowired DepositMapper depm;
	
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
}

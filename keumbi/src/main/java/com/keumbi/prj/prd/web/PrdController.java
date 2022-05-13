package com.keumbi.prj.prd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.prd.mapper.DepositBaseMapper;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;

@Controller
public class PrdController {
	
	@Autowired DepositBaseMapper dbm;
	
	@RequestMapping("/deposit")
	public String getdeposit(Model model) {
		DepositVO deposits = PrdAPI.getDepositList();
		for(DepositBaseVO vo : deposits.getBaseList()) {
			dbm.InsertDepBase(vo);
		}
		
		for(DepositOptionVO vo : deposits.getOptionList()) {
			dbm.InsertDepOpt(vo);
		}
		
		return "kb/deposit";
	}
}

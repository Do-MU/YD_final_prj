package com.keumbi.prj.prd.service;

import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;

public interface LoanService {
	int insertLoanBase(LoanBaseVO vo);
	int insertLoanOpt(LoanOptionVO vo);
	int deleteAllLoanBase();
	int deleteAllLoanOpt();
}

package com.keumbi.prj.prd.mapper;

import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;

public interface LoanMapper {
	int insertLoanBase(LoanBaseVO vo);
	int insertLoanOpt(LoanOptionVO vo);
	int deleteAllLoanBase();
	int deleteAllLoanOpt();
}

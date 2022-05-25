package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;

public interface LoanService {
	List<LoanBaseVO> selectAllLoanBase();
	LoanBaseVO selectOneLoanBase(int loan_id);
	List<LoanOptionVO> selectAllLoanOpt(int loan_id);
	
	String insertAllLoans();
	void deleteAllLoans();
}

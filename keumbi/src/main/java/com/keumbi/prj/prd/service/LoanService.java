package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.user.vo.UserVO;

public interface LoanService {
	List<LoanBaseVO> selectAllLoanBase();
	LoanBaseVO selectOneLoanBase(int loan_id);
	List<LoanOptionVO> selectAllLoanOpt(int loan_id);
	List<LoanBaseVO> selectBestLoanBase(UserVO vo);
	String insertAllLoans();
	void deleteAllLoans();
	List<LoanBaseVO> selectRandomLoanBase();
}

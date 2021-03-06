package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.user.vo.UserVO;

public interface LoanMapper {
	int insertLoanBase(LoanBaseVO vo);
	int insertLoanOpt(LoanOptionVO vo);
	int deleteAllLoanBase();
	int deleteAllLoanOpt();
	
	List<LoanBaseVO> selectAllLoanBase();
	LoanBaseVO selectOneLoanBase(int loan_id);
	List<LoanOptionVO> selectAllLoanOpt(int loan_id);
	
	CodeVO selectBankName(String kor_co_nm);
	List<LoanBaseVO> selectBestLoanBase(UserVO vo);
	List<LoanBaseVO> selectRandomLoanBase();
}

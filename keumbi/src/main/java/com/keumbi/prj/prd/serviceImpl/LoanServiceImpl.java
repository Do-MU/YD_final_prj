package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.prd.mapper.LoanMapper;
import com.keumbi.prj.prd.service.LoanService;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.prd.vo.LoanVO;
import com.keumbi.prj.prd.web.PrdAPI;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class LoanServiceImpl implements LoanService {

	@Autowired
	LoanMapper l;
	
	@Override // 전체 대출 목록 불러오기
	public List<LoanBaseVO> selectAllLoanBase() {
		return l.selectAllLoanBase();
	}

	@Override // 단건 대출 정보 불러오기
	public LoanBaseVO selectOneLoanBase(int loan_id) {
		return l.selectOneLoanBase(loan_id);
	}

	@Override // 대출 옵션 목록 불러오기
	public List<LoanOptionVO> selectAllLoanOpt(int loan_id) {
		return l.selectAllLoanOpt(loan_id);
	}

	@Override // 대출 정보 DB에 저장
	public String insertAllLoans() {
		int baseCnt = 0;
		int optCnt = 0;

		LoanVO loan = PrdAPI.getLoanList();
		
		deleteAllLoans();

		for (LoanBaseVO lvo : loan.getBaseList()) {
			CodeVO bank_code = l.selectBankName(lvo.getKor_co_nm());
			lvo.setKor_co_nm(bank_code.getVal());
			lvo.setBank_code(bank_code.getCode());
			baseCnt += l.insertLoanBase(lvo);
		}

		for (LoanOptionVO lvo : loan.getOptionList()) {
			
			optCnt += l.insertLoanOpt(lvo);
		}
		return "대출상품 : " + baseCnt + "건\n대출상품옵션 : " + optCnt + "건\n업데이트완료";
	}

	@Override // 대출 정보 삭제
	public void deleteAllLoans() {
		l.deleteAllLoanOpt();
		l.deleteAllLoanBase();
	}

	@Override
	public List<LoanBaseVO> selectBestLoanBase(UserVO vo) {
		return l.selectBestLoanBase(vo);
	}

	@Override
	public List<LoanBaseVO> selectRandomLoanBase() {
		return l.selectRandomLoanBase();
	}

}

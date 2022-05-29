package com.keumbi.prj.account.mapper;

import java.util.List;

import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.user.vo.UserVO;

public interface AccountMapper {
	List<AccountVO> selectAllAccount(String user_Id); 		// 로그인 회원의 전체 계좌 조회
	AccountVO selectOneAccount(AccountVO vo); 				// 계좌 단건조회
	
	int selectAccTotalSum(String userId); 					// 잔액 합산 반환
	
	int insertAccount(AccountVO vo); 						// API로 불러온 계좌 저장
	int updateAccount(AccountVO vo); 						// 잔액/상품명/상품ID/계좌종류 UPDATE (최초 1회)
	int deleteAccounts(UserVO vo);							// 해당 유저의 계좌/거래내역 삭제
	
	int insertAccTrans(AccTransVO vo); 						// acc_trans 거래내역 저장 (최초 1회);
	int insertTrans(LedgerVO vo); 							// total_trans 거래내역 저장
	
	Integer selectPrdDep(AccountVO vo);						// 상품이름 > 예금 ID
	Integer selectPrdSav(AccountVO vo);						// 상품이름 > 적금 ID
	Integer selectPrdLoan(AccountVO vo);					// 상품이름 > 대출 ID
}

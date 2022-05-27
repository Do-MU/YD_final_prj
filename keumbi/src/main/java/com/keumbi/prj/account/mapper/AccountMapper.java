package com.keumbi.prj.account.mapper;

import java.util.List;

import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.user.vo.UserVO;

public interface AccountMapper {
	List<AccountVO> selectAllAccount(String user_Id); 		// 로그인 회원의 전체 계좌 조회
	AccountVO selectOneAccount(String fintech_use_num); 	// 계좌 단건조회
	int selectAccount(String fintech_use_num); 				// fintech_use_num -> 계좌중복여부
	int insertAccount(AccountVO vo); 						// API로 불러온 계좌 저장
	int updateAccount(AccountVO vo); 						// 잔액/상품명 UPDATE (최초 1회)
	int selectAccTotalSum(String userId); 					// 잔액 합산 반환
	int deleteAccounts(UserVO vo);							// 해당 유저의 계좌/거래내역 삭제
	String selectPrdDep(String fintech_use_num );				// 예금 id
	String selectPrdSav(String fintech_use_num);				// 적금 id
	String selectPrdLoan(String fintech_use_num);				// 대출 id
}

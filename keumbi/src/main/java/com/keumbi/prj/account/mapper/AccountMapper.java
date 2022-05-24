package com.keumbi.prj.account.mapper;

import java.util.List;

import com.keumbi.prj.account.vo.AccountVO;

public interface AccountMapper {
	List<AccountVO> selectAllAccount(String user_Id); 	// DB에 저장된 계좌 전체 조회
	AccountVO selectOneAccount(String fintech_use_num); // 계좌단건조회
	int selectAccount(String fintech_use_num); 			// fin_num -> 계좌중복여부
	int insertAccount(AccountVO vo); 					// API로 불러온 계좌 저장
	int updateBalance(AccountVO vo); 					// 잔액 UPDATE(최초 1회)
	int selectAccTotalSum(String userId); 				// 잔액 합산 출력
}

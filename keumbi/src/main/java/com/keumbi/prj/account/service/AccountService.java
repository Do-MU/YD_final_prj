package com.keumbi.prj.account.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.keumbi.prj.account.vo.AccountVO;

public interface AccountService {
	List<AccountVO> selectfirstAccount(HttpSession session); 	// 회원 보유 계좌전체조회 -> DB저장(최초 1회)
	List<AccountVO> selectAllAccount(HttpSession session); 			// DB 저장 된 계좌 전체 조회
	int selectAccTotalSum(String userId); 						// 잔액 합산 출력
	AccountVO selectOneAccount(String fintech_use_num); // 계좌단건조회
	
	// 문제점 !!!!!!!!!!!!
	// 다른 회원 같은 finNum -> 오류
	
}

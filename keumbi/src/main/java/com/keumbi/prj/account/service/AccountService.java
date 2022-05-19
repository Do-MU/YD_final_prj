package com.keumbi.prj.account.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.keumbi.prj.account.vo.AccountVO;

public interface AccountService {
	List<AccountVO> selectAll(HttpSession session); // 회원 보유 계좌전체조회 -> user_id로 검색
	int selectAccount(String fintech_use_num); // 계좌일치여부조회
	AccountVO selectOne(String fintech_use_num); // 계좌단건조회
	int insertAccount(AccountVO vo);
	int updateBalance(AccountVO vo); // 잔액수정
	
	// 문제점 !!!!!!!!!!!!
	// 다른 회원 같은 finNum -> 오류
	
}

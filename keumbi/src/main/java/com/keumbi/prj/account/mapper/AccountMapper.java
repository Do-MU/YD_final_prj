package com.keumbi.prj.account.mapper;

import java.util.List;


import com.keumbi.prj.account.vo.AccountVO;

public interface AccountMapper {
	List<AccountVO> selectfirstAccount(String user_id); // 회원 보유 계좌전체조회
	List<AccountVO> selectAllAccount(String user_Id); // db저장 된 계좌 전체 조회
	int selectAccount(String fintech_use_num); // fin_num -> 계좌중복여부
	AccountVO selectOneAccount(String fintech_use_num); // 계좌단건조회
	int insertAccount(AccountVO vo); // api불러운 계좌 저장
	int updateBalance(AccountVO vo); // 잔액(최초1회)
}

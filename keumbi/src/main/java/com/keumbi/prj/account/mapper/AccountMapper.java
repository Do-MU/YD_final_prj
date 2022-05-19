package com.keumbi.prj.account.mapper;

import java.util.List;

import com.keumbi.prj.account.vo.AccountVO;

public interface AccountMapper {
	List<AccountVO> selectAll(String user_id); // 계좌목록조회
	int selectAccount(String fintech_use_num); // 계좌일치여부조회
	AccountVO selectOne(String fintech_use_num); // 계좌단건조회
	int insertAccount(AccountVO vo);
	int updateBalance(AccountVO vo); // 잔액수정
}

package com.keumbi.prj.account.mapper;

import java.util.List;

import com.keumbi.prj.account.vo.AccountVO;

public interface AccountMapper {
	List<AccountVO> selectAll(String user_id);
	AccountVO selectOne(AccountVO vo);
	int insertAccount(AccountVO vo);
	int updateAccount(AccountVO vo);
	int deleteAccount(AccountVO vo);
}

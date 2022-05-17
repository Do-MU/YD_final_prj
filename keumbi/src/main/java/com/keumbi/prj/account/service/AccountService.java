package com.keumbi.prj.account.service;

import java.util.List;

import com.keumbi.prj.account.vo.AccountVO;

public interface AccountService {
	List<AccountVO> selectAll();
	AccountVO selectOne(AccountVO vo);
	int insertAccount(AccountVO vo);
	int updateAccount(AccountVO vo);
	int deleteAccount(AccountVO vo);
}

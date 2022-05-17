package com.keumbi.prj.account.service;

import java.util.List;

import com.keumbi.prj.account.vo.AccountVO;

public interface AccountService {
	public List<AccountVO> selectAll();
	public AccountVO selectOne(AccountVO vo);
	public int insertAccount(AccountVO vo);
	public int updateAccount(AccountVO vo);
	public int deleteAccount(AccountVO vo);
}

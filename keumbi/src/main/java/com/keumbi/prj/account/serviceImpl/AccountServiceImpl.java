package com.keumbi.prj.account.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired AccountMapper m;
	
	@Override
	public List<AccountVO> selectAll() {
		return m.selectAll();
	}

	@Override
	public AccountVO selectOne(AccountVO vo) {
		return m.selectOne(vo);
	}

	@Override
	public int insertAccount(AccountVO vo) {
		return m.insertAccount(vo);
	}

	@Override
	public int updateAccount(AccountVO vo) {
		return m.updateAccount(vo);
	}

	@Override
	public int deleteAccount(AccountVO vo) {
		return m.deleteAccount(vo);
	}
	
}

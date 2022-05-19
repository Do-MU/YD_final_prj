package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;

public interface DepositService {
	List<DepositBaseVO> selectAllDepBase();
	DepositBaseVO selectOneDepBase(int dep_id);
	List<DepositOptionVO> selectAllDepOpt(int dep_id);
	
	String insertAllDeposits();
	void deleteAllDeposits();
	
	List<DepositBaseVO> selectBankName();
}

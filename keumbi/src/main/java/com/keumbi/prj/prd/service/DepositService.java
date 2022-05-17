package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;

public interface DepositService {
	List<DepositBaseVO> selectAllDepBase();
	List<DepositOptionVO> selectAllDepOpt();
	
	int insertDepBase(DepositBaseVO vo);
	int insertDepOpt(DepositOptionVO vo);
	int deleteAllDepBase();
	int deleteAllDepOpt();
}

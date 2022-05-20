package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;

public interface DepositMapper {
	int insertDepBase(DepositBaseVO vo);
	int insertDepOpt(DepositOptionVO vo);
	int deleteAllDepBase();
	int deleteAllDepOpt();
	List<DepositBaseVO> selectAllDepBase();
	DepositBaseVO selectOneDepBase(int dep_id);
	List<DepositOptionVO> selectAllDepOpt(int dep_id);
	
	String selectBankName(String kor_co_nm);
}

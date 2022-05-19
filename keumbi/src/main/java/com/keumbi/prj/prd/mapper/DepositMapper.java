package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;

public interface DepositMapper {
	List<DepositBaseVO> selectAllDepBase();
	List<DepositOptionVO> selectAllDepOpt(int dep_id);
	int insertDepBase(DepositBaseVO vo);
	int insertDepOpt(DepositOptionVO vo);
	int deleteAllDepBase();
	int deleteAllDepOpt();
}

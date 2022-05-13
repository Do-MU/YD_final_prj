package com.keumbi.prj.prd.mapper;

import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;

public interface DepositBaseMapper {
	int selectDepId(DepositBaseVO vo);
	int InsertDepBase(DepositBaseVO vo);
	int InsertDepOpt(DepositOptionVO vo);
}

package com.keumbi.prj.prd.mapper;

import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;

public interface SavingMapper {
	int insertSavBase(SavingBaseVO vo);
	int insertSavOpt(SavingOptionVO vo);
	int deleteAllSavBase();
	int deleteAllSavOpt();
}

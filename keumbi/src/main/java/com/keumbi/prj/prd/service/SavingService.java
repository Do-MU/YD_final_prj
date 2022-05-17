package com.keumbi.prj.prd.service;

import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;

public interface SavingService {
	int insertSavBase(SavingBaseVO vo);
	int insertSavOpt(SavingOptionVO vo);
	int deleteAllSavBase();
	int deleteAllSavOpt();
}

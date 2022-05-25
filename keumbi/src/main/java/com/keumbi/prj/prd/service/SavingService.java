package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;

public interface SavingService {
	List<SavingBaseVO> selectAllSavBase();
	SavingBaseVO selectOneSavBase(int sav_id);
	List<SavingOptionVO> selectAllSavOpt(int sav_id);
	
	String insertAllSavings();
	void deleteAllSavings();
	
}

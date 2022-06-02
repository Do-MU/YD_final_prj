package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.user.vo.UserVO;

public interface SavingService {
	List<SavingBaseVO> selectAllSavBase();
	SavingBaseVO selectOneSavBase(int sav_id);
	List<SavingOptionVO> selectAllSavOpt(int sav_id);
	
	String insertAllSavings();
	void deleteAllSavings();
	List<SavingBaseVO> selectBestSavBase(UserVO vo);
	List<SavingBaseVO> selectRandomSavBase();
}

package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.user.vo.UserVO;

public interface SavingMapper {
	int insertSavBase(SavingBaseVO vo);
	int insertSavOpt(SavingOptionVO vo);
	int deleteAllSavBase();
	int deleteAllSavOpt();
	
	List<SavingBaseVO> selectAllSavBase();
	SavingBaseVO selectOneSavBase(int sav_id);
	List<SavingOptionVO> selectAllSavOpt(int sav_id);
	CodeVO selectBankName(String kor_co_nm);
	List<SavingBaseVO> selectBestSavBase(UserVO vo);
	List<SavingBaseVO> selectRandomSavBase();
}

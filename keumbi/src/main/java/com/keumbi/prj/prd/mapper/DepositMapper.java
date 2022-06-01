package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.user.vo.UserVO;

public interface DepositMapper {
	int insertDepBase(DepositBaseVO vo);
	int insertDepOpt(DepositOptionVO vo);
	int deleteAllDepBase();
	int deleteAllDepOpt();
	List<DepositBaseVO> selectAllDepBase();
	DepositBaseVO selectOneDepBase(int dep_id);
	List<DepositOptionVO> selectAllDepOpt(int dep_id);
	CodeVO selectBankName(String kor_co_nm);
	List<DepositBaseVO> selectBestDepBase(UserVO vo);
	List<DepositBaseVO> selectRandomDepBase();
}

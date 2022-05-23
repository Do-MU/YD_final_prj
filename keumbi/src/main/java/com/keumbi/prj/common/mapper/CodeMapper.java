package com.keumbi.prj.common.mapper;

import java.util.List;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.user.vo.UserVO;

public interface CodeMapper {
	List<CodeVO> keywordCode();
	List<CodeVO> categoryCode();
	List<CodeVO> bankCode();
	List<CodeVO> selectUserKwdCode(String id);
}
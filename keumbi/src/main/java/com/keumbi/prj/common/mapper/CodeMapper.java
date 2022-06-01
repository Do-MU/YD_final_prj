package com.keumbi.prj.common.mapper;

import java.util.List;

import com.keumbi.prj.common.vo.CodeVO;

public interface CodeMapper {
	List<CodeVO> keywordCode();
	List<CodeVO> categoryCode();
	List<CodeVO> bankCode();
	List<CodeVO> selectUserKwdCode(String id);
	String selectChallCode(String chall_code);
}
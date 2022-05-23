package com.keumbi.prj.common.service;

import java.util.List;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.user.vo.UserVO;

public interface CodeService {
	List<CodeVO> keywordCode();
	List<CodeVO> categoryCode();
	List<CodeVO> bankCode(String val);
	List<CodeVO> selectUserKwdCode(String id);
}

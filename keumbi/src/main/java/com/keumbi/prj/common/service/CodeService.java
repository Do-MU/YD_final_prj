package com.keumbi.prj.common.service;

import java.util.List;

import com.keumbi.prj.common.vo.CodeVO;

public interface CodeService {
	List<CodeVO> keywordCode();
	List<CodeVO> categoryCode();
}

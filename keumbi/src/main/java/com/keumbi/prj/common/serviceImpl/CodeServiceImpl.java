package com.keumbi.prj.common.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.common.mapper.CodeMapper;
import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.common.vo.CodeVO;

@Service
public class CodeServiceImpl implements CodeService {
	@Autowired CodeMapper m;
	
	@Override
	public List<CodeVO> keywordCode() {
		return m.keywordCode();
	}

	@Override
	public List<CodeVO> categoryCode() {
		return m.categoryCode();
	}

	@Override
	public List<CodeVO> bankCode(String val) {
		return m.bankCode();
	}



}

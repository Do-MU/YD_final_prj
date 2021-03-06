package com.keumbi.prj.common.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.common.mapper.CodeMapper;
import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.noti.service.NotiService;

@Service
public class CodeServiceImpl implements CodeService {
	@Autowired CodeMapper m;
	@Autowired NotiService noti;
	
	@Override
	public List<CodeVO> keywordCode() {
		return m.keywordCode();
	}

	@Override
	public List<CodeVO> categoryCode() {
		return m.categoryCode();
	}

	@Override
	public List<CodeVO> bankCode() {
		return m.bankCode();
	}

	@Override
	public List<CodeVO> selectUserKwdCode(String id) {
		return m.selectUserKwdCode(id);
	}

	@Override
	public String selectChallCode(String id, String chall_code) {
		 
		return m.selectChallCode(chall_code);
	}
}

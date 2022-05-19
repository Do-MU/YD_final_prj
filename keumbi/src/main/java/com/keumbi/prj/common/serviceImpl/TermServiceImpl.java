package com.keumbi.prj.common.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.common.mapper.TermMapper;
import com.keumbi.prj.common.service.TermService;
import com.keumbi.prj.common.vo.TermVO;

@Service
public class TermServiceImpl implements TermService {

	@Autowired TermMapper m;
	
	@Override
	public TermVO joinTerm() {
		return m.joinTerm();
	}

}

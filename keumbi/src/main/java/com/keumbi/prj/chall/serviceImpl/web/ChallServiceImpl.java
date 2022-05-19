package com.keumbi.prj.chall.serviceImpl.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.chall.mapper.ChallMapper;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.chall.vo.ChallVO;

@Service
public class ChallServiceImpl implements ChallService {
	@Autowired ChallMapper m;
	
	@Override
	public List<ChallVO> challList() {
		return m.challList();
	}

	@Override
	public ChallVO challSelect(ChallVO vo) {
		return m.challSelect(vo);
	}
}

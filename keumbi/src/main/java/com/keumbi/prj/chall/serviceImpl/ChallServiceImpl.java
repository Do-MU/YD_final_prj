package com.keumbi.prj.chall.serviceImpl;

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
	public List<ChallVO> challList(String id) {
		return m.challList(id);
	}

	@Override
	public int challSelect(ChallVO vo) {
		return m.challSelect(vo);
	}

	@Override
	public int challInsert(ChallVO vo) {
		return m.challInsert(vo);
	}

}

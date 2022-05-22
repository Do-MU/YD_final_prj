package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.prd.mapper.PrdChallengeMapper;
import com.keumbi.prj.prd.service.PrdChallengeService;
import com.keumbi.prj.prd.vo.PrdChallengeVO;

@Service
public class PrdChallengeServiceImpl implements PrdChallengeService{
	
	@Autowired PrdChallengeMapper m;

	@Override
	public List<PrdChallengeVO> prdChallengeList() {
		return m.prdChallengeList();
	}

	@Override
	public PrdChallengeVO prdChallengeSelect(PrdChallengeVO vo) {
		return m.prdChallengeSelect(vo);
	}

	@Override
	public int prdChallInsert(PrdChallengeVO vo) {
		return m.prdChallInsert(vo);
	}

	@Override
	public int prdChallUpdate(PrdChallengeVO vo) {
		return m.prdChallUpdate(vo);
	}

	@Override
	public int prdChallDelte(PrdChallengeVO vo) {
		return m.prdChallDelte(vo);
	}	
}

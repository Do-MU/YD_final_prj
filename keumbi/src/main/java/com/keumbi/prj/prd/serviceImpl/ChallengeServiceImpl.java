package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.prd.mapper.ChallengeMapper;
import com.keumbi.prj.prd.service.ChallengeService;
import com.keumbi.prj.prd.vo.ChallengeVO;

@Service
public class ChallengeServiceImpl implements ChallengeService{
	
	@Autowired ChallengeMapper m;

	@Override
	public List<ChallengeVO> challengeList() {
		return m.challengeList();
	}

	@Override
	public ChallengeVO challengeSelect(ChallengeVO vo) {
		return m.challengeSelect(vo);
	}

	@Override
	public int challInsert(ChallengeVO vo) {
		return m.challInsert(vo);
	}

	@Override
	public int challUpdate(ChallengeVO vo) {
		return m.challUpdate(vo);
	}

	@Override
	public int challDelte(ChallengeVO vo) {
		return m.challDelte(vo);
	}	
}

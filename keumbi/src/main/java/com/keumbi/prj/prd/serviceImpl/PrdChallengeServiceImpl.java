package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.prd.mapper.PrdChallengeMapper;
import com.keumbi.prj.prd.service.PrdChallengeService;
import com.keumbi.prj.prd.vo.PrdChallengeVO;
import com.keumbi.prj.prd.vo.TransSearchVO;

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

	// 챌린지에 해당하는 회원의 지난 한달간 지출내역 목록
	@Override
	public List<LedgerVO> transList(TransSearchVO vo) {
		String catDiv = vo.getCategory().substring(0, 3);
		
		if(catDiv.equals("CKA")) {
			return m.transListByCatA(vo);
		}
		else if(catDiv.equals("CKB")) {
			
			return m.transListByCatB(vo);
		}
		return null;
	}
}

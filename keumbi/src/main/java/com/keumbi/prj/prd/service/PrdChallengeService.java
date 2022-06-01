package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.prd.vo.PrdChallengeVO;
import com.keumbi.prj.prd.vo.TransSearchVO;

public interface PrdChallengeService {
	List<PrdChallengeVO> prdChallengeList();				// 전체조회
	PrdChallengeVO prdChallengeSelect(PrdChallengeVO vo);	// 단건조회
	int prdChallInsert(PrdChallengeVO vo);					// 등록
	int prdChallUpdate(PrdChallengeVO vo);					// 수정
	int prdChallDelte(PrdChallengeVO vo);					// 삭제
	List<LedgerVO> transList(TransSearchVO vo);				// 챌린지에 해당하는 회원의 지출내역 목록
}

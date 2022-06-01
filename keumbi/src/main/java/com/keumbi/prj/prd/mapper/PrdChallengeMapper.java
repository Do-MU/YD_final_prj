package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.prd.vo.PrdChallengeVO;
import com.keumbi.prj.prd.vo.TransSearchVO;

public interface PrdChallengeMapper {
	List<PrdChallengeVO> prdChallengeList();				// 전체조회
	PrdChallengeVO prdChallengeSelect(PrdChallengeVO vo);	// 단건조회
	int prdChallInsert(PrdChallengeVO vo);					// 등록
	int prdChallUpdate(PrdChallengeVO vo);					// 수정
	int prdChallDelte(PrdChallengeVO vo);					// 삭제
	
	// 소비목록 가져오기
	List<LedgerVO> transListByCatA(TransSearchVO vo);
	List<LedgerVO> transListByCatB(TransSearchVO vo);
}

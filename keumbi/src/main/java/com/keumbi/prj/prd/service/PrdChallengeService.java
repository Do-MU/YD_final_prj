package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.PrdChallengeVO;

public interface PrdChallengeService {
	List<PrdChallengeVO> prdChallengeList();				// 전체조회
	PrdChallengeVO prdChallengeSelect(PrdChallengeVO vo);	// 단건조회
	int prdChallInsert(PrdChallengeVO vo);					// 등록
	int prdChallUpdate(PrdChallengeVO vo);					// 수정
	int prdChallDelte(PrdChallengeVO vo);					// 삭제
}

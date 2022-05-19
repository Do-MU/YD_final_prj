package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.prd.vo.ChallengeVO;

public interface ChallengeMapper {
	List<ChallengeVO> challengeList();	//전체조회
	ChallengeVO challengeSelect(ChallengeVO vo);		//단건조회
	int challInsert(ChallengeVO vo);					//등록
	int challUpdate(ChallengeVO vo);					//수정
	int challDelte(ChallengeVO vo);					//삭제
}

package com.keumbi.prj.chall.service;

import java.util.List;

import com.keumbi.prj.chall.vo.ChallVO;

public interface ChallService {
	List<ChallVO> challList(String id);			// 전체조회
	int challSelect(ChallVO vo);				// 단건조회
	int challInsert(ChallVO vo);				// 등록
	int challTotalUser(int chall_num);			// 챌린지 도전자 수
	int makeDummyChall();
	int userAmtSumA(ChallVO vo);
}

package com.keumbi.prj.chall.service;

import java.util.List;

import com.keumbi.prj.chall.vo.ChallVO;
import com.keumbi.prj.user.vo.UserVO;

public interface ChallService {
	List<ChallVO> challList(UserVO vo);			// 전체조회
	int challCount(ChallVO vo);				// 단건조회
	int challInsert(ChallVO vo);				// 등록
	int challTotalUser(int chall_num);			// 챌린지 도전자 수
	int challTransAmt(ChallVO vo);				// 챌린지 진행 이후 해당 챌린지의 카테고리에 해당하는 지출 총합
	
	int makeDummyChall();
}

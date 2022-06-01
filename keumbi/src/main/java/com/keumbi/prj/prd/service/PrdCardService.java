package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.PrdCardVO;
import com.keumbi.prj.user.vo.UserVO;

public interface PrdCardService {

	List<PrdCardVO> selectAllPrdCard(); 		// 전체 카드상품
	List<PrdCardVO> selectRandomCard(); 		// 랜덤으로 5개 출력
	PrdCardVO selectOneCard(PrdCardVO vo); 		// 카드 단건 상세보기 출력
	List<PrdCardVO> selectCompanyCard(PrdCardVO vo); // 카드사별 상품 리스트
	List<PrdCardVO> selectRecoAge(UserVO vo);			// 연령대별 카드 추천
	
	int makeDummyCard();
}

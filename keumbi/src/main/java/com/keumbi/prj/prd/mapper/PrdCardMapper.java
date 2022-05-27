package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.prd.vo.PrdCardVO;

public interface PrdCardMapper {

	List<PrdCardVO> selectAllPrdCard(); // 전체 카드상품
	List<PrdCardVO> selectRandomCard(); // 랜덤으로 5개 출력
}

package com.keumbi.prj.chall.service;

import java.util.List;

import com.keumbi.prj.chall.vo.ChallVO;

public interface ChallService {
	List<ChallVO> challList();			//전체조회
	ChallVO challSelect(ChallVO vo);		//단건조회
}

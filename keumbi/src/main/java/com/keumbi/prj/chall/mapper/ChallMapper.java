package com.keumbi.prj.chall.mapper;

import java.util.List;

import com.keumbi.prj.chall.vo.ChallVO;

public interface ChallMapper {
	List<ChallVO> challList();
	ChallVO challSelect(ChallVO vo);
}

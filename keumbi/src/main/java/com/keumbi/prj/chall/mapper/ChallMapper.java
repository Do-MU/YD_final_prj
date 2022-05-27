package com.keumbi.prj.chall.mapper;

import java.util.List;

import com.keumbi.prj.chall.vo.ChallVO;

public interface ChallMapper {
	List<ChallVO> challList(String id);
	int challSelect(ChallVO vo);
	int challInsert(ChallVO vo);
	int challTotalUser(int chall_num);
}

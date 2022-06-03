package com.keumbi.prj.sanction.service;

import java.util.List;

import com.keumbi.prj.sanction.vo.SanctionVO;

public interface SanctionService {
	List<SanctionVO> sanUser();			//전체제재유저
	int sanInsert(SanctionVO vo);	//제재유저등록
}

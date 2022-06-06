package com.keumbi.prj.sanction.mapper;

import java.util.List;

import com.keumbi.prj.sanction.vo.SanctionVO;

public interface SanctionMapper {
	List<SanctionVO> sanUser();
	int sanInsert(SanctionVO vo);
	int sanUserCodeUpdate(SanctionVO vo);	//제재유저코드 업데이트
	int sanUserCount();						//제재유저 확인
	int sanUserDayUpdate(SanctionVO vo);	//제재된 유저 일자 업데이트
}

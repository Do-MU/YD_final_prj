package com.keumbi.prj.accTrans.mapper;

import java.util.List;

import com.keumbi.prj.accTrans.vo.AccTransVO;

public interface AccTransMapper {

	List<AccTransVO> selectAccTransAll(String fintech_use_num); // 거래내역 전체 조회
	
	int insertAccTrans(AccTransVO vo);
}

package com.keumbi.prj.accTrans.mapper;

import java.util.List;

import com.keumbi.prj.accTrans.vo.AccTransVO;

public interface AccTransMapper {

	List<AccTransVO> selectAccTransAll(String fintech_use_num); // 거래내역 전체 조회 -> db저장(최초1회)
	int insertAccTrans(AccTransVO vo); // 거래내역 저장(최초1회);
	int selectAccTransOne(String fintech_use_num); // fin_num -> 거래 내역 중복여부
	List<AccTransVO> selectAccTrans(String fintech_use_num); // db에 저장된 거래내역 불러오기
}

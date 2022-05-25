package com.keumbi.prj.accTrans.mapper;

import java.util.List;

import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.accTrans.vo.RemitVO;

public interface AccTransMapper {

	List<AccTransVO> selectAccTransAll(String fintech_use_num); // 거래내역 전체 조회
	int insertAccTrans(AccTransVO vo); // 거래내역 저장(최초1회);
	int selectAccTransOne(String fintech_use_num); // fin_num -> 거래 내역 중복여부
	List<AccTransVO> selectAccTransDate(AccTransReqVO vo); // 날짜 조건 거래내역 조회
	int insertRemit(RemitVO vo); // 송금 -> 거래내역 insert
	
}

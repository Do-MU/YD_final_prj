package com.keumbi.prj.accTrans.service;

import java.util.List;

import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;

public interface AccTransService {

	List<AccTransVO> selectAccTransAll(String fintech_use_num); // 거래내역 전체 조회
	List<AccTransVO> selectAccTransDate(AccTransReqVO vo); // 날짜 조건 거래내역 조회
}

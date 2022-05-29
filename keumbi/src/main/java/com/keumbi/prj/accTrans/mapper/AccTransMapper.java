package com.keumbi.prj.accTrans.mapper;

import java.util.List;

import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.accTrans.vo.RemitVO;
import com.keumbi.prj.account.vo.AccountVO;

public interface AccTransMapper {

	List<AccTransVO> selectAllAccTrans(AccountVO acc); 		// 거래내역 전체 조회
	List<AccTransVO> selectAccTransDate(AccTransReqVO vo); 				// 날짜 조건 거래내역 조회
	int selectAccTransOne(String fintech_use_num); 						// fin_num -> 거래 내역 중복여부
	int insertRemit(RemitVO vo); 										// 송금 -> 거래내역 insert
	
}

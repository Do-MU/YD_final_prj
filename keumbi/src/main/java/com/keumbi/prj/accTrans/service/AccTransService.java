package com.keumbi.prj.accTrans.service;

import java.util.List;

import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.accTrans.vo.RemitVO;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.user.vo.UserVO;

public interface AccTransService {

	List<AccTransVO> selectAllAccTrans(AccountVO acc); 			// 거래내역 전체 조회
	List<AccTransVO> selectAccTransDate(AccTransReqVO vo); 		// 날짜 조건 거래내역 조회
	void insertRemit(UserVO user, RemitVO rem); 				// 송금 -> 거래내역 INSERT
}

package com.keumbi.prj.accTrans.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;

public interface AccTransService {

	List<AccTransVO> selectAccTransAll(HttpSession session, AccTransReqVO vo); // 거래내역 전체 조회
	
}

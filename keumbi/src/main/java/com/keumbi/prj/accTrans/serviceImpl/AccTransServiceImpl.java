package com.keumbi.prj.accTrans.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.accTrans.mapper.AccTransMapper;
import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;

@Service
public class AccTransServiceImpl implements AccTransService {

	@Autowired AccTransMapper mapper;

	// 거래내역 전체 조회
	@Override
	public List<AccTransVO> selectAccTransAll(String fintech_use_num) {
		
		return mapper.selectAccTransAll(fintech_use_num);
	}

	// 날짜 조건 거래내역 조회
	@Override
	public List<AccTransVO> selectAccTransDate(AccTransReqVO vo) {
		//System.out.println(mapper.selectAccTransDate(vo));
		
		return mapper.selectAccTransDate(vo);
	}
}

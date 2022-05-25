package com.keumbi.prj.accTrans.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.accTrans.mapper.AccTransMapper;
import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.accTrans.vo.RemitVO;

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

	// 송금 -> 거래내역 insert
	@Override
	public int insertRemit(RemitVO vo) {
		Date nowDate = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HHmmss");
		String tdate = sdf1.format(nowDate);
		String ttime = sdf2.format(nowDate);
		
		vo.setTran_date(tdate);
		vo.setTran_time(ttime);
		//System.out.println(tdate + "====" + ttime);
		
		mapper.insertRemit(vo);
		
		
		
		return mapper.insertRemit(vo);
	}
}

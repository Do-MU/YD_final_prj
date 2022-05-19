package com.keumbi.prj.accTrans.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.accTrans.mapper.AccTransMapper;
import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class AccTransServiceImpl implements AccTransService {

	@Autowired AccTransMapper mapper;

	@Override
	public List<AccTransVO> selectAccTransAll(HttpSession session, AccTransReqVO vo) {
		UserVO uservo = (UserVO) session.getAttribute("loginUser");
		
		// 불러온 결과 
		List<AccTransVO> list = BankAPI.getTransaction(uservo, vo);
		System.out.println("거래내역 리스트 : " + list);
		// -> 인설트 작업
		// -> 새로운 거래내역 비교
		for(AccTransVO avo : list) {
			mapper.insertAccTrans(avo);
		}
		
		AccTransVO avo = new AccTransVO();
		
		return mapper.selectAccTransAll(avo.getFintech_use_num());
	}

}

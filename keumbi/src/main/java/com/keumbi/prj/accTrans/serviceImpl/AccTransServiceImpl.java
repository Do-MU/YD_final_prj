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
import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.noti.service.NotiService;
import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class AccTransServiceImpl implements AccTransService {

	@Autowired AccTransMapper transMapper;
	@Autowired AccountMapper accMapper;
	
	@Autowired NotiService noti;

	// 거래내역 전체 조회
	@Override
	public List<AccTransVO> selectAllAccTrans(AccountVO acc) {
		
		return transMapper.selectAllAccTrans(acc);
	}

	// 날짜 조건 거래내역 조회
	@Override
	public List<AccTransVO> selectAccTransDate(AccTransReqVO vo) {
		
		return transMapper.selectAccTransDate(vo);
	}

	// 송금 -> 거래내역 insert
	@Override
	public void insertRemit(UserVO user, RemitVO rem) {
		// 날짜변환
		Date nowDate = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HHmmss");
		rem.setTran_date(sdf1.format(nowDate));
		rem.setTran_time(sdf2.format(nowDate));
		
		//잔액계산
		int witAftBal = rem.getWit_amt() - rem.getTran_amt();
		int depAftBal = rem.getDep_amt() + rem.getTran_amt();
		
		// 출/입금 거래내역 INSERT
		rem.setWit_after_balance_amt(witAftBal);
		rem.setDep_after_balance_amt(depAftBal);

		transMapper.insertRemit(rem);
		
		// account T -> 잔액 UPDATE
		AccountVO wvo = new AccountVO();
		wvo.setFintech_use_num(rem.getWit_fintech_use_num());
		wvo.setBalance_amt(witAftBal);
		accMapper.updateAccount(wvo);
		
		AccountVO dvo = new AccountVO();
		dvo.setFintech_use_num(rem.getDep_fintech_use_num());
		dvo.setBalance_amt(depAftBal);
		accMapper.updateAccount(dvo);
		
		// 이체 알림 -> userId
		NotiVO nvo = new NotiVO();
		nvo.setUser_id(user.getId());
		nvo.setNoti_code("N2");
		noti.notiInsert(nvo);
	}
}

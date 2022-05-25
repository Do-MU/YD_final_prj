package com.keumbi.prj.accTrans.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.accTrans.mapper.AccTransMapper;
import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.accTrans.vo.RemitVO;
import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class AccTransServiceImpl implements AccTransService {

	@Autowired AccTransMapper transMapper;
	@Autowired AccountMapper accMapper;

	// 거래내역 전체 조회
	@Override
	public List<AccTransVO> selectAccTransAll(String fintech_use_num) {
		
		return transMapper.selectAccTransAll(fintech_use_num);
	}

	// 날짜 조건 거래내역 조회
	@Override
	public List<AccTransVO> selectAccTransDate(AccTransReqVO vo) {
		//System.out.println(mapper.selectAccTransDate(vo));
		
		return transMapper.selectAccTransDate(vo);
	}

	// 송금 -> 거래내역 insert
	@Override
	public int insertRemit(HttpSession session, RemitVO vo) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");		
		
		// 날짜변환
		Date nowDate = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HHmmss");
		String tdate = sdf1.format(nowDate);
		String ttime = sdf2.format(nowDate);
		vo.setTran_date(tdate);
		vo.setTran_time(ttime);
		//System.out.println(tdate + "====" + ttime);
		
		//잔액계산
		int witAftBal = vo.getWit_amt() - vo.getTran_amt();
		System.out.println("*********" + witAftBal);
		
		int depAftBal = vo.getDep_amt() + vo.getTran_amt();
		System.out.println("*********" + depAftBal);
		
		// 출금 입금 insert
		vo.setWit_after_balance_amt(witAftBal);
		vo.setDep_after_balance_amt(depAftBal);
		if(vo.getWit_print_content() == null) {
			vo.setWit_print_content(vo.getDep_bank_name() + " " + uvo.getName());
			vo.setDep_print_content(vo.getWit_bank_name() + " " + uvo.getName());
			transMapper.insertRemit(vo);
		}
		// insert 실패 시 ????????????
		
		// account T -> 잔액 update
		AccountVO wvo = new AccountVO();
		wvo.setFintech_use_num(vo.getWit_fintech_use_num());
		wvo.setBalance_amt(witAftBal);
		accMapper.updateBalance(wvo);
		
		AccountVO dvo = new AccountVO();
		dvo.setFintech_use_num(vo.getDep_fintech_use_num());
		dvo.setBalance_amt(depAftBal);
		accMapper.updateBalance(dvo);
		
		return 0;
	}
}

package com.keumbi.prj.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.keumbi.prj.prd.service.DepositService;
import com.keumbi.prj.prd.service.LoanService;
import com.keumbi.prj.prd.service.SavingService;
import com.keumbi.prj.user.service.UserService;

@Component
public class Scheduler {
	@Autowired UserService userserv;
	@Autowired DepositService depserv;
	@Autowired SavingService savserv;
	@Autowired LoanService loaserv;
	
	//@Scheduled(cron = "0 0 10 * * *")
	public void autoUpdate() {
	
		userserv.schedulerUpdateUser(); // 제재회원 -> 일반회원 전환
		userserv.schedulerDeleteUser(); // 탈퇴회원 -> 탈퇴처리
		
		/* 금융API 자동 업데이트 */
		depserv.insertAllDeposits();
		savserv.insertAllSavings();
		loaserv.insertAllLoans();
	}
	
}

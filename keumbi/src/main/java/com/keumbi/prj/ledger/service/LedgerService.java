package com.keumbi.prj.ledger.service;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.prd.vo.PrdChallengeVO;

public interface LedgerService {
	List<LedgerMonthVO> totalTrans(LedgerMonthVO vo);
	int monthTotalAmt(LedgerMonthVO vo);
	List<LedgerVO> dayTrans(LedgerVO vo);
	List<LedgerVO> dayTotalAmt(LedgerVO vo);
	int cashInsert(LedgerVO vo);
	List<LedgerVO> ledgerSearch(LedgerVO vo);
	int ledgerUpdate(LedgerVO vo); // 가계부 거래내역 수정 처리 
	int ledgerDelete(LedgerVO vo); // 가계부 서래내역 삭제 처리
	List<LedgerVO> avgAmt(PrdChallengeVO vo);	//소비평균금액 가져오기
}

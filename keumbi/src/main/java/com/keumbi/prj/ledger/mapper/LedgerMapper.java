package com.keumbi.prj.ledger.mapper;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;


public interface LedgerMapper {
	List<LedgerMonthVO> totalTrans(LedgerMonthVO vo);
	LedgerMonthVO monthTotalAmt(LedgerMonthVO vo);
	List<LedgerVO> dayTrans(LedgerVO vo);
	List<LedgerVO> dayTotalAmt(LedgerVO vo);
	int cashInsert(LedgerVO vo);
	List<LedgerVO> ledgerSearch(LedgerVO vo);
	int ledgerUpdate(LedgerVO vo); // 가계부 거래내역 수정 처리
	int ledgerDelete(LedgerVO vo); // 가계부 거래내역 삭제 처리
}

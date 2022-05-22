package com.keumbi.prj.ledger.mapper;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;

public interface LedgerMapper {
	List<LedgerMonthVO> totalTrans(LedgerMonthVO vo);
	String monthTotalAmt(LedgerMonthVO vo);
	List<LedgerVO> dayTrans(LedgerVO vo);
	List<LedgerVO> dayTotalAmt(LedgerVO vo);
	int cashInsert(LedgerVO vo);
	List<LedgerVO> ledgerSearch(LedgerVO vo);
	int transInsert(LedgerVO vo); // 거래내역 입력(최초1회)
}

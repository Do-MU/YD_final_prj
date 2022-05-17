package com.keumbi.prj.ledger.service;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;

public interface LedgerService {
	List<LedgerMonthVO> totalTrans();
	List<LedgerVO> dayTrans(LedgerVO vo);
	int cashInsert(LedgerVO vo);
}

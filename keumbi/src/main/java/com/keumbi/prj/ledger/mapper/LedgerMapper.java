package com.keumbi.prj.ledger.mapper;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;

public interface LedgerMapper {
	
	List<LedgerMonthVO> totalTrans();
	List<LedgerVO> dayTrans(LedgerVO vo);
	public void cashInsert(LedgerVO vo);
	
}

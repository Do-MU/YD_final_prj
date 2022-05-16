package com.keumbi.prj.ledger.mapper;

import java.util.List;

import com.keumbi.prj.ledger.vo.LedgerVO;

public interface LedgerMapper {
	
	List<LedgerVO> totalTrans();
}

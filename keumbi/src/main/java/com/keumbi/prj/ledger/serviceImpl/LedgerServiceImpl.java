package com.keumbi.prj.ledger.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.ledger.mapper.LedgerMapper;
import com.keumbi.prj.ledger.service.LedgerService;
import com.keumbi.prj.ledger.vo.LedgerMonthVO;
import com.keumbi.prj.ledger.vo.LedgerVO;

@Service
public class LedgerServiceImpl implements LedgerService {

	@Autowired LedgerMapper m;
	
	@Override
	public List<LedgerMonthVO> totalTrans(LedgerMonthVO vo) {
		return m.totalTrans(vo);
	}

	@Override
	public List<LedgerVO> dayTrans(LedgerVO vo) {
		return m.dayTrans(vo);
	}

	@Override
	public int cashInsert(LedgerVO vo) {
		return m.cashInsert(vo);
	}

	@Override
	public String monthTotalAmt(LedgerMonthVO vo) {
		return m.monthTotalAmt(vo);
		
	}

	@Override
	public List<LedgerVO> dayTotalAmt(LedgerVO vo) {
		return m.dayTotalAmt(vo);
	}

	@Override
	public List<LedgerVO> ledgerSearch(LedgerVO vo) {
		return m.ledgerSearch(vo);
	}

}

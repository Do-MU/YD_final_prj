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
	List<LedgerVO> ledEditModal(LedgerVO vo); // 가계부 편집 모달창에 수정 또는 삭제할 데이터 출력
	int ledgerUpdate(LedgerVO vo); // 가계부 거래내역 수정 처리 
}

package com.keumbi.prj.sanction.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.report.mapper.ReportMapper;
import com.keumbi.prj.report.vo.ReportVO;
import com.keumbi.prj.sanction.mapper.SanctionMapper;
import com.keumbi.prj.sanction.service.SanctionService;
import com.keumbi.prj.sanction.vo.SanctionVO;

@Service
public class SanctionServiceImpl implements SanctionService{
	@Autowired SanctionMapper m;
	@Autowired ReportMapper rm;
	@Autowired BoardMapper bm;
	
	@Override
	public List<SanctionVO> sanUser() {
		return m.sanUser();
	}

	@Override
	public int sanInsert(SanctionVO vo) {
		ReportVO repvo = new ReportVO();
		System.out.println(vo.getSanc_reason());
		repvo.setRep_reason(vo.getSanc_reason());
		repvo.setRep_code(vo.getSanc_code());

		rm.reportDelete(repvo);
		return m.sanInsert(vo);
	}
	
}

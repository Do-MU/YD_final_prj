package com.keumbi.prj.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.reply.mapper.ReplyMapper;
import com.keumbi.prj.reply.vo.ReplyVO;
import com.keumbi.prj.report.mapper.ReportMapper;
import com.keumbi.prj.report.service.ReportService;
import com.keumbi.prj.report.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired ReportMapper m;
	@Autowired BoardMapper b;
	@Autowired ReplyMapper r;
	
	@Override
	public List<ReportVO> reportList() {
		return m.reportList();
	}


	@Override
	public String repReason(ReportVO vo) {
		String repcode = vo.getRep_code();
		if(repcode.equals("SB")) {
			BoardVO bvo = b.view(vo.getRep_reason());
			return "<p><제목></p><p>"+bvo.getTitle() + "</p><p><내용></p>" + bvo.getContents();
		}else {
			ReplyVO rvo = r.SelectOneReply(vo.getRep_reason());
			return rvo.getRe_contents();
		}
	}


	@Override
	public void reportInsert(ReportVO vo) {
		m.reportInsert(vo);
		
	}
	
	@Override
	public void reportInsertInsert(ReportVO vo) {
		m.reportInsertInsert(vo);
		
	}

}

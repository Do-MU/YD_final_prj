package com.keumbi.prj.sanction.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.reply.mapper.ReplyMapper;
import com.keumbi.prj.reply.vo.ReplyVO;
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
	@Autowired ReplyMapper rem;
	
	@Override
	public List<SanctionVO> sanUser() {
		return m.sanUser();
	}

	@Override
	public int sanInsert(SanctionVO vo) {
		ReportVO repvo = new ReportVO();
		repvo.setRep_reason(vo.getRep_reason());
		repvo.setRep_code(vo.getSanc_code());
		System.out.println(vo);
		if(m.sanUserCount(vo) == 0) {	
			if(vo.getSanc_code().equals("SB") || vo.getSanc_code().equals("적절하지 않은 게시글")) {
				BoardVO bvo = new BoardVO();
				bvo.setBod_num(vo.getRep_reason());
				bvo.setTitle("관리자에 의해 삭제된 게시글 입니다.");
				bm.boardUpdate(bvo);
			}else if(vo.getSanc_code().equals("SR") || vo.getSanc_code().equals("적절하지 않은 댓글")) {
				ReplyVO revo = new ReplyVO();
				revo.setRe_num(vo.getRep_reason());
				revo.setRe_contents("관리자에 의해 삭제된 댓글 입니다.");
				rem.replyUpdate(revo);
			}
			rm.reportDelete(repvo);
			m.sanUserCodeUpdate(vo);
			return m.sanInsert(vo);
		}else {
			rm.reportDelete(repvo);
			return m.sanUserDayUpdate(vo);
		}
	}
	
}

package com.keumbi.prj.sanction.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.noti.mapper.NotiMapper;
import com.keumbi.prj.noti.vo.NotiVO;
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
	@Autowired NotiMapper noti;
	
	@Override
	public List<SanctionVO> sanUser() {
		return m.sanUser();
	}

	@Override
	public int sanInsert(SanctionVO vo) {
		int cnt = 0;
		
		if(m.sanUserCount(vo) == 0) {			// 현재 제재 받고 있지 않은 회원일 경우
			m.sanUserCodeUpdate(vo);
			
			cnt += m.sanInsert(vo);
		}else {									// 현재 제재를 받고 있는 회원일 경우
			
			cnt += m.sanUserDayUpdate(vo);
		}
		
		// 게시글 혹은 댓글 내용 변경
		if(vo.getSanc_code().equals("SB")) {
			BoardVO bvo = new BoardVO();
			bvo.setBod_num(vo.getRep_reason());
			bvo.setTitle("관리자에 의해 삭제된 게시글 입니다.");
			bvo.setBod_code("T2");
			bm.boardUpdate(bvo);
		}else if(vo.getSanc_code().equals("SR")) {
			ReplyVO revo = new ReplyVO();
			revo.setRe_num(vo.getRep_reason());
			revo.setRe_contents("관리자에 의해 삭제된 댓글 입니다.");
			rem.replyUpdate(revo);
		}
		
		// 알림 등록
		NotiVO nvo = new NotiVO();
		nvo.setNoti_code("N6");
		nvo.setSanc_code(vo.getSanc_code());
		nvo.setEdate(vo.getEdate());
		nvo.setUser_id(vo.getUser_id());
		noti.notiInsert(nvo);
		
		// 신고 삭제
		ReportVO repvo = new ReportVO();
		repvo.setRep_reason(vo.getRep_reason());
		repvo.setRep_code(vo.getSanc_code());
		rm.reportDelete(repvo);
		
		return cnt;
	}
}

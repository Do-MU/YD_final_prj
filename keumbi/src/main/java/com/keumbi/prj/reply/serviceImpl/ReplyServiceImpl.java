package com.keumbi.prj.reply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.noti.mapper.NotiMapper;
import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.reply.mapper.ReplyMapper;
import com.keumbi.prj.reply.service.ReplyService;
import com.keumbi.prj.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired ReplyMapper r;
	@Autowired NotiMapper noti;
	@Autowired BoardMapper b;
	
	@Override
	public void replyCount(int re_num) {
		r.replyCount();
	}

	@Override
	public List<ReplyVO> replyList(ReplyVO vo) {
		List<ReplyVO> list = r.replyList(vo);
		for(ReplyVO re : list) {
			re.setPre_re(r.rorList(re));
		}
		return list;
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		BoardVO bvo = b.boradView(vo.getBod_num());			// 댓글이 달린 게시글의 작성자 ID를 가져온다
		NotiVO nvo = new NotiVO();
		nvo.setNoti_code("N1");
		nvo.setUser_id(bvo.getUser_id());
		if(!bvo.getUser_id().equals(vo.getUser_id())) {		// 댓글 작성자 != 게시글 작성자
			noti.notiInsert(nvo);							// 알림 등록
		}
		return r.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return r.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int re_num) {
		r.preReplyDelete(re_num);
		return r.replyDelete(re_num);
	}
	
	
	

	@Override
	public List<ReplyVO> rorList(ReplyVO vo) {
		return r.rorList(vo);
	}
	
	@Override
	public int rorInsert(ReplyVO vo) {
		ReplyVO rvo = r.SelectOneReply(vo.getPre_re_num());
		NotiVO nvo = new NotiVO();
		nvo.setNoti_code("N10");
		nvo.setUser_id(rvo.getUser_id());
		if(!rvo.getUser_id().equals(vo.getUser_id())) {		// 댓글 작성자 != 답글 작성자
			noti.notiInsert(nvo);							// 알림 등록
		}
		return r.rorInsert(vo);
	}
	
	@Override
	public int rorUpdate(ReplyVO vo) {
		return r.rorUpdate(vo);
	}
	
	@Override
	public int rorDelete(int re_num) {
		return r.rorDelete(re_num);
	}
}

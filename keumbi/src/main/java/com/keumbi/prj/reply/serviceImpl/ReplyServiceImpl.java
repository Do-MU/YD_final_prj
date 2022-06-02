package com.keumbi.prj.reply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.reply.mapper.ReplyMapper;
import com.keumbi.prj.reply.service.ReplyService;
import com.keumbi.prj.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired ReplyMapper m;
	
	@Override
	public void replyCount(int re_num) {
		m.replyCount();

	}

	@Override
	public List<ReplyVO> replyList(ReplyVO vo) {
		List<ReplyVO> list = m.replyList(vo);
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setPre_re(m.preReplyList(list.get(i)));
		}
		return list;
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		return m.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return m.replyUpdate(vo);
		
		

	}

	@Override
	public int replyDelete(int re_num) {
		m.preReplyDelete(re_num);
		return m.replyDelete(re_num);

	}
	
	@Override
	public int rorInsert(ReplyVO vo) {
		return m.rorInsert(vo);
	}
	
	@Override
	public int rorUpdate(ReplyVO vo) {
		return m.rorUpdate(vo);
		
	}
	
	@Override
	public int rorDelete(int re_num) {
		return m.rorDelete(re_num);

	}
	@Override
	public int preReplyDelete(int re_num) {		
		return m.preReplyDelete(re_num);
	}
}

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
		return m.replyList(vo);
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		return m.replyInsert(vo);
	}

	@Override
	public void replyUpdate(ReplyVO vo) {
		m.replyUpdate(vo);

	}

	@Override
	public int replyDelete(int re_num) {
		return m.replyDelete(re_num);

	}

}

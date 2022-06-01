package com.keumbi.prj.reply.service;

import java.util.List;

import com.keumbi.prj.reply.vo.ReplyVO;

public interface ReplyService {

	void replyCount(int re_num);
	List<ReplyVO> replyList(ReplyVO vo);
	int replyInsert(ReplyVO vo);
	int replyUpdate(ReplyVO vo);
	int replyDelete(int re_num);
	
	int rorInsert(ReplyVO vo);
	int rorUpdate(ReplyVO vo);
	int rorDelete(int re_num);
	int preReplyDelete(int re_num);
	
	
}

package com.keumbi.prj.reply.mapper;

import java.util.List;

import com.keumbi.prj.reply.vo.ReplyVO;

public interface ReplyMapper {

	int replyCount();
	List<ReplyVO> replyList(ReplyVO vo);
	int replyInsert(ReplyVO vo);
	int replyUpdate(ReplyVO vo);
	int replyDelete(int re_num);
	
	int rorInsert(ReplyVO vo);
	int rorUpdate(ReplyVO vo);
	int rorDelete(int re_num);
	int preReplyDelete(int re_num);
	List<ReplyVO> preReplyList(ReplyVO vo);
	
	ReplyVO SelectOneReply(int re_num);			//댓글 단건 조회
}

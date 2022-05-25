package com.keumbi.prj.reply.mapper;

import java.util.List;

import com.keumbi.prj.reply.vo.ReplyVO;

public interface ReplyMapper {

	int replyCount();
	List<ReplyVO> replyList(ReplyVO vo);
	int replyInsert(ReplyVO vo);
	void replyUpdate(ReplyVO vo);
	int replyDelete(int re_num);
}

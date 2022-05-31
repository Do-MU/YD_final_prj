package com.keumbi.prj.qna.mapper;

import java.util.List;

import com.keumbi.prj.qna.vo.QnaVO;

public interface QnaMapper {
	
	List<QnaVO> qnaListSelectAll(String id);	//사용자 문의글 전체조회
	void qnaInsert(QnaVO vo); 					//사용자 1:1 문의글 등록
	void qnaDelete(int num);					//사용자 문의글 삭제

}

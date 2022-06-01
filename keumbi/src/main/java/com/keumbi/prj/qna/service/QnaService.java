package com.keumbi.prj.qna.service;

import java.util.List;

import com.keumbi.prj.qna.vo.QnaVO;

public interface QnaService {

	List<QnaVO> qnaListSelectAll(String id); 	//고객센터 문의글 전체 출력
	void qnaInsert(QnaVO vo); 					//사용자 1:1 문의글 등록
	void qnaDelete(int num);					//사용자 문의글 삭제
}

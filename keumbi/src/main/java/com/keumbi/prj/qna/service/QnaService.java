package com.keumbi.prj.qna.service;

import java.util.List;

import com.keumbi.prj.common.vo.PageVO;
import com.keumbi.prj.qna.vo.QnaVO;

public interface QnaService {

	//사용자 고객센터 페이지
	List<QnaVO> qnaListSelectAll(String id); 	//고객센터 문의글 전체 출력
	void qnaInsert(QnaVO vo); 					//사용자 1:1 문의글 등록
	void qnaDelete(int num);					//사용자 문의글 삭제
	
	//관리자 고객센터 페이지
	List<QnaVO> qnaAdminList(PageVO pvo);		//관리자 문의글 전체조회
	QnaVO qnaAdminSelectOne(int num);			//관리자 문의글 조회
	void qnaAdminUpdate(QnaVO vo);				//관리자 문의글 답변 등록
	
	//페이징 처리
	int qnaCount();
	int qnaSortCount(String code);
}

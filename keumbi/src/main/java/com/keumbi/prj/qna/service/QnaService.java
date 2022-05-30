package com.keumbi.prj.qna.service;

import java.util.List;

import com.keumbi.prj.qna.vo.QnaVO;

public interface QnaService {

	List<QnaVO> qnaListSelectAll(); //고객센터 문의글 전체 출력
}

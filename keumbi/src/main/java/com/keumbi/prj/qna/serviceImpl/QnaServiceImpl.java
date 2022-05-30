package com.keumbi.prj.qna.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.qna.mapper.QnaMapper;
import com.keumbi.prj.qna.service.QnaService;
import com.keumbi.prj.qna.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired QnaMapper m;
	
	@Override
	public List<QnaVO> qnaListSelectAll() {
		return m.qnaListSelectAll();
	}

}

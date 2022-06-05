package com.keumbi.prj.qna.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.common.vo.PageVO;
import com.keumbi.prj.noti.service.NotiService;
import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.qna.mapper.QnaMapper;
import com.keumbi.prj.qna.service.QnaService;
import com.keumbi.prj.qna.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired QnaMapper m;
	@Autowired NotiService noti;
	
	@Override
	public List<QnaVO> qnaListSelectAll(String id) {
		return m.qnaListSelectAll(id);
	}

	@Override
	public void qnaInsert(QnaVO vo) {
		// 날짜변환
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		vo.setQdate(sdf.format(nowDate));
		
		m.qnaInsert(vo);
	}

	@Override
	public void qnaDelete(int num) {
		m.qnaDelete(num);		
	}

	@Override
	public List<QnaVO> qnaAdminList(PageVO pvo) {
		return m.qnaAdminList(pvo);
	}

	@Override
	public QnaVO qnaAdminSelectOne(int num) {
		return m.qnaAdminSelectOne(num);
	}

	@Override
	public void qnaAdminUpdate(QnaVO vo) {		
		m.qnaAdminUpdate(vo);
		
		NotiVO nvo = new NotiVO();
		nvo.setUser_id(m.qnaAdminSelectOne(vo.getNum()).getUser_id());
		nvo.setNoti_code("N3");
		noti.notiInsert(nvo);
	}

	@Override
	public int qnaCount() {
		return m.qnaCount();
	}

	@Override
	public int qnaSortCount(String code) {
		return m.qnaSortCount(code);
	}
}

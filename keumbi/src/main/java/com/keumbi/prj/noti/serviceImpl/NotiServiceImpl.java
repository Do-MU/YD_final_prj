package com.keumbi.prj.noti.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.noti.mapper.NotiMapper;
import com.keumbi.prj.noti.service.NotiService;
import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class NotiServiceImpl implements NotiService {
	
	@Autowired NotiMapper m;
	
	@Override
	public List<NotiVO> notiSelect(UserVO vo) {
		
		return m.notiSelect(vo);
	}

	@Override
	public int notiInsert(NotiVO VO) {
		return m.notiInsert(VO);
	}

	@Override
	public int notiReadUpdate(NotiVO vo) {
		return m.notiReadUpdate(vo);
	}

	@Override
	public int notiDelete(NotiVO vo) {
		return m.notiDelete(vo);
	}

}

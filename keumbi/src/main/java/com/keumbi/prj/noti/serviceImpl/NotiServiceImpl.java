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
	public void notiReadUpdateAll(UserVO vo) {
		List<NotiVO> notis = m.notiSelect(vo);
		for(NotiVO n : notis) {
			m.notiReadUpdate(n);
		}
	}

	@Override
	public int notiInsert(NotiVO vo) {
		return m.notiInsert(vo);
	}

	@Override
	public int notiReadUpdate(NotiVO vo) {
		return m.notiReadUpdate(vo);
	}

	@Override
	public void notiReadDelete(UserVO vo) {
		m.notiDelete(vo);
	}
}

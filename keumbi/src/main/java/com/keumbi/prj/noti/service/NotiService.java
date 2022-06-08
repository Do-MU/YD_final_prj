package com.keumbi.prj.noti.service;

import java.util.List;

import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.user.vo.UserVO;

public interface NotiService {
	List<NotiVO> notiSelect(UserVO vo);
	void notiReadUpdateAll(UserVO vo);
	int notiInsert(NotiVO vo);
	int notiReadUpdate(NotiVO vo);
	void notiReadDelete(UserVO vo);
	void notiReadOne(NotiVO vo);	// 클릭시 읽음 처리
}

package com.keumbi.prj.noti.service;

import java.util.List;

import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.user.vo.UserVO;

public interface NotiService {
	List<NotiVO> notiSelect(UserVO vo);
	int notiInsert(NotiVO VO);
	int notiReadUpdate(NotiVO vo);
	int notiDelete(NotiVO vo);
}
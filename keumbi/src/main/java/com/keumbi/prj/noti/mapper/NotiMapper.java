package com.keumbi.prj.noti.mapper;

import java.util.List;

import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.user.vo.UserVO;

public interface NotiMapper {
	List<NotiVO> notiSelect(UserVO vo);
	int notiInsert(NotiVO VO);
	int notiReadUpdate(NotiVO vo);
	int notiDelete(UserVO vo);
}

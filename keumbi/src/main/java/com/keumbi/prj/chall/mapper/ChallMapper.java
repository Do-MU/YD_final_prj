package com.keumbi.prj.chall.mapper;

import java.util.List;

import com.keumbi.prj.chall.vo.ChallVO;
import com.keumbi.prj.user.vo.UserVO;

public interface ChallMapper {
	List<ChallVO> selectChallList(UserVO vo);
	int challCount(ChallVO vo);
	int challInsert(ChallVO vo);
	int challTotalUser(int chall_num);
	ChallVO selectChall(ChallVO ch);
	int challUpdate(ChallVO ch);
}

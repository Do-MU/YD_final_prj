package com.keumbi.prj.user.mapper;

import java.util.List;

import com.keumbi.prj.user.vo.UserVO;

public interface UserMapper {
	List<UserVO> userSelectList();
	UserVO userSelect(UserVO vo);
	UserVO userFind(UserVO vo);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
	
	// 토큰 저장
	int selectToken(UserVO vo);
	int UpdateToken(UserVO vo);
}

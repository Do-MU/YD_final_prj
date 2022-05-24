package com.keumbi.prj.user.service;

import java.util.List;

import com.keumbi.prj.user.vo.UserVO;

public interface UserService {
	List<UserVO> userSelectList();
	UserVO userSelect(UserVO vo);
	int userKwdInsert(String id, String keyword);
	int userKwdDelete(String id, String keyword);
	String userIdFind(UserVO vo);
	String userPwFind(UserVO vo);
	int userPwUpdate(UserVO vo);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
	
	// 토큰 저장
	int selectToken(UserVO vo);
	int UpdateToken(UserVO vo);
	
	int insertRandUser();
}

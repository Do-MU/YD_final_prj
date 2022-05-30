package com.keumbi.prj.user.service;

import java.util.List;

import com.keumbi.prj.user.vo.UserManageVO;
import com.keumbi.prj.user.vo.UserVO;

public interface UserService {
	List<UserManageVO> userList();
	UserVO userSelect(UserVO vo);
	int userKwdInsert(String id, String[] keyword);
	int userKwdDelete(String id);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
	String userEmailChenk(String email);
	
	// 토큰 저장
	int selectToken(UserVO vo);
	int UpdateToken(UserVO vo);
}

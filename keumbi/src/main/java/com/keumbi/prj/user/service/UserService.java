package com.keumbi.prj.user.service;

import java.util.List;
import java.util.Map;

import com.keumbi.prj.sanction.vo.SanctionVO;
import com.keumbi.prj.user.vo.SancUserSearchVO;
import com.keumbi.prj.user.vo.UserVO;

public interface UserService {
	List<UserVO> allUser();
	UserVO userSelect(UserVO vo);
	int userKwdInsert(String id, String[] keyword);
	int userKwdDelete(String id);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
	int userCancle(UserVO vo);
	String userEmailChenk(String email);
	List<Map> userSearch(SancUserSearchVO vo);
	int schedulerUpdateUser();
	int schedulerDeleteUser();	
	
	// 토큰 저장
	int selectToken(UserVO vo);
	int UpdateToken(UserVO vo);
}

package com.keumbi.prj.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keumbi.prj.user.vo.UserVO;

public interface UserMapper {
	List<UserVO> userSelectList();
	UserVO userSelect(UserVO vo);
	int userKwdInsert(@Param("id")String id, @Param("keyword")String keyword);
	int userKwdDelete(@Param("id")String id, @Param("keyword")String keyword);
	String userIdFind(UserVO vo);
	String userPwFind(UserVO vo);
	int userPwUpdate(UserVO vo);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
	// 토큰 저장
	int selectToken(UserVO vo);
	int UpdateToken(UserVO vo);
}

package com.keumbi.prj.user.mapper;

import java.util.List;

import com.keumbi.prj.user.vo.UserVO;

public interface UserMapper {
	List<UserVO> userSelectList();
	UserVO userSelect(UserVO vo);
	UserVO userCheck(UserVO vo);
	UserVO userFind(UserVO vo);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
}

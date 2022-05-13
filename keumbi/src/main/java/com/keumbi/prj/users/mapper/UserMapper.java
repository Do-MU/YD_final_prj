package com.keumbi.prj.users.mapper;

import java.util.List;


import com.keumbi.prj.users.vo.UserVO;

public interface UserMapper {
	List<UserVO> userSelectList();
	UserVO userSelect(UserVO vo);
	UserVO userCheck(UserVO vo);
	UserVO userFind(UserVO vo);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
}

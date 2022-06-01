package com.keumbi.prj.user.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.keumbi.prj.user.vo.SancUserSearchVO;
import com.keumbi.prj.user.vo.UserVO;

public interface UserMapper {
	List<UserVO> allUser();
	UserVO userSelect(UserVO vo);
	int userKwdInsert(@Param("id")String id, @Param("keyword")String keyword);
	int userKwdDelete(String id);
	int userInsert(UserVO vo);
	int userUpdate(UserVO vo);
	int userDelete(UserVO vo);
	List<Map> userSearch(SancUserSearchVO vo);
	
	// 토큰 저장
	int selectToken(UserVO vo);
	int updateToken(UserVO vo);
}

package com.keumbi.prj.user.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.user.mapper.UserMapper;
import com.keumbi.prj.user.service.UserService;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired UserMapper m;
	
	@Override
	public List<UserVO> userSelectList() {
		return m.userSelectList();
	}

	@Override
	public UserVO userSelect(UserVO vo) {
		return m.userSelect(vo);
	}

	@Override
	public int userKwdInsert(String id, String keyword) {
		return m.userKwdInsert(id, keyword);
	}

	@Override
	public UserVO userIdFind(UserVO vo) {
		return m.userIdFind(vo);
	}

	@Override
	public UserVO userPwFind(UserVO vo) {
		return m.userPwFind(vo);
	}

	@Override
	public int userInsert(UserVO vo) {
		return m.userInsert(vo);
	}

	@Override
	public int userUpdate(UserVO vo) {
		return m.userUpdate(vo);
	}

	@Override
	public int userDelete(UserVO vo) {
		return m.userDelete(vo);
	}

	@Override
	public int selectToken(UserVO vo) {
		return m.selectToken(vo);
	}

	@Override
	public int UpdateToken(UserVO vo) {
		return m.UpdateToken(vo);
	}

}

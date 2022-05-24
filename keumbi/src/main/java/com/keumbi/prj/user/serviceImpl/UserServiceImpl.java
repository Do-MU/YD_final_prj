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
	
	private static int seq = 1;
	
	@Override
	public List<UserVO> userSelectList() {
		
		return m.userSelectList();
	}

	@Override
	public UserVO userSelect(UserVO vo) {
		
		return m.userSelect(vo);
	}

	@Override
	public int userInsert(UserVO vo) {
		String[] arrBirth = vo.getBirth().split("-");
		String birth = "";
		for (String s : arrBirth) {
			birth += s;
		}
		vo.setBirth(birth.substring(2));
		
		return m.userInsert(vo);
	}

	@Override
	public int userKwdInsert(String id, String keyword) {
		
		return m.userKwdInsert(id, keyword);
	}

	@Override
	public String userIdFind(UserVO vo) {
		
		return m.userIdFind(vo);
	}

	@Override
	public String userPwFind(UserVO vo) {
		
		return m.userPwFind(vo);
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
		
		return m.updateToken(vo);
	}

	@Override
	public int userPwUpdate(UserVO vo) {
		
		return m.userPwUpdate(vo);
	}

	@Override
	public int insertRandUser() {
		UserVO vo = new UserVO();
		String test = "test";
		String t = "테스트";
		int i = (int) (Math.floor(Math.random()*2)+1);
		String s = ""+seq;
		if(seq<10) {
			s = "000"+seq;
		}else if(seq<100) {
			s = "00"+seq;
		}else if(seq<1000) {
			s = "0"+seq;
		}
		
		vo.setId(test+s);
		vo.setPw(test+s);
		vo.setName(t+s);
		vo.setBirth("570101");
		vo.setGender_code("G"+i);
		vo.setEmail(test+s+"@abc.com");
		seq++;
		return m.userInsert(vo);
	}

	@Override
	public int userKwdDelete(String id, String keyword) {
		
		return m.userKwdDelete(id, keyword);
	}	
}

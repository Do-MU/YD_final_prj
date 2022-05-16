package com.keumbi.prj.user.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.user.mapper.UserMapper;
import com.keumbi.prj.user.vo.UserVO;


@Controller
public class UserController {
	@Autowired UserMapper mapper;
	
	@RequestMapping("/userLoginForm")
	public String userLoginForm(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "user/userLoginForm";
	}
	
	@RequestMapping("/userLogin")
	public String userLogin(HttpSession session, UserVO userVO) {
		UserVO loginUser = mapper.userSelect(userVO); 
		
		if(loginUser != null && loginUser.getPw().equals(loginUser.getPw())) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:home";
		}else {
			return "redirect:userLoginForm";
		}		
	}
	
	
}

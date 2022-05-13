package com.keumbi.prj.users.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.users.mapper.UserMapper;
import com.keumbi.prj.users.vo.UserVO;


@Controller
public class UserController {
	@Autowired UserMapper mapper;
	
	@RequestMapping("/userLoginForm")
	public String userLoginForm() {
		return "user/userLoginForm";
	}
	
	@RequestMapping("/userLogin")
	public String userLogin(Model model, UserVO userVO) {
		UserVO loginUser = mapper.userSelect(userVO); 
		
		if(loginUser != null && loginUser.getPw().equals(loginUser.getPw())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home";
		}else {
			return "redirect:userLoginForm";
		}		
	}
}

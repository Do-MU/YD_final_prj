package com.keumbi.prj.noti.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.noti.service.NotiService;
import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class NotiController {
	
	@Autowired NotiService svc;
	
	@RequestMapping("/notiSelect")
	@ResponseBody
	public List<NotiVO> notiSelect(HttpSession session){
		return svc.notiSelect((UserVO) session.getAttribute("loginUser"));
	}
	
	@RequestMapping("/notiReadAll")
	@ResponseBody
	public void notiReadAll(UserVO loginUser){
		svc.notiReadUpdateAll(loginUser);
		
	}
	
	@RequestMapping("/notiReadDel")
	@ResponseBody
	public void notiReadDel(UserVO loginUser) {
		svc.notiReadDelete(loginUser);
	}
	
	@RequestMapping("/notiReadOne")
	@ResponseBody
	public void notiReadOne(UserVO loginUser, int num) {
		NotiVO vo = new NotiVO();
		vo.setUser_id(loginUser.getId());
		vo.setNum(num);
		svc.notiReadOne(vo);
	}
}

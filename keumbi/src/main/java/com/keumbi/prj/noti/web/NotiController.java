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
}
package com.keumbi.prj.accTrans.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;

@Controller
public class AccTransController {

	@Autowired AccTransService accTransServiceImpl;
	
	@RequestMapping("/accTransRes")
	public String accTransRes(HttpSession session, Model model, AccTransReqVO vo) {
		System.out.println("!!!" + vo);
		model.addAttribute("accTrans", accTransServiceImpl.selectAccTransAll(session, vo));
		
		return "account/transList";
	}
}

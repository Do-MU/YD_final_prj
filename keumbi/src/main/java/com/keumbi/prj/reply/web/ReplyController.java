package com.keumbi.prj.reply.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.reply.service.ReplyService;
import com.keumbi.prj.reply.vo.ReplyVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService service;

	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	@ResponseBody
	private List<ReplyVO> replyList(ReplyVO vo) {
		
		List<ReplyVO> replyList = service.replyList(vo);		
		
		return replyList;
		
	}
	
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	@ResponseBody
	private int replyInsert(ReplyVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setUser_id(uvo.getId());
		
		
		
		return service.replyInsert(vo);
	}
	
	@RequestMapping(value = "/rorInsert", method = RequestMethod.POST)
	@ResponseBody
	private int rorInsert(ReplyVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setUser_id(uvo.getId());
		
		
		
		return service.rorInsert(vo);
		
	}
	
	@RequestMapping("/replyUpdate")
    @ResponseBody 
	private int replyUpdate(ReplyVO vo) {
		
		
		
		return service.replyUpdate(vo);
		
	}
	
	@RequestMapping("/rorUpdate")
    @ResponseBody 
	private int rorUpdate(ReplyVO vo) {
		
		
		
		return service.rorUpdate(vo);
		
	}
	
	@RequestMapping("/replyDelete")
	@ResponseBody
	private int replyDelete(@RequestParam("re_num") int re_num) {
		
		
		
		return service.replyDelete(re_num);
	}
	
	@RequestMapping("/rorDelete")
	@ResponseBody
	private int rorDelete(@RequestParam("re_num") int re_num) {
		
		
		
		return service.rorDelete(re_num);
	}
	
	

}

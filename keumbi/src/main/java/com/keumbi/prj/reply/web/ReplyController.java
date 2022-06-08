package com.keumbi.prj.reply.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.reply.service.ReplyService;
import com.keumbi.prj.reply.vo.ReplyVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class ReplyController {

	@Autowired ReplyService service;

	@RequestMapping("/replyList")
	@ResponseBody
	public List<ReplyVO> replyList(ReplyVO vo) {
		
		return service.replyList(vo);
	}
	
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	@ResponseBody
	public int replyInsert(ReplyVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setUser_id(uvo.getId());

		return service.replyInsert(vo);
	}
	
	@RequestMapping("/replyUpdate")
    @ResponseBody 
    public int replyUpdate(ReplyVO vo) {
		return service.replyUpdate(vo);
	}
	
	@RequestMapping("/replyDelete")
	@ResponseBody
	public int replyDelete(@RequestParam("re_num") int re_num) {
		return service.replyDelete(re_num);
	}
	
	@RequestMapping("/rorList")
	@ResponseBody
	public List<ReplyVO> rorList(ReplyVO vo){
		return service.rorList(vo);
	}
	
	@RequestMapping(value = "/rorInsert", method = RequestMethod.POST)
	@ResponseBody
	public int rorInsert(ReplyVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setUser_id(uvo.getId());
		
		
		
		return service.rorInsert(vo);
		
	}
	@RequestMapping("/rorUpdate")
    @ResponseBody 
    public int rorUpdate(ReplyVO vo) {

		return service.rorUpdate(vo);
		
	}
	
	@RequestMapping("/rorDelete")
	@ResponseBody
	public int rorDelete(@RequestParam("re_num") int re_num) {
		
		return service.rorDelete(re_num);
	}
	
	@RequestMapping("/replyCount")
	@ResponseBody
	public int replyCount(BoardVO vo) {
		return service.replyCount(vo.getBod_num());
	}

}

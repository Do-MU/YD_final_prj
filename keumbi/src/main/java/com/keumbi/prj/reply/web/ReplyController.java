package com.keumbi.prj.reply.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.reply.service.ReplyService;
import com.keumbi.prj.reply.vo.ReplyVO;

@Controller
@RequestMapping("/boardView")
public class ReplyController {

	@Autowired
	private ReplyService service;

	@RequestMapping("/replyList")
	@ResponseBody
	private String replyList(Model model) {
		
		List<ReplyVO> list = service.replyList(null); 
		model.addAttribute("replyList", list);
		
		return "redirect:boardList";
		
	}
	
	@RequestMapping("/replyInsert")
	@ResponseBody
	private String replyInsert(@RequestParam int re_num, @RequestParam String re_contents, String user_id) {
		ReplyVO vo = new ReplyVO();
		vo.setRe_num(re_num);
		vo.setRe_contents(re_contents);
		vo.setUser_id(user_id);
		
		return "redirect:boardList";
	}
	
	@RequestMapping("/replyUpdate")
	@ResponseBody
	private String replyUpdate(@RequestParam int re_num, @RequestParam String re_contents) {
		
		ReplyVO vo = new ReplyVO();
		vo.setRe_num(re_num);
		vo.setRe_contents(re_contents);
		
		return "redirect:boardList";
	}
	
	@RequestMapping("/replyDelete")
	@ResponseBody
	private String replyDelete(@PathVariable int re_num) {
		
		return "redirect:boardList";
	}

}

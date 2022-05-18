package com.keumbi.prj.board.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.keumbi.prj.board.service.BoardService;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(BoardVO vo, Model model) {
		
		List<BoardVO> list = service.selectBoardList();
		model.addAttribute("list", list);
		
		return "board/boardList";
	}
	
	@RequestMapping("/boardInsertForm")
	public String boardInsertForm() throws Exception {
		
		return "board/boardInsertForm";
	}
	
	@PostMapping("/insertBoard")
	public String insertBoard(BoardVO vo, HttpSession session){
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setUser_id(uvo.getId());
		vo.getContents();
		service.insertBoard(vo);
		return "redirect:boardList";
	}
	
	
	  @RequestMapping(value = "/boardView", method=RequestMethod.GET) public String
	  boardView(@ModelAttribute("vo") BoardVO vo, Model model) { 
		  List<BoardVO> list = service.boardView(vo.getBod_num()); 
		  model.addAttribute("view", list);
	  
		  return "board/boardView"; 
	}
	 
	
	/*
	 * @RequestMapping(value="/boardView", method=RequestMethod.GET) public String
	 * boardView(BoardVO vo, Model model) {
	 * 
	 * List<BoardVO> list = service.boardView(0); model.addAttribute("list", list);
	 * 
	 * return "board/boardView"; }
	 */

		

}

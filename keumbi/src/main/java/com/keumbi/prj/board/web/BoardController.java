package com.keumbi.prj.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/boardList")
	public String boardList() {
		return "board/boardList";
		
	}
	
	@RequestMapping("/boardInsertForm")
	public String boardWriter() {
		return "board/boardInsertForm";	
	
	}
}

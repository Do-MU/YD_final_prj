package com.keumbi.prj.border.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/boardList")
	public String boardList() {
		return "border/boardList";
		
	}
	
	@RequestMapping("boardWriter")
	public String boardWriter() {
		return "board/boardWriter";	
	
	}
}

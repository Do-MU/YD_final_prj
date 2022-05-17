package com.keumbi.prj.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.board.service.BoardService;
import com.keumbi.prj.board.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/boardList")
	public String boardList() {
		return "board/boardList";
		
	}
	
	@RequestMapping("/boardInsertForm")
	public String boardInsert() {
		return "board/boardInsertForm";	
	
	}
	
	@RequestMapping("/boardView")
	public String boardView() {
		return "board/boardView";
		
	}

    @RequestMapping("/insertBoard")
    public String insertBoard(BoardVO vo) {
        service.boardInsert();
        return "redirect:boardList";
    }
		
	
}

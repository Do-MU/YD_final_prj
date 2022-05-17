package com.keumbi.prj.board.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.service.BoardService;

public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;
	
	@Override
	public String boardInsert() {
		return "redirect:boardList";
	}

}

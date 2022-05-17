package com.keumbi.prj.board.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper m;
	
	@Override
	public int boardInsert() {
		return m.boardInsert();
	}

}

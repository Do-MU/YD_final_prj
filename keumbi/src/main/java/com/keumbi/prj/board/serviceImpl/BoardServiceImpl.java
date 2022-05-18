package com.keumbi.prj.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.service.BoardService;
import com.keumbi.prj.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper m; 
	
	
	/*
	 * @Override public int boardInsert() { return m.boardInsert(); }
	 */

	/*public void boardInsert(BoardVO vo) throws Exception {
		m.boardInsert(vo);*/
	
	@Override
	public void insertBoard(BoardVO vo) {
		m.insertBoard(vo);
	}
	
	public List<BoardVO> boardView(int bod_num) {
		return m.boardView(bod_num);
	}
	
	@Override
	public List<BoardVO> selectBoardList() {
		return m.selectBoardList();
		
	}
		
	

}

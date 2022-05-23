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
	
	@Override
	public void boardHit(int bod_num) {
		m.boardHit(bod_num);
	}
	
	@Override
	public void update(BoardVO vo) {
		m.update(vo);
	}
	
	@Override
	public void delete(int bod_num) {
		m.delete(bod_num);
	}
	
	public BoardVO view(int bod_num) {
		return m.view(bod_num);
	}
		
	@Override
	public List<BoardVO> selectBoardList() {
		return m.selectBoardList();
		
	}
	
	@Override
	public List<BoardVO> boardSearchList(String key, String val) {
		return m.boardSearchList(key, val);
	}

	@Override
	public List<BoardVO> boardSelectList(int page) {
		return m.boardSelectList(page);
	}
	
	
		
	

}

package com.keumbi.prj.board.service;

import java.util.List;

import com.keumbi.prj.board.vo.BoardVO;

public interface BoardService{
	void insertBoard(BoardVO vo);
	void boardHit(int bod_num); 
	void update(BoardVO vo);
	void delete(int bod_num);
	BoardVO view(int bod_num);
	List<BoardVO> tagSelect(int bod_num);	
	List<BoardVO> selectBoardList();
	List<BoardVO> boardSelectList(int page);
	List<BoardVO> boardSearchList(String key, String val);
}

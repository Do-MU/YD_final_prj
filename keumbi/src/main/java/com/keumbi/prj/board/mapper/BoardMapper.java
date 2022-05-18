package com.keumbi.prj.board.mapper;

import java.util.List;

import com.keumbi.prj.board.vo.BoardVO;

public interface BoardMapper {
	/* int boardInsert(); */
	void insertBoard(BoardVO vo);
	List<BoardVO> boardView(int bod_num);
	List<BoardVO> selectBoardList();
}

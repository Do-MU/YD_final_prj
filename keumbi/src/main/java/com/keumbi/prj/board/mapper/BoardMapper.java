package com.keumbi.prj.board.mapper;

import java.util.List;

import com.keumbi.prj.board.vo.BoardKwdVO;
import com.keumbi.prj.board.vo.BoardSearchVO;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.common.vo.PageVO;

public interface BoardMapper {
	List<BoardVO> selectBoardList(PageVO page);
	BoardVO boradView(int bod_num);
	int boardHit(BoardVO vo);
	List<BoardKwdVO> tagSelect(int bod_num);
	int boardInsert(BoardVO vo);
	int boardKwdInsert(BoardKwdVO vo);
	int boardUpdate(BoardVO vo);
	int boardKwdDelete(int bod_num);
	int boardDelete(BoardVO vo);

	int boardCount();
	List<BoardVO> boardSearch(BoardSearchVO search);
	
	
	
}

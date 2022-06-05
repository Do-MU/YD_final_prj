package com.keumbi.prj.board.service;

import java.util.List;

import com.keumbi.prj.board.vo.BoardKwdVO;
import com.keumbi.prj.board.vo.BoardSearchVO;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.common.vo.PageVO;

public interface BoardService{
	List<BoardVO> selectBoardList(PageVO page);
	BoardVO boradView(BoardVO vo);
	int boardHit(BoardVO vo);
	List<BoardKwdVO> tagSelect(int bod_num);
	int boardInsert(BoardVO vo);
	int boardKwdInsert(int bod_num, String[] keyword);
	int boardUpdate(BoardVO vo);
	int boardKwdUpdate(int bod_num, String[] keyword);
	int boardDelete(BoardVO vo);
	
	List<BoardVO> boardSearch(BoardSearchVO search);
	
	//페이징
	int boardCount();
}

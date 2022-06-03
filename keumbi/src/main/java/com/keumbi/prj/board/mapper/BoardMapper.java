package com.keumbi.prj.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keumbi.prj.board.vo.BoardVO;

public interface BoardMapper {
	void insertBoard(BoardVO vo);
	void tagInsert(BoardVO vo);
	void boardHit(int bod_num);
	void update(BoardVO vo);
	void tagUpdate(BoardVO vo);
	void delete(int bod_num);
	void tagDelete(int bod_num);
	BoardVO view(int bod_num);
	List<BoardVO> tagSelect(int bod_num);	
	List<BoardVO> selectBoardList();
	//List<BoardVO> boardSelectList(int page);
	int boardCount();
	int boardSortCount(String code);
	List<BoardVO> boardSearchList(@Param("key") String key, @Param("val") String val);
	
	
	
}

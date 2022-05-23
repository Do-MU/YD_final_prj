package com.keumbi.prj.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keumbi.prj.board.vo.BoardVO;

public interface BoardMapper {
	/* int boardInsert(); */
	void insertBoard(BoardVO vo);
	void boardHit(int bod_num);
	void update(BoardVO vo);
	void delete(int bod_num);
	BoardVO view(int bod_num);
	List<BoardVO> selectBoardList();
	List<BoardVO> boardSelectList(int page);
	List<BoardVO> boardSearchList(@Param("key") String key, @Param("val") String val);
	
	
	
}

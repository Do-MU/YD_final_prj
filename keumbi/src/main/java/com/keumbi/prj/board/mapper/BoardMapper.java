package com.keumbi.prj.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keumbi.prj.board.vo.BoardKwdVO;
import com.keumbi.prj.board.vo.BoardSearchVO;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.common.vo.PageVO;
import com.keumbi.prj.noti.vo.NotiVO;

public interface BoardMapper {
	List<BoardVO> selectBoardList(PageVO page);
	BoardVO boardView(int bod_num);
	int boardHit(BoardVO vo);
	List<BoardKwdVO> tagSelect(int bod_num);
	int boardInsert(BoardVO vo);
	int boardKwdInsert(BoardKwdVO vo);
	int boardUpdate(BoardVO vo);
	int boardKwdDelete(int bod_num);
	int boardDelete(BoardVO vo);

	int boardCount();
	int boardSearchCount(BoardSearchVO search);
	List<BoardVO> boardSearch(@Param("p") PageVO page, @Param("s") BoardSearchVO search);
	List<NotiVO> userSelectByKwd(int bod_num);
	
	
}

package com.keumbi.prj.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.board.mapper.BoardMapper;
import com.keumbi.prj.board.service.BoardService;
import com.keumbi.prj.board.vo.BoardKwdVO;
import com.keumbi.prj.board.vo.BoardSearchVO;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.common.vo.PageVO;
import com.keumbi.prj.noti.mapper.NotiMapper;
import com.keumbi.prj.noti.vo.NotiVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper m; 
	@Autowired NotiMapper noti;
		
	@Override
	public List<BoardVO> selectBoardList(PageVO page) {
		
		return m.selectBoardList(page);
	}
	
	@Override
	public BoardVO boardView(BoardVO vo) {
		return m.boardView(vo.getBod_num());
	}
	
	@Override
	public int boardHit(BoardVO vo) {
		return m.boardHit(vo);
	}

	@Override
	public List<BoardKwdVO> tagSelect(int bod_num) {
		return m.tagSelect(bod_num);
	}
	
	@Override
	public int boardInsert(BoardVO vo) {
		
		return m.boardInsert(vo);
	}

	@Override
	public int boardKwdInsert(int bod_num, String[] keyword) {
		if(keyword != null) {
			for(String kwd : keyword) {
				BoardKwdVO vo = new BoardKwdVO(); 
				vo.setBod_num(bod_num);
				vo.setKwd_code(kwd);
				m.boardKwdInsert(vo);
			}
			List<NotiVO> nvos = m.userSelectByKwd(bod_num);
			for(NotiVO nvo : nvos) {
				nvo.setNoti_code("N4");
				noti.notiInsert(nvo);
			}
		}
		return 0;
	}
	
	@Override
	public int boardUpdate(BoardVO vo) {
		return m.boardUpdate(vo);
	}

	@Override
	public int boardKwdUpdate(int bod_num, String[] keyword) {
		m.boardKwdDelete(bod_num);
		if(keyword != null) {
			for(String kwd : keyword) {
				BoardKwdVO vo = new BoardKwdVO(); 
				vo.setBod_num(bod_num);
				vo.setKwd_code(kwd);
				m.boardKwdInsert(vo);
			}
		}
		return 0;
	}
		
	@Override
	public int boardDelete(BoardVO vo) {
		return m.boardDelete(vo);
	}
	
	@Override
	public List<BoardVO> boardSearch(PageVO page, BoardSearchVO search) {
		return m.boardSearch(page, search);
	}
	
	@Override
	public int boardCount() {
		return m.boardCount();
	}

	@Override
	public int boardSearchCount(BoardSearchVO search) {
		return m.boardSearchCount(search);
	}
}

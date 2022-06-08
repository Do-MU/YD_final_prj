package com.keumbi.prj.board.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keumbi.prj.board.service.BoardService;
import com.keumbi.prj.board.vo.BoardSearchVO;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.common.vo.PageVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService b;

	@RequestMapping("/boardList")
	public String boardList(Model model, PageVO page, BoardSearchVO search) {
		if(search.getVal() != null) {
			int total = b.boardSearchCount(search);
			int pageCnt = total/page.getPageScale()  + (total%page.getPageScale()>0?1:0);
		    int endPage = ((page.getPageNo()-1)/10+1)*10;
		    page.setTotalNo(total);
		    page.setTotalPage(pageCnt);
		    page.setStartPage(((page.getPageNo()-1)/10)*10+1);
		    page.setEndPage(endPage > pageCnt ? pageCnt : endPage);  
			System.out.println(page);
			model.addAttribute("p", page);
			model.addAttribute("s",search);
			model.addAttribute("boards", b.boardSearch(page, search));
		}
		
		else {
			System.out.println("########################Nothing to Search###############################");
			int total = b.boardCount();
			int pageCnt = total/page.getPageScale()  + (total%page.getPageScale()>0?1:0);
		    int endPage = ((page.getPageNo()-1)/10+1)*10;
		    page.setTotalNo(total);
		    page.setTotalPage(pageCnt);
		    page.setStartPage(((page.getPageNo()-1)/10)*10+1);
		    page.setEndPage(endPage > pageCnt ? pageCnt : endPage);  
			System.out.println(page);
			
			model.addAttribute("p", page);
			model.addAttribute("s", search);
			model.addAttribute("boards", b.selectBoardList(page));
		}

		return "board/boardList";
	}

	@RequestMapping("/boardView")
	public String boardView(BoardVO bvo, Model model) {
		b.boardHit(bvo);
		model.addAttribute("board", b.boardView(bvo));
		model.addAttribute("tags", b.tagSelect(bvo.getBod_num()));

		return "board/boardView";
	}

	@RequestMapping("/boardInsertForm")
	public String boardInsertForm(){
		
		return "board/boardInsertForm";
	}

	@PostMapping("/boardInsert")
	public String boardInsert(BoardVO vo, HttpSession session, @RequestParam(required = false) String[] keyword) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setUser_id(uvo.getId());
		b.boardInsert(vo);
		b.boardKwdInsert(vo.getBod_num(), keyword);
		
		return "redirect:boardList";
	}

	@RequestMapping("/boardUpdateForm")
	public String update(BoardVO vo, Model model) {

		model.addAttribute("b", b.boardView(vo));
		model.addAttribute("tags", b.tagSelect(vo.getBod_num()));

		return "board/boardUpdateForm";

	}

	@RequestMapping("/boardUpdate")
	public String postUpdate(BoardVO vo, @RequestParam(required = false) String[] keyword) {
		System.out.println(vo);
		System.out.println(keyword);
		b.boardKwdUpdate(vo.getBod_num(), keyword);
		b.boardUpdate(vo);

		return "redirect:boardView?bod_num="+vo.getBod_num();

	}

	@RequestMapping("/boardDelete")
	public String boardDelete(BoardVO vo) {

		b.boardDelete(vo);

		return "redirect:/boardList";
	}
}

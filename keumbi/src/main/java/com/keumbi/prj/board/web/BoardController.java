package com.keumbi.prj.board.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.keumbi.prj.board.service.BoardService;
import com.keumbi.prj.board.vo.BoardVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("/boardList")
	public String boardList(BoardVO vo, Model model) {

		List<BoardVO> list = service.selectBoardList();
		model.addAttribute("list", list);

		return "board/boardList";
	}

	@RequestMapping("/boardInsertForm")
	public String boardInsertForm(){
		
		return "board/boardInsertForm";
	}

	@PostMapping("/insertBoard")
	public String insertBoard(@ModelAttribute BoardVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setUser_id(uvo.getId());
		service.insertBoard(vo);
		
		
		return "redirect:boardList";
	}

	@RequestMapping("/boardView")
	public String boardView(BoardVO vo, Model model, @RequestParam("bod_num") int bod_num) {
		BoardVO view = service.view(bod_num);
		service.boardHit(bod_num);
		List<BoardVO> tags = service.tagSelect(bod_num);
		model.addAttribute("view", view);
		model.addAttribute("tags", tags);

		return "board/boardView";
	}

	@RequestMapping("/updateForm")
	public String update(@RequestParam("bod_num") int bod_num, Model model) {

		BoardVO up = service.view(bod_num);
		model.addAttribute("up", up);

		return "board/boardUpdate";

	}

	@RequestMapping("/update")
	public String postUpdate(BoardVO vo) {

		service.update(vo);

		return "redirect:boardList";

	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("bod_num") int bod_num) {

		service.delete(bod_num);

		return "redirect:/boardList";
	}

	@RequestMapping(value = "/boardSearch", method = RequestMethod.POST)
	public String boardSearchList(@RequestParam(required = false) String key,
			@RequestParam(required = false) String val, Model model) {
		List<BoardVO> list = service.boardSearchList(key, val);
		model.addAttribute("list", list);

		return "board/boardList";

	}
	
	

	/*
	 * @RequestMapping(value = "/boardSelectList", method = RequestMethod.POST)
	 * public String boardSelectList(@RequestParam int page, Model model) {
	 * List<BoardVO> select = service.boardSelectList(page);
	 * model.addAttribute("select", select);
	 * 
	 * return "board/boardList"; }
	 */
	
	/*
	 * @RequestMapping(value = "/reportSelect", method = RequestMethod.POST) public
	 * String reportSelect(ReportVO vo, HttpSession session) { UserVO uvo = (UserVO)
	 * session.getAttribute("loginUser"); vo.setRep_id(uvo.getId());
	 * 
	 * return "admin/admReportList"; }
	 */
	
	

}

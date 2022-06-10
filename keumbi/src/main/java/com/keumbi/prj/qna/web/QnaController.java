package com.keumbi.prj.qna.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keumbi.prj.qna.service.QnaService;
import com.keumbi.prj.qna.vo.QnaVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class QnaController {
	
	@Autowired QnaService service;
	
	// 고객센터 페이지 출력
	@RequestMapping("/qnaList")
	public String qnaList(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		model.addAttribute("qnas", service.qnaListSelectAll(user.getId()));	
		return "qna/qnaList";
	}

	// 문의 글쓰기 작성 폼 출력
	@RequestMapping("/qnaInsertForm")
	public String qnaForm() {
		return "qna/qnaInsertForm";
	}
	
	// 문의글 등록하기
	@PostMapping("/qnaInsert")
	public String qnaInsert(QnaVO vo) {
		service.qnaInsert(vo);
		return "redirect:qnaList";
	}
	
	// 문의글 삭제하기
	@RequestMapping("/qnaDelete")
	public String qnaDelete(@RequestParam("num") int num) {
		service.qnaDelete(num);
		return "redirect:qnaList";
	}	
}

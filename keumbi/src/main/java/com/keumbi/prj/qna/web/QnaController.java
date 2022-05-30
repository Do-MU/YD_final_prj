package com.keumbi.prj.qna.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.qna.mapper.QnaMapper;

@Controller
public class QnaController {
	
	@Autowired QnaMapper q;
	
	// 고객센터 페이지 출력
	@RequestMapping("/qnaList")
	public String qnaList(Model model) {
		model.addAttribute("qnas", q.qnaListSelectAll());
		return "qna/qnaList";
	}

	// 문의 글쓰기 작성폼 출력
	@RequestMapping("/qnaInsertForm")
	public String qnaForm() {
		return "qna/qnaInsertForm";
	}
}

package com.keumbi.prj.card.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.card.service.CardService;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class CardController {
	
	@Autowired CardService cardServiceImpl;

	@RequestMapping("/myCardListView")
	public String myCardListView(HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		model.addAttribute("cardList", cardServiceImpl.selectAllCard(vo));
		return "card/myCardList";
	}
}

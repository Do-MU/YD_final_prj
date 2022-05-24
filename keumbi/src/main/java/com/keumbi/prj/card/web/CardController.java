package com.keumbi.prj.card.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.openBank.BankAPI;

@Controller
public class CardController {

	@RequestMapping("cardListView")
	public String cardListView() {
		return "card/cardList";
	}
	
//	@RequestMapping("getCardList")
//	public String getCardList(HttpSession session) {
//		
//		BankAPI.getCardList();
//		return "card/cardList";
//	}
}

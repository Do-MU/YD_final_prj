package com.keumbi.prj.card.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CardController {

	@RequestMapping("cardListView")
	public String cardListView() {
		return "card/cardList";
	}
}

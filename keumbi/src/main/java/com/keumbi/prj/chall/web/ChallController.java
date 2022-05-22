package com.keumbi.prj.chall.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChallController {

	// 나의 챌린지
	@RequestMapping("/challengeList")
	public String userChallengeList() {
		
		return "challenge/challengeList";
	}
}

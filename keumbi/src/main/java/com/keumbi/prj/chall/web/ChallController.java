package com.keumbi.prj.chall.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.chall.vo.ChallVO;
import com.keumbi.prj.prd.service.PrdChallengeService;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class ChallController {
	@Autowired ChallService mychall;
	@Autowired PrdChallengeService prdchall;
	
	// 나의 챌린지 폼
	@RequestMapping("/challengeList")
	public String userChallengeList(Model model, ChallVO challVO, HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		String userId = vo.getId(); // 세션에 저장된 ID값
		
		model.addAttribute("mychall", mychall.challList(userId));
		return "challenge/challengeList";
	}
	
}

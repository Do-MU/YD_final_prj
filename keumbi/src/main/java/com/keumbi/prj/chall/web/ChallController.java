package com.keumbi.prj.chall.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.chall.vo.ChallVO;
import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.prd.service.PrdChallengeService;
import com.keumbi.prj.user.vo.UserVO;


@Controller
public class ChallController {
	@Autowired ChallService mychall;
	@Autowired PrdChallengeService prdchall;
	@Autowired CodeService code;
	
	// 나의 챌린지 목록 
	@RequestMapping("/challengeList")
	public String userChallengeList(Model model, HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("list", mychall.challList(userVO));
		
		return "challenge/challengeList";
	}
	
	// 챌린지 가입
	@RequestMapping("/challInsert")
	@ResponseBody
	public int challInsert(ChallVO challVO) {
		
		if(mychall.challCount(challVO) == 0) {
			return mychall.challInsert(challVO);
		}
		
		return 0;
	}
	
	// 챌린지 도전자
	@RequestMapping("/challTotalUser")
	@ResponseBody
	public int challTotalUser(int chall_num) {
		
		return mychall.challTotalUser(chall_num);
	}
	
	// 챌린지 진행여부
	@RequestMapping(value = "/challCode", produces = "application/text; charset=utf8")
	@ResponseBody
	public String challCode(String chall_code) {
		return code.selectChallCode(chall_code);
	}
	
	// 챌린지 기간 동안 지출 금액 가져오기
	@RequestMapping("/challTransAmt")
	@ResponseBody
	public int challTransAmt(ChallVO vo) {
		
		return mychall.challTransAmt(vo);
	}
}

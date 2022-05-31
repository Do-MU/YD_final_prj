package com.keumbi.prj.chall.web;

import java.util.List;

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
	
	// 나의 챌린지 폼 
	@RequestMapping("/challengeList")
	public String userChallengeList(Model model, HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("list",mychall.challList(userVO.getId()));
		
		return "challenge/challengeList";
	}
	
	// 유저 챌린지 리스트
	@RequestMapping("/userChallList")
	@ResponseBody
	public List<ChallVO> userChallList(UserVO userVO) {
		return mychall.challList(userVO.getId());
	}
	
	// 챌린지 가입
	@RequestMapping("/challInsert")
	@ResponseBody
	public int challInsert(ChallVO challVO) {
		
		if(mychall.challSelect(challVO) == 0) {
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
	
	// 챌린지 이후 해당 카테고리의 결제 금액 반환
	@RequestMapping("/challAmtA")
	@ResponseBody
	public int challAmtA(ChallVO vo) {
		return mychall.userAmtSumA(vo);
	}
}

package com.keumbi.prj.chall.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String userChallengeList() {	
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
	
	@RequestMapping("/challTotalUser")
	@ResponseBody
	public int challTotalUser(int chall_num) {
		System.out.println(mychall.challTotalUser(chall_num));
		return mychall.challTotalUser(chall_num);
	}
}

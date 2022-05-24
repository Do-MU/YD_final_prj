package com.keumbi.prj.openBank;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.keumbi.prj.user.mapper.UserMapper;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class BankAuthController {
	
	@Autowired UserMapper userMapper;
	
	// 사용자 인증요청
	@RequestMapping("/bankAuth")
	public String bankAuth(AuthVO avo) throws Exception {
		 
		String reqUrl = "https://testapi.openbanking.or.kr/oauth/2.0/authorize";
		String url = reqUrl
			    +"?response_type=code"
	            +"&client_id=" + avo.getClient_id()
			    +"&redirect_uri=" + avo.getRedirect_uri()
			    +"&scope=" + avo.getScope()
			    +"&state=12345678901234567890123456789012"
			    +"&auth_type=0";
		
		return "redirect:" + url;
	}
	
	// 사용자 인증을 받아 인증코드를 받는 CallBackUrl
	// 			>> 인증코드를 통해 AccessToken을 받아와 DB에 저장한다.
	@RequestMapping("/bankCallback")
	public String bankCallback(String code, HttpSession session) { // 넘어오는 파라미터와 같은 값을 받아야함	
		System.out.println(code);
		// 넘어온 code값을 통해 토큰을 발급받음
		JsonNode res = BankAPI.getToken(code);
		
		//System.out.println("!!!res : " + res);
		//System.out.println("1 : " + res.get("access_token").asText());
		//System.out.println("2 : " + res.get("refresh_token").asText());
		//System.out.println("3 : " + res.get("user_seq_no").asText());
		
		// 발급 받은 토큰과 사용자일련번호를 DB에 저장
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		uvo.setAccess_token(res.get("access_token").asText());
		uvo.setRefresh_token(res.get("refresh_token").asText());
		uvo.setUser_seq_num(res.get("user_seq_no").asText());
		
		if(userMapper.selectToken(uvo) == 0) {
			userMapper.updateToken(uvo);
			
			// 로그인한 사용자를 사용자일련번호와 액세스 토큰을 가진 객체로 교체
			session.setAttribute("loginUser", uvo);
		}

		return "redirect:accountList";
	}
}

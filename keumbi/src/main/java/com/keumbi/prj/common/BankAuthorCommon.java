package com.keumbi.prj.common;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.keumbi.prj.user.mapper.UserMapper;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class BankAuthorCommon {
	
	@Autowired UserMapper mapper;
	
	// 사용자 인증요청
	@RequestMapping("/bankAuth")
	public String bankAuth(AuthorizeVO avo) throws Exception {
		String reqUrl = "https://testapi.openbanking.or.kr/oauth/2.0/authorize";
		String url = reqUrl
			    +"?response_type=code"
	            +"&client_id=" + avo.getClient_id()
			    +"&redirect_uri=" + avo.getRedirect_uri()
			    +"&scope=inquiry transfer login"
			    +"&state=12345678901234567890123456789012"
			    +"&auth_type=0";
		
		return "redirect:" + url;
	}
	
	// 사용자 인증을 받아 인증코드를 받는 CallBackUrl
	// 			>> 인증코드를 통해 AccessToken을 받아와 DB에 저장한다.
	@RequestMapping("/bankCallback")
	public String bankCallback(String code, HttpSession session) { // 넘어오는 파라미터와 같은 값을 받아야함		
		// 발급받은 토큰 DB에 저장
		JsonNode res = BankAPI.getToken(code);
		System.out.println("res : " + res);
		
		System.out.println("1 : " + res.get("access_token").asText());
		System.out.println("2 : " + res.get("refresh_token").asText());
		System.out.println("3 : " + res.get("user_seq_no").asText());
		
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		uvo.setAccess_token(res.get("access_token").asText());
		uvo.setRefresh_token(res.get("refresh_token").asText());
		uvo.setUser_seq_num(res.get("user_seq_no").asText());
		int result = mapper.UpdateToken(uvo);
		
		String msg = null;
		if(result != 0) {
			msg = "인증 완료";
		}
		
		return "account/accountList";
	}
	
}

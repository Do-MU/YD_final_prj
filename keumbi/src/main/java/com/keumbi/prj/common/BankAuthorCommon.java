package com.keumbi.prj.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BankAuthorCommon {
	AuthorizeVO avo = new AuthorizeVO();
	
	// 사용자 인증요청
	@RequestMapping("/bankAuth")
	public String bankAuth() throws Exception {
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
	
	// 콜백함수로 인증코드가 들어오는 곳
	@RequestMapping("/bankCallback")
	public String bankCallback(String code) { // 넘어오는 파라미터와 같은 값을 받아야함
		// code로 토큰 발급
		System.out.println("=====" + code);
		BankAPI.getToken(code);
		
		return "";
		
	}
	
}

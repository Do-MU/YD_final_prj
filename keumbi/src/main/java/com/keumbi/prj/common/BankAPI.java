package com.keumbi.prj.common;

import java.util.HashMap;
import java.util.Map;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class BankAPI {

	//토큰발급
	public static String getToken(String code) {
		String reqURL = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		
		AuthorizeVO avo = new AuthorizeVO();
		
		//요청 파라미터		
		Map<String, String> param = new HashMap<String, String>();
		param.put("code", code);
		//System.out.println(code);
		param.put("client_id", avo.getClient_id());
		param.put("client_secret", avo.getClient_secret());
		param.put("redirect_uri", avo.getRedirect_uri());
		param.put("grant_type", "authorization_code");
		
		HttpEntity<Map<String, String>> request = new HttpEntity<Map<String,String>>(param);
		ResponseEntity<Map> res = new RestTemplate().exchange(reqURL, HttpMethod.POST, request, Map.class);
		
		System.out.println("====" + res.getBody());
		
		return "";
	}
}

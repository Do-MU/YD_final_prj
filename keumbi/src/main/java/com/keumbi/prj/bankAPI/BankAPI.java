package com.keumbi.prj.bankAPI;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.authorize.AuthorizeVO;
import com.keumbi.prj.user.vo.UserVO;

public class BankAPI {
	static ObjectMapper om = new ObjectMapper();

	// 토큰발급
	public static JsonNode getToken(String code) {
		String reqURL = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		AuthorizeVO avo = new AuthorizeVO();
		
		//요청 파라미터		
		String param = "";
		param += "code=" + code;
		param += "&client_id=" + avo.getClient_id();
		param += "&client_secret=" + avo.getClient_secret();
		param += "&redirect_uri=" + avo.getRedirect_uri();
		param += "&grant_type=" + "authorization_code";
				
		ResponseEntity<String> res = new RestTemplate().exchange(reqURL+ "?" + param, HttpMethod.POST, null, String.class);
		
		//System.out.println("---" + res.getBody());
		JsonNode json = null;
		try {
			json = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("json : " + json);
		return json;
	}
	
	// 계좌목록조회
	public static JsonNode getAccountList(UserVO vo) {
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/account/list";
		String seq = "1101005846";
		String acc = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDA1ODQ2Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NjA0NzY1MjYsImp0aSI6Ijg0YmVlY2E2LTQxOGItNGY3ZS04MTZjLTczYjJlMGQ1NGI3NSJ9.U68_BrWJgVLKwcza5Z3mnmm6-sJgJcWZ8Oa68JuwuKE";
		//System.out.println(vo.getUser_seq_num());
		//System.out.println(vo.getAccess_token());
		
		
		String param = "";
		param += "user_seq_no=" + seq;
		param += "&include_cancel_yn=Y";
		param += "&sort_order=A";
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","Bearer " + acc);
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(null, headers);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> res = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, request, String.class);
		
		System.out.println("===" + res.getBody());
		JsonNode json = null;
		try {
			json = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JsonNode jsonVal = json.get("res_list");
		System.out.println("jsonVal : " + jsonVal);
		
		return jsonVal;
		
	}
}

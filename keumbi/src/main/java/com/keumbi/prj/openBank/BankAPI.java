package com.keumbi.prj.openBank;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.user.vo.UserVO;

public class BankAPI {
	static ObjectMapper om = new ObjectMapper();
	static String orgCode = "M202200531";

	// 토큰발급
	public static JsonNode getToken(String code) {
		String reqURL = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		AuthVO avo = new AuthVO();
			
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
	public static List<AccountVO> getAccountList(UserVO vo) {
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/account/list";
		
		String param = "";
		param += "user_seq_no=" + vo.getUser_seq_num();
		param += "&include_cancel_yn=Y";
		param += "&sort_order=A";
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","Bearer " + vo.getAccess_token());
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(null, headers);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> res = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, request, String.class);
		//System.out.println("===" + res.getBody());
		
		JsonNode json = null;
		List<AccountVO> acclist = new ArrayList<AccountVO>();
		try {
			json = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JsonNode jsonVal = json.get("res_list");
		System.out.println(json.get("res_list"));
		
		for(JsonNode i : jsonVal) {
			AccountVO avo = new AccountVO();
			avo.setUser_id(vo.getId());
			avo.setFintech_use_num(i.get("fintech_use_num").asText());
			avo.setAccount_num_masked(i.get("account_num_masked").asText());
			avo.setAccount_alias(i.get("account_alias").asText());
			avo.setBank_code_std(i.get("bank_code_std").asText());
			avo.setBank_name(i.get("bank_name").asText());
			acclist.add(avo);
		}
		return acclist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 계좌잔액조회
	/* public static JsonNode getBalance(UserVO vo) {
		JsonNode json = null;
		
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/account/balance/fin_num";
		String param = "";
		param += "bank_tran_id" + orgCode + "U" + getSequence();
		param += "&tran_dtime=" + getDate();
		param += "&fintech_use_num=";
		
		return json;
	}

	
	public static String getSequence() {
		long curTime = System.currentTimeMillis();
		String gs = String.valueOf(curTime).substring(4);
		return gs;
		
	}
	
	public static String getDate() {
		String gd;
		//데이트포맷지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		//현재시간불러오기
		Date nowDate = new Date();
		gd = simpleDateFormat.format(nowDate);
		//System.out.println("date : " + gd);
		return gd;
	} */
}

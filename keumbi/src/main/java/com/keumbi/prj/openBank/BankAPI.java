package com.keumbi.prj.openBank;

import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;
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
			e.printStackTrace();
		}
		
		JsonNode jsonVal = json.get("res_list");
		//System.out.println("jsonVal : " + jsonVal);
		
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
	 public static long getBalance(UserVO vo, String fintech_use_num) {
		//System.out.println(fintech_use_num);
		long balance = 0;
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/account/balance/fin_num";
		String param = "";
		param += "bank_tran_id=" + orgCode + "U" + getSequence();
		param += "&tran_dtime=" + getDate();
		param += "&fintech_use_num=" + fintech_use_num;
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","Bearer " + vo.getAccess_token());
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(null, headers);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Map> res = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, request, Map.class);
		//System.out.println("잔액Body  " + res.getBody());
		
		Map map = res.getBody();
		balance = Long.valueOf((String) map.get("balance_amt"));
		return balance;
		
	}
	 
	// 거래내역조회
	public static List<AccTransVO> getTransaction(UserVO uservo, AccTransReqVO vo) {
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/account/transaction_list/fin_num";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fd = sdf.format(vo.getFrom_date());
		String td = sdf.format(vo.getTo_date());
		
		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("bank_tran_id", orgCode + "U" + getSequence());
		map.add("fintech_use_num", vo.getFintech_use_num());
		map.add("inquiry_type", "A");
		map.add("inquiry_base", "D");
		map.add("from_date", fd);
		map.add("to_date", td);
		map.add("sort_order", "D");
		map.add("tran_dtime", "20220519053800");
		
		// multi -> queryString 변경
		URI uri = UriComponentsBuilder.fromUriString(reqURL)
				.queryParams(map)
				.build().encode().toUri();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","Bearer " + uservo.getAccess_token());
		
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> res = restTemplate.exchange(uri, HttpMethod.GET, request, String.class);
		
		JsonNode resBody = null;
		
		try {
			resBody = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		//System.out.println("거래내역BODY : " + resBody);
		
		JsonNode resList = resBody.get("res_list");
		System.out.println(resList);

		//avo.setFintech_use_num(resBody.get("fintech_use_num").asText());
		String finNum = resBody.get("fintech_use_num").asText();
		
		List<AccTransVO> list = new ArrayList<AccTransVO>();
		for(int k=0; k<resBody.size(); k++) {
			AccTransVO avo = new AccTransVO();
			avo.setFintech_use_num(finNum);
			
			for(JsonNode i : resList) {
				avo.setTran_date(i.get("tran_date").asText());
				avo.setTran_time(i.get("tran_time").asText());
				avo.setInout_type(i.get("inout_type").asText());
				avo.setTran_type(i.get("tran_type").asText());
				avo.setPrint_content(i.get("print_content").asText());
				avo.setTran_amt(i.get("tran_amt").asInt());
				avo.setAfter_balance_amt(i.get("after_balance_amt").asInt());
				avo.setBranch_name(i.get("branch_name").asText());
			}
			list.add(avo);
		}
		
		System.out.println(list);
		
		return list;
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
	}
}

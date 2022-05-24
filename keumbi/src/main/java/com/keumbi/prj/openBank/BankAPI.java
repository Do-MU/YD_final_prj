package com.keumbi.prj.openBank;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.card.vo.CardVO;
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

		ResponseEntity<String> res = new RestTemplate().exchange(reqURL + "?" + param, HttpMethod.POST, null, String.class);

		// System.out.println("---" + res.getBody());
		JsonNode json = null;
		try {
			json = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println("json : " + json);
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
		headers.set("Authorization", "Bearer " + vo.getAccess_token());

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(null, headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> res = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, request, String.class);
		// System.out.println("===" + res.getBody());

		JsonNode json = null;
		List<AccountVO> acclist = new ArrayList<AccountVO>();
		try {
			json = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		JsonNode jsonVal = json.get("res_list");
		System.out.println("jsonVal : " + jsonVal);

		for (JsonNode i : jsonVal) {
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
	public static AccountVO getBalance(UserVO vo, String fintech_use_num) {
		// System.out.println(fintech_use_num);
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/account/balance/fin_num";
		String param = "";
		param += "bank_tran_id=" + orgCode + "U" + getSequence();
		param += "&tran_dtime=" + getDate();
		param += "&fintech_use_num=" + fintech_use_num;

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + vo.getAccess_token());

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(null, headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> res = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, request, String.class);
		// System.out.println("잔액Body " + res.getBody());

		JsonNode json = null;
		try {
			json = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		// System.out.println("잔액잔액잔액 : " + json);
		AccountVO avo = new AccountVO();
		avo.setFintech_use_num(json.get("fintech_use_num").asText());
		avo.setBalance_amt(json.get("balance_amt").asLong());
		avo.setProduct_name(json.get("product_name").asText());

		return avo;

	}

	// 거래내역조회
	public static List<AccTransVO> getTransaction(UserVO uservo, String fintech_use_num) {
		// System.out.println("거래내역api 핀넘버 : " + fintech_use_num);
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/account/transaction_list/fin_num";

		Date nowDate = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
		String tod = sdf1.format(nowDate);
		String trasd = sdf2.format(nowDate);

		String param = "";
		param += "bank_tran_id=" + orgCode + "U" + getSequence();
		param += "&fintech_use_num=" + fintech_use_num;
		param += "&inquiry_type=" + "A";
		param += "&inquiry_base=" + "D";
		param += "&from_date=" + "20220101";
		param += "&to_date=" + tod;
		param += "&sort_order=" + "D";
		param += "&tran_dtime=" + trasd;

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + uservo.getAccess_token());

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(null, headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> res = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, request, String.class);

		// System.out.println("거래내역 res : " + res);

		JsonNode resBody = null;

		try {
			resBody = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		JsonNode resList = resBody.get("res_list");
		// System.out.println("오잉? : " + resList);

		String finNum = resBody.get("fintech_use_num").asText();
		// System.out.println("finNum : " + finNum);

		List<AccTransVO> list = new ArrayList<AccTransVO>();

		for (JsonNode i : resList) {
			AccTransVO avo = new AccTransVO();
			avo.setFintech_use_num(finNum);
			avo.setTran_date(i.get("tran_date").asText());
			avo.setTran_time(i.get("tran_time").asText());
			avo.setInout_type(i.get("inout_type").asText());
			avo.setTran_type(i.get("tran_type").asText());
			avo.setPrint_content(i.get("print_content").asText());
			avo.setTran_amt(i.get("tran_amt").asInt());
			avo.setAfter_balance_amt(i.get("after_balance_amt").asInt());
			avo.setBranch_name(i.get("branch_name").asText());
			list.add(avo);
		}

		// System.out.println("거래내역 list : " + list);

		return list;
	}

	// 입금이체
	public static void accDeposit(UserVO vo, String fintech_use_num) {
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num";

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + vo.getAccess_token());
		headers.set("Content-Type", "application/json; charset=UTF-8");

		Map<String, String> param = new HashMap<String, String>();
		param.put("bank_tran_id", orgCode +"U" + getSequence());
		param.put("cntr_account_type", "N");
		param.put("cntr_account_num", "1111111111111111");
		param.put("dps_print_content", "이");
		param.put("fintech_use_num", "120220073488941057621371");
		param.put("tran_amt", "50000");
		param.put("tran_dtime", getDate());
		param.put("req_client_name", "윤희철");
		param.put("req_client_bank_code", "007");
		param.put("req_client_account_num", "1111111111111111");
		param.put("req_client_num", "1101005855");
		param.put("recv_client_bank_code", "031");
		param.put("recv_client_name", "윤희철");
		param.put("recv_client_account_num", "8888888888888888");
		param.put("transfer_purpose", "TR");

		HttpEntity<Map<String, String>> request = new HttpEntity<Map<String, String>>(param, headers);

		RestTemplate restTemplate = new RestTemplate();

		Map response = restTemplate.postForObject(reqURL, request, Map.class);

		//System.out.println(response);
	}

	// 카드목록
	public static List<CardVO> getCardList() {
		String reqURL = "https://testapi.openbanking.or.kr/v2.0/cards";
		
		String t = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDA1MzY1Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NjA3ODE2NjAsImp0aSI6Ijc5YzhhZGNhLTJhNjctNDQ0YS04OWQ2LTFjYmM2NzMxMDdmYyJ9.RnyV03hFDLL7dSSt_Ig9_G5nmpRBR6jJ56i_4BSzyl4";

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + t);

		String param = "";
		param += "bank_tran_id=" + orgCode + "U" + getSequence();
		param += "&user_seq_no=" + "1101005365";
		param += "&bank_code_std=399";
		param += "&member_bank_code=399";
		// param += "&bank_code_std" + cvo.getBank_code_std();
		// param += "&member_bank_code" + cvo.getMember_bank_code();

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(null, headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> res = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, request, String.class);

		System.out.println("카드목록 res : " + res);

		JsonNode json = null;
		try {
			json = om.readTree(res.getBody());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		JsonNode jsonVal = json.get("card_list");
		System.out.println("카드목록 결과 : " + jsonVal);

		List<CardVO> cardList = new ArrayList<CardVO>();
		for (JsonNode i : jsonVal) {
			CardVO vo = new CardVO();
			// vo.setUser_id(uvo.getId());
			vo.setCard_num_masked(i.get("card_num_masked").asText());
			vo.setCard_name(i.get("card_name").asText());
			vo.setMember_bank_code(i.get("card_member_type").asText());
			cardList.add(vo);
		}
		return cardList;
	}

	
	
	
	
	
	
	public static String getSequence() {
		long curTime = System.currentTimeMillis();
		String gs = String.valueOf(curTime).substring(4);
		return gs;

	}
	

	public static String getDate() {
		String gd;
		// 데이트포맷지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		// 현재시간불러오기
		Date nowDate = new Date();
		gd = simpleDateFormat.format(nowDate);
		// System.out.println("date : " + gd);
		return gd;
	}
}

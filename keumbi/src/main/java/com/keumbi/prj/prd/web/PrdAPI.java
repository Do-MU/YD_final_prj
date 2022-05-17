package com.keumbi.prj.prd.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.prd.vo.LoanVO;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.prd.vo.SavingVO;

public class PrdAPI {
	static String auth = "bea3a34f13b85f708ea0654edd77638c";		// 금감원 API 인증키
	
	// 예금상품목록 출력 API
	public static DepositVO getDepositList() {
		DepositVO dep = new DepositVO();
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		
		String reqURL = "http://finlife.fss.or.kr/finlifeapi/depositProductsSearch.json";
		String param = "auth=" + auth;
		param += "&topFinGrpNo=020000";			// 금융사가 속한 권역코드(은행)
		param += "&pageNo=1";
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, null, String.class);
//		System.out.println(response.getBody());
		try {
			JsonNode json = om.readTree(response.getBody());
//			System.out.println(json.get("result").get("baseList"));
			List<DepositBaseVO> baseList = new ArrayList<DepositBaseVO>(); 
			for(JsonNode j : json.get("result").get("baseList")) {
				DepositBaseVO base = om.treeToValue(j, DepositBaseVO.class);
				baseList.add(base);
			}
			dep.setBaseList(baseList);
			
//			System.out.println(json.get("result").get("optionList"));
			List<DepositOptionVO> optList = new ArrayList<DepositOptionVO>();
			for(JsonNode j : json.get("result").get("optionList")) {
				DepositOptionVO opt = om.treeToValue(j, DepositOptionVO.class);
				optList.add(opt);
			}
			dep.setOptionList(optList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dep;
	}
	
	// 적금상품목록 출력 API
	public static SavingVO getSavingList() {
		SavingVO sav = new SavingVO();
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		String reqURL = "http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json";
		String param = "auth=" + auth;
		param += "&topFinGrpNo=020000";
		param += "&pageNo=1";
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, null, String.class);
		try {
			JsonNode json = om.readTree(response.getBody());
			
			List<SavingBaseVO> baseList = new ArrayList<SavingBaseVO>();
			for(JsonNode j : json.get("result").get("baseList")) {
				SavingBaseVO base = om.treeToValue(j, SavingBaseVO.class);
				baseList.add(base);
			}
			sav.setBaseList(baseList);
			
			List<SavingOptionVO> optList = new ArrayList<SavingOptionVO>();
			for(JsonNode j : json.get("result").get("optionList")) {
				SavingOptionVO opt = om.treeToValue(j, SavingOptionVO.class);
				optList.add(opt);
			}
			sav.setOptionList(optList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sav;
	}
	
	// 대출상품목록 출력 API
	public static LoanVO getLoanList() {
		LoanVO loan = new LoanVO();
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		String reqURL = "http://finlife.fss.or.kr/finlifeapi/creditLoanProductsSearch.json";
		String param = "auth=" + auth;
		param += "&topFinGrpNo=020000";
		param += "&pageNo=1";
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(reqURL + "?" + param, HttpMethod.GET, null, String.class);
		
		try {
			JsonNode json = om.readTree(response.getBody());
			
			List<LoanBaseVO> baseList = new ArrayList<LoanBaseVO>();
			for(JsonNode j : json.get("result").get("baseList")) {
				LoanBaseVO base = om.treeToValue(j, LoanBaseVO.class);
				baseList.add(base);
			}
			loan.setBaseList(baseList);
			
			List<LoanOptionVO> optList = new ArrayList<LoanOptionVO>();
			for(JsonNode j : json.get("result").get("optionList")) {
				LoanOptionVO opt = om.treeToValue(j, LoanOptionVO.class);
				optList.add(opt);
			}
			loan.setOptionList(optList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return loan;
	}
}

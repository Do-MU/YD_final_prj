package com.keumbi.prj.prd.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;

public class PrdAPI {
	static String auth = "bea3a34f13b85f708ea0654edd77638c";		// 금감원 API 인증키
	
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
}

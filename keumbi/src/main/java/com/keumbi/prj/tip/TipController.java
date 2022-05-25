package com.keumbi.prj.tip;

import java.io.IOException;
import java.util.Arrays;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TipController {
	
	// 팁 화면 출력
	@RequestMapping("/tips")
	public String tips() {
		
		return "tip/tipList";
	}
	
	// 탭 선택시 해당 키워드의 팁을 네이버 검색한 결과를 aJax으로 return
	@RequestMapping(value = "/webCrawling", produces = "application/text; charset=utf8")
	@ResponseBody
	public String webCrawling(@RequestParam("tip") String tip) throws IOException {
		String[] tips = {"tip1","tip2","tip3","tip4","tip5","tip6"};
		String[] q = {"자산관리","주식","부동산","대출","신용점수","보험"};
		
		String url = "https://search.naver.com/search.naver?query="+q[Arrays.asList(tips).indexOf(tip)]+"%20"+"팁"+"&nso=&where=view&sm=tab_opt";
		
		Document doc = Jsoup.connect(url).get();
		
		return doc.select("ul._list_base").html();
	}
}

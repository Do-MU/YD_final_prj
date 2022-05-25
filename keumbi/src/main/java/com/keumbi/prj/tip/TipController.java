package com.keumbi.prj.tip;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TipController {
	
	@RequestMapping("/tips")
	@ResponseBody
	public String webCrawling(@RequestParam("tip") String tip) throws IOException {
		String[] tips = {"tip1","tip2","tip3","tip4","tip5","tip6"};
		String[] q = {"자산관리","주식","부동산","대출","신용점수","보험"};
		System.out.println(q[Arrays.asList(tips).indexOf(tip)]);
		String url = "https://search.naver.com/search.naver?query="+"자산관리"+"%20"+"팁"+"&nso=&where=view&sm=tab_opt";
		Document doc = Jsoup.connect(url).get();
//		System.out.println(doc.select("ul._list_base").text());
		System.out.println(doc.select("ul._list_base"));
		return doc.select("ul._list_base").text();
	}
	
	@RequestMapping("/webCrawling")
	public String tips() {
		
		return "tip/tipList";
	}
}

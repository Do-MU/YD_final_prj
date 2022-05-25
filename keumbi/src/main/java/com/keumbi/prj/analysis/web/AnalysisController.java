package com.keumbi.prj.analysis.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.analysis.service.AnalysisService;
import com.keumbi.prj.analysis.vo.AnalysisVO;

@Controller
public class AnalysisController {

	@Autowired AnalysisService service;
	
	// 지출분석 페이지 출력
	@RequestMapping("/expendAnal")
	public String expendAnal() {
		return "analysis/expendAnal";
	}
	
	// 월별 지출통계 데이터 출력
	@RequestMapping("/monthlyAnalysis")
	@ResponseBody
	public List<AnalysisVO> monthlyAnalysis(AnalysisVO vo) {
		return service.monthlyAnalysis(vo);
	}
}

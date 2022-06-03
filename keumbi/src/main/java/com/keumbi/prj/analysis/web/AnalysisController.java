package com.keumbi.prj.analysis.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.analysis.service.AnalysisService;
import com.keumbi.prj.analysis.vo.AnalysisDailyVO;
import com.keumbi.prj.analysis.vo.AnalysisMonthlyVO;
import com.keumbi.prj.analysis.vo.AnalysisThisPrevVO;
import com.keumbi.prj.analysis.vo.AnalysisVO;
import com.keumbi.prj.analysis.vo.AnalysisYearlyVO;

@Controller
public class AnalysisController {

	@Autowired AnalysisService service;
	
	// 지출분석 페이지 출력
	@RequestMapping("/expendAnal")
	public String expendAnal() {
		return "analysis/expendAnal";
	}
	
	// 파이차트: 월별 지출통계 데이터 호출
	@RequestMapping("/monthlyAnalysis")
	@ResponseBody
	public List<AnalysisVO> monthlyAnalysis(AnalysisVO vo) {
		return service.monthlyAnalysis(vo);
	}
	
	// 라인차트: 당월전월 누적지축금액 데이터 호출
	@RequestMapping("/thisPreAnalysis")
	@ResponseBody
	public List<AnalysisThisPrevVO> thisPreAnalysis(AnalysisThisPrevVO vo) {
		return service.thisPreAnalysis(vo);
	}
	
	// 컬럼차트1번: 한달간 일별 총 지출금액 데이터 호출
	@RequestMapping("/columnChart1")
	@ResponseBody
	public List<AnalysisDailyVO> columnChart1(AnalysisDailyVO vo) {
		return service.columnChartDaily(vo);
	}
	
	// 컬럼차트2번: 최근 몇달 월별 총 지출금액 데이터 호출
	@RequestMapping("/columnChart2")
	@ResponseBody
	public List<AnalysisMonthlyVO> columnChart2(AnalysisMonthlyVO vo) {
		return service.columnChartMonthly(vo);
	}
}

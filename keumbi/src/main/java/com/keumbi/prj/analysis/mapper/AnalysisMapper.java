package com.keumbi.prj.analysis.mapper;

import java.util.List;

import com.keumbi.prj.analysis.vo.AnalysisDailyVO;
import com.keumbi.prj.analysis.vo.AnalysisMonthlyVO;
import com.keumbi.prj.analysis.vo.AnalysisThisPrevVO;
import com.keumbi.prj.analysis.vo.AnalysisVO;
import com.keumbi.prj.analysis.vo.AnalysisYearlyVO;

public interface AnalysisMapper {
	List<AnalysisVO> monthlyAnalysis(AnalysisVO vo); 					// 월별 지출 통계 데이터 -> 파이차트
	List<AnalysisThisPrevVO> thisPreAnalysis(AnalysisThisPrevVO vo);	// 당월전월 지출금액 통계 데이터 -> 영역차트
	List<AnalysisDailyVO> columnChartDaily(AnalysisDailyVO vo);			// 한달간 일별 총 지출금액 통계 데이터 -> 컬럼차트1번
	List<AnalysisMonthlyVO> columnChartMonthly(AnalysisMonthlyVO vo); 	// 최근 몇달 월별 총 지출금액 통계 데이터 -> 컬럼차트2번
	List<AnalysisYearlyVO> columnChartYearly(AnalysisYearlyVO vo);		// 최근 10년간 연도별 총 지출금액 통계 데이터 -> 컬럼차트3번
}

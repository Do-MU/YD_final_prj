package com.keumbi.prj.analysis.mapper;

import java.util.List;

import com.keumbi.prj.analysis.vo.AnalysisThisPrevVO;
import com.keumbi.prj.analysis.vo.AnalysisVO;

public interface AnalysisMapper {
	List<AnalysisVO> monthlyAnalysis(AnalysisVO vo); 		// 월별 지출 통계 데이터 -> 파이차트
	List<AnalysisThisPrevVO> thisPreAnalysis(AnalysisThisPrevVO vo);		// 당월전월 지출금액 통계 데이터 -> 영역차트
}

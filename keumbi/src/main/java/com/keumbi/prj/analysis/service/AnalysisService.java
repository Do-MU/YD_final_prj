package com.keumbi.prj.analysis.service;

import java.util.List;

import com.keumbi.prj.analysis.vo.AnalysisVO;

public interface AnalysisService {
	List<AnalysisVO> monthlyAnalysis(AnalysisVO vo); //월별지출통계데이터->파이차트
}

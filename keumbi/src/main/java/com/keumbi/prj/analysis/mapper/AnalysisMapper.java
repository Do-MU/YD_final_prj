package com.keumbi.prj.analysis.mapper;

import java.util.List;

import com.keumbi.prj.analysis.vo.AnalysisVO;

public interface AnalysisMapper {
	List<AnalysisVO> monthlyAnalysis(AnalysisVO vo); //월별지출통계데이터->파이차트
}

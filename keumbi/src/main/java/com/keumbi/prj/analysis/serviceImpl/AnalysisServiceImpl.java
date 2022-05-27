package com.keumbi.prj.analysis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.analysis.mapper.AnalysisMapper;
import com.keumbi.prj.analysis.service.AnalysisService;
import com.keumbi.prj.analysis.vo.AnalysisThisPrevVO;
import com.keumbi.prj.analysis.vo.AnalysisVO;
@Service
public class AnalysisServiceImpl implements AnalysisService {

	@Autowired AnalysisMapper m;
	
	@Override
	public List<AnalysisVO> monthlyAnalysis(AnalysisVO vo) {
		return m.monthlyAnalysis(vo);
	}

	@Override
	public List<AnalysisThisPrevVO> thisPreAnalysis(AnalysisThisPrevVO vo) {
		return m.thisPreAnalysis(vo);
	}

}

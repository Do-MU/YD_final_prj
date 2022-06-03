package com.keumbi.prj.report.service;

import java.util.List;

import com.keumbi.prj.report.vo.ReportVO;

public interface ReportService {
	List<ReportVO> reportList();
	int reportDelete(ReportVO vo);
	String repReason(ReportVO vo);
}

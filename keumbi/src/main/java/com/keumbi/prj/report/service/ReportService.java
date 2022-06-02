package com.keumbi.prj.report.service;

import java.util.List;

import com.keumbi.prj.report.vo.ReportVO;

public interface ReportService {
	List<ReportVO> reportList();

	String repReason(ReportVO vo);
}

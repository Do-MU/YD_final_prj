package com.keumbi.prj.report.mapper;

import java.util.List;

import com.keumbi.prj.report.vo.ReportVO;

public interface ReportMapper {
	List<ReportVO> reportList();
	int reportDelete(ReportVO vo);
}

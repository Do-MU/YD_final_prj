package com.keumbi.prj.report.mapper;

import java.util.List;

import com.keumbi.prj.report.vo.ReportVO;

public interface ReportMapper {
	List<ReportVO> reportList();
	int reportBoard(ReportVO vo);
	int reportReply(ReportVO vo);
	int reportDelete(ReportVO vo);
	int repCountBoard(ReportVO vo);
	int repCountReply(ReportVO vo);
}

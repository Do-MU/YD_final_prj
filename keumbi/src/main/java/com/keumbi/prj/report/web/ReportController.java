package com.keumbi.prj.report.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.report.service.ReportService;
import com.keumbi.prj.report.vo.ReportVO;

@Controller
public class ReportController {
	@Autowired ReportService reps;
	
	@RequestMapping(value="/admin/repReason", produces="application/text; charset=utf8")
	@ResponseBody
	public String repReason(ReportVO vo) {
		return reps.repReason(vo);
	}
	
	@RequestMapping("/admin/reportDelete")
	@ResponseBody
	public int reportDelete(ReportVO vo) {
		return reps.reportDelete(vo);
	}
}

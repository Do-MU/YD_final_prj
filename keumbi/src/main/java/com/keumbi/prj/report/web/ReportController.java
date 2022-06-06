package com.keumbi.prj.report.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.report.service.ReportService;
import com.keumbi.prj.report.vo.ReportVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class ReportController {
	@Autowired ReportService reps;
	
	@RequestMapping(value="/admin/repReason", produces="application/text; charset=utf8")
	@ResponseBody
	public String repReason(ReportVO vo) {
		return reps.repReason(vo);
	}
	
	@RequestMapping("/reportBoard")
	@ResponseBody
	public int reportBoard(ReportVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setRep_id(uvo.getId());
		
		return reps.reportBoard(vo);
	}
	
	@RequestMapping("/reportReply")
	@ResponseBody
	public int reportReply(ReportVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setRep_id(uvo.getId());
		
		return reps.reportReply(vo);
  }
  
	@RequestMapping("/admin/reportDelete")
	@ResponseBody
	public int reportDelete(ReportVO vo) {
		return reps.reportDelete(vo);
	}
}

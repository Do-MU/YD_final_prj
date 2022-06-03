package com.keumbi.prj.report.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("/reportInsert")
	public String reportInsert(@ModelAttribute ReportVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setRep_id(uvo.getId());
		reps.reportInsert(vo);
		
		
		return "redirect:boardView?bod_num="+vo.getRep_reason();
	}
	
	@PostMapping("/reportInsertInsert")
	public String reportInsertInsert(@ModelAttribute ReportVO vo, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		vo.setRep_id(uvo.getId());
		reps.reportInsertInsert(vo);
		
		
		return "redirect:boardView?bod_num="+vo.getRep_reason();
	}
}

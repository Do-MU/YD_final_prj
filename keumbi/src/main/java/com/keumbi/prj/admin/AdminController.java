package com.keumbi.prj.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.prd.service.PrdCardService;
import com.keumbi.prj.qna.service.QnaService;
import com.keumbi.prj.qna.vo.QnaVO;
import com.keumbi.prj.report.service.ReportService;
import com.keumbi.prj.report.vo.ReportVO;
import com.keumbi.prj.user.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired AccountService a;
	@Autowired UserService us;
	@Autowired PrdCardService c;
	@Autowired ChallService ch;
	@Autowired QnaService qna;
	@Autowired ReportService rep;
	
	// 관리자 메인 화면
	@RequestMapping("/home")
	public String home() {
		
		return "admin/home";
	}
	
	// 관리자 상품 업데이트 페이지
	@RequestMapping("/prdUpdate")
	public String prdUpdate() {
			
		return "admin/prdUpdate";
	}
	
	// 회원목록 페이지
	@RequestMapping("/admUserMng")
	public String admUserMng(Model model) {
		model.addAttribute("allUser", us.allUser());
		return "admin/admUserMng";
	}
	
	// 관리자 신고관리 페이지
	@RequestMapping("/admReportList")
	public String admReportList(Model model) {
		model.addAttribute("reportList", rep.reportList());
		System.out.println(rep.reportList());
		return "admin/admReportList";
	}
	
	// 고객센터 관리 페이지
	@RequestMapping("/admQnaList")
	public String qnaAdminList(Model model) {
		model.addAttribute("qnas", qna.qnaAdminList());
		return "admin/admQnaList";
	}
	
	// 고객센터 문의글 조회
	@RequestMapping("/admQnaView")
	public String qnaAdminView(@RequestParam("num") int num, Model model) {
		model.addAttribute("qna", qna.qnaAdminSelectOne(num));
		return "admin/admQnaView";
	}
	
	// 고객센터 문의글 답변 등록
	@RequestMapping("/admQnaUpdate")
	public String admQnaUpdate(QnaVO vo) {
		qna.qnaAdminUpdate(vo);
		return "redirect:admQnaView?num="+vo.getNum();
	}
	
	// 더미 데이터 만들기
	@RequestMapping("/dummyDep")
	@ResponseBody
	public int dummyDep() {
		
		return a.makeDummyDep();
	}
	@RequestMapping("/dummySav")
	@ResponseBody
	public int dummySav() {
		
		return a.makeDummySav();
	}
	@RequestMapping("/dummyLoa")
	@ResponseBody
	public int dummyLoa() {
		
		return a.makeDumLoa();
	}
	@RequestMapping("/dummyCard")
	@ResponseBody
	public int dummyCard() {

		return c.makeDummyCard();
	}
	@RequestMapping("/dummyChall")
	@ResponseBody
	public int dummyChall() {

		return ch.makeDummyChall();
	}
}

package com.keumbi.prj.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.common.vo.PageVO;
import com.keumbi.prj.prd.service.PrdCardService;
import com.keumbi.prj.qna.service.QnaService;
import com.keumbi.prj.qna.vo.QnaVO;
import com.keumbi.prj.report.service.ReportService;
import com.keumbi.prj.sanction.service.SanctionService;
import com.keumbi.prj.sanction.vo.SanctionVO;
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
	@Autowired SanctionService san;
	
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
		return "admin/admReportList";
	}
	
	// 관리자 제재등록
	@RequestMapping("/sanInsert")
	@ResponseBody
	public int sanInsert(SanctionVO vo) {
		
		return san.sanInsert(vo);
	}
	
	// 고객센터 관리 페이지
	@RequestMapping("/admQnaList")
	public String qnaAdminList(Model model, PageVO pvo) {
		String code = pvo.getCode();
		int total = 0;
		if(code != null) {
			total = qna.qnaSortCount(code);												// 미답변/답변 QNA 수
		}else {
			total = qna.qnaCount();                                          			// 전체 QNA수						
		}
	    int pageCnt = total/pvo.getPageScale()  + (total%pvo.getPageScale()>0?1:0);    	// 전체 페이지 수 = 전체 QNA수/한 페이지 출력수 + 나머지가 있으면 1 없으면 0
	    int endPage = ((pvo.getPageNo()-1)/10+1)*10;                           			// 마지막 페이지 = 현재 페이지 (11 ~ 20)인 경우 > (10~19)/10 > 2*10 > 마지막 페이지 20
	    pvo.setTotalNo(total);
	    pvo.setTotalPage(pageCnt);
	    pvo.setStartPage(((pvo.getPageNo()-1)/10)*10+1);                        		// 시작 페이지 =  현재 페이지 (11 ~ 20)인 경우 > (10~19)/10 > 1*10+1 > 시작 페이지 11
	    pvo.setEndPage(endPage > pageCnt ? pageCnt : endPage );                     	// 총 페이지 수가 34페이지까지 일 경우 40페이지가 아니라 34페이지가 마지막 페이지
		
		model.addAttribute("p", pvo);
		model.addAttribute("qnas", qna.qnaAdminList(pvo));
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
		for(int i=0; i<=3000; i++) {
			c.makeDummyCard();
		}

		return 0;
	}
	@RequestMapping("/dummyChall")
	@ResponseBody
	public int dummyChall() {

		return ch.makeDummyChall();
	}
}

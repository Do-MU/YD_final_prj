package com.keumbi.prj.prd.web;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.prd.mapper.ChallengeMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.prd.mapper.LoanMapper;
import com.keumbi.prj.prd.mapper.SavingMapper;
import com.keumbi.prj.prd.service.DepositService;
import com.keumbi.prj.prd.service.TermsService;
import com.keumbi.prj.prd.vo.ChallengeVO;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.prd.vo.LoanVO;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.prd.vo.SavingVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class PrdController {
	
	@Autowired DepositService dep;
	@Autowired SavingMapper sav;
	@Autowired LoanMapper loa;
	@Autowired ChallengeMapper challenge;
	
	@Autowired TermsService term; //약관
	
	@Autowired AccountService accService;
	
	@Autowired CodeService codeService;
	
	//관리자 상품 업데이트 기능
	@RequestMapping("admin/prdUpdate")
	public String prdUpdate() {
		
		return "admin/prdUpdate";
	}
	
	//관리자 화면
	@RequestMapping("admin/home")
	public String home() {
		return "admin/home";
	}
	
	//예금상품 업데이트처리
	@RequestMapping(value="admin/depUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> depUpdate(HttpServletResponse response) {
		int baseCnt = 0;
		int optCnt = 0;
		
		DepositVO deposits = PrdAPI.getDepositList();
		
		dep.deleteAllDepOpt();
		dep.deleteAllDepBase();
		
		for(DepositBaseVO vo : deposits.getBaseList()) {
			dep.insertDepBase(vo);
			baseCnt++;
		}
		
		for(DepositOptionVO vo : deposits.getOptionList()) {
			dep.insertDepOpt(vo);
			optCnt++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		String message = "예금상품 : " + baseCnt + "건\n예금상품옵션 : " + optCnt + "건\n업데이트 완료";
		
		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}
	
	//적금상품 업데이트처리
	@RequestMapping(value="admin/savUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> savUpdate(HttpServletResponse response){
		int baseCnt = 0;
		int optCnt = 0;
		
		SavingVO saving = PrdAPI.getSavingList();
		
		sav.deleteAllSavOpt();
		sav.deleteAllSavBase();
		
		for(SavingBaseVO vo : saving.getBaseList()) {
			sav.insertSavBase(vo);
			baseCnt++;
		}
		
		for(SavingOptionVO vo : saving.getOptionList()) {
			sav.insertSavOpt(vo);
			optCnt++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		String message = "적금상품 : " + baseCnt + "건\n적금상품옵션 : " + optCnt + "건\n업데이트 완료";
		
		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}
	
	//대출상품 업데이트처리
	@RequestMapping(value="admin/loanUpdate", produces="application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> loanUpdate(HttpServletResponse response){
		int baseCnt = 0;
		int optCnt = 0;
		
		LoanVO loan = PrdAPI.getLoanList();
		
		loa.deleteAllLoanOpt();
		loa.deleteAllLoanBase();
		
		for(LoanBaseVO vo : loan.getBaseList()) {
			loa.insertLoanBase(vo);
			baseCnt++;
		}
		
		for(LoanOptionVO vo : loan.getOptionList()) {
			loa.insertLoanOpt(vo);
			optCnt++;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		String message = "대출상품 : " + baseCnt + "건\n대출상품옵션 : " + optCnt + "건\n업데이트완료";
		
		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}
	
	//예금상품목록화면 출력
	@RequestMapping("/prdDepositList")
	public String prdDepositList(Model model) {
//		model.addAttribute("prdDepBase", dep.selectAllDepBase());
//		model.addAttribute("prdDepOpt", dep.selectAllDepOpt());
		
		return "product/deposit";
	}
	
	//예금목록 불러오기
	@RequestMapping("/prdDepBase")
	@ResponseBody
	public List<DepositBaseVO> prdDepBaseList(){
		return dep.selectAllDepBase();
	}
	
	//해당 예금상품 옵션 불러오기
	@RequestMapping("/prdDepOpt")
	@ResponseBody
	public List<DepositOptionVO> prdDepOptList(int dep_id){
		return dep.selectAllDepOpt(dep_id);
	}
	
	//예금 가입하기 화면 출력
	@RequestMapping("/depositJoinForm")
	public String depositJoinForm(Model model, HttpSession session, HttpServletResponse response) throws Exception{
			model.addAttribute("depTerms", term.selectAllTerms());
			model.addAttribute("bankNm", dep.selectAllDepBase());
			model.addAttribute("bankCode", codeService.bankCode());
			
			
			if(session.getAttribute("loginUser") != null) {
				return "product/depositJoinForm";
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter login = response.getWriter();
			login.println("<script>alert('로그인이 필요합니다.');</script>");
			login.flush();
			return "user/userLoginForm";
	}
	
	@RequestMapping("/depositJoin")
	public String depositJoin(AccountVO accountVO, HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); //세션값 불러오기
		String userId = vo.getId(); //세션에 저장된 ID값
		
		//fintech_use_num 난수생성
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		
		int finLetter = 24; // 핀테크코드 자리수
		int accLetter = 7; // 계좌코드 자리수
		
		String resFinNum = "";
		String resAccNum = "";
		
		for(int i=0; i<finLetter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resFinNum += ranNum;
		}
		
		for(int i=0; i<accLetter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resAccNum += ranNum;
		}
		//난수생성 종료
		
		System.out.println(codeService.bankCode());
		System.out.println(resFinNum);
		System.out.println(userId);
		
		accountVO.setFintech_use_num(resFinNum); 	//핀테크번호
		accountVO.setUser_id(userId); 				//회원아이디
		accountVO.setAccount_num_masked(resAccNum+"***");	//계좌번호
//		accountVO.setBank_code_std();				//개설기관코드
		accountVO.setBalance_amt(0); //잔액
		//상품명
		
		accService.insertAccount(accountVO);
		return "redirect:prdDepositList";
	}
	
	@RequestMapping("/prdChallengeList")
	public String challengeList(Model model){
		model.addAttribute("prdChall", challenge.challengeList());
		System.out.println(model.addAttribute("prdChall", challenge.challengeList()));
		return "challenge/prdChallengeList";		
	}
	
}
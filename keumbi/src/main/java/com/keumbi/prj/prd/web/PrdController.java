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

import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.chall.vo.ChallVO;
import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.prd.mapper.PrdChallengeMapper;
import com.keumbi.prj.prd.mapper.LoanMapper;
import com.keumbi.prj.prd.mapper.SavingMapper;
import com.keumbi.prj.prd.service.DepositService;
import com.keumbi.prj.prd.vo.PrdChallengeVO;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.prd.vo.LoanVO;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.prd.vo.SavingVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class PrdController {

	@Autowired	DepositService dep;
	@Autowired	SavingMapper sav;
	@Autowired	LoanMapper loa;
	@Autowired	PrdChallengeMapper chal;

	@Autowired	AccountService accService;

	@Autowired	CodeService codeService;
	
	@Autowired ChallService uchall;

	/* 예금 */
	// 예금상품 업데이트 처리 (관리자)
	@RequestMapping(value = "admin/depUpdate", produces = "application/text; charset=utf8")
	@ResponseBody
	public String depUpdate() {

		return dep.insertAllDeposits();
	}

	// 예금 상품추천 화면 출력
	@RequestMapping("/prdDepositList")
	public String prdDepositList(Model model) {
		model.addAttribute("depList",dep.selectAllDepBase());
		
		return "product/depositList";
	}

	// 예금정보 불러오기
	@RequestMapping("/prdDepBase")
	@ResponseBody
	public DepositBaseVO prdDepBaseList(int dep_id) {
		
		return dep.selectOneDepBase(dep_id);
	}

	// 선택된 예금상품 옵션 불러오기
	@RequestMapping("/prdDepOpt")
	@ResponseBody
	public List<DepositOptionVO> prdDepOptList(int dep_id) {
		
		return dep.selectAllDepOpt(dep_id);
	}

	// 예금 가입하기 화면 출력
	@RequestMapping("/depositJoinForm")
	public String depositJoinForm(Model model, HttpSession session, HttpServletResponse response, int dep_id, String val) throws Exception {
		// 로그인이 NULL일경우 로그인화면으로 넘겨보냄
		if(session.getAttribute("loginUser") == null) {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter login = response.getWriter();
		login.println("<script>alert('로그인이 필요합니다.');</script>");
		login.flush();
		return "user/userLoginForm";
		}
		
		//로그인이 되어있을경우 가입폼 출력
		model.addAttribute("depBase", dep.selectOneDepBase(dep_id));
		model.addAttribute("code", codeService.bankCode(val));
		
		return "product/depositJoinForm";
	}
	
	// 예금 가입하기 처리
	@RequestMapping("/depositJoin")
	public String depositJoin(AccountVO accountVO, HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		String userId = vo.getId(); // 세션에 저장된 ID값

		// fintech_use_num 난수생성
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";

		int finLetter = 21; // 핀테크코드 자리수
		int accLetter = 10; // 계좌코드 자리수

		String resFinNum = "";
		String resAccNum = "";

		for (int i = 0; i < finLetter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resFinNum += ranNum;
		}

		for (int i = 0; i < accLetter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resAccNum += ranNum;
		} 
		// 난수생성 종료

		accountVO.setFintech_use_num("dep" + resFinNum); 		// 핀테크번호(24자리)
		accountVO.setUser_id(userId); 							// 회원아이디
		accountVO.setAccount_num_masked(resAccNum + "***"); 	// 계좌번호(13자리)
		accountVO.setBalance_amt(0); 							// 잔액

		return "redirect:prdDepositList";
	}

	
	
	
	/* 적금 */
	// 적금상품 업데이트처리
	@RequestMapping(value = "admin/savUpdate", produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> savUpdate(HttpServletResponse response) {
		int baseCnt = 0;
		int optCnt = 0;

		SavingVO saving = PrdAPI.getSavingList();

		sav.deleteAllSavOpt();
		sav.deleteAllSavBase();

		for (SavingBaseVO vo : saving.getBaseList()) {
			sav.insertSavBase(vo);
			baseCnt++;
		}

		for (SavingOptionVO vo : saving.getOptionList()) {
			sav.insertSavOpt(vo);
			optCnt++;
		}

		response.setContentType("text/html; charset=UTF-8");

		String message = "적금상품 : " + baseCnt + "건\n적금상품옵션 : " + optCnt + "건\n업데이트 완료";

		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}

	
	
	
	/* 대출 */
	// 대출상품 업데이트처리
	@RequestMapping(value = "admin/loanUpdate", produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> loanUpdate(HttpServletResponse response) {
		int baseCnt = 0;
		int optCnt = 0;

		LoanVO loan = PrdAPI.getLoanList();

		loa.deleteAllLoanOpt();
		loa.deleteAllLoanBase();

		for (LoanBaseVO vo : loan.getBaseList()) {
			loa.insertLoanBase(vo);
			baseCnt++;
		}

		for (LoanOptionVO vo : loan.getOptionList()) {
			loa.insertLoanOpt(vo);
			optCnt++;
		}

		response.setContentType("text/html; charset=UTF-8");
		String message = "대출상품 : " + baseCnt + "건\n대출상품옵션 : " + optCnt + "건\n업데이트완료";

		return new ResponseEntity<String>(message, null, HttpStatus.OK);
	}

	
	
	
	/* 챌린지 */
	// 챌린지 리스트
	@RequestMapping("/prdChallengeList")
	public String prdChallengeList(Model model) {
		model.addAttribute("prdChall", chal.prdChallengeList());
		
		return "product/prdChallengeList";
	}
	
	// 선택된 챌린지
	@RequestMapping("/prdChall")
	@ResponseBody
	public PrdChallengeVO prdChall(PrdChallengeVO vo) {
		
		return chal.prdChallengeSelect(vo);
	}
	
	@RequestMapping("/challInsert")
	@ResponseBody
	public String challInsert(Model model, HttpSession session, ChallVO challVO) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		String userId = vo.getId(); // 세션에 저장된 ID값
		challVO.setUser_id(userId);
		
		uchall.challInsert(challVO);
		return "prd/prdChallengeList";
	}
}
package com.keumbi.prj.prd.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.chall.vo.ChallVO;
import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.ledger.service.LedgerService;
import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.prd.service.DepositService;
import com.keumbi.prj.prd.service.LoanService;
import com.keumbi.prj.prd.service.PrdCardService;
import com.keumbi.prj.prd.service.PrdChallengeService;
import com.keumbi.prj.prd.service.SavingService;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.LoanOptionVO;
import com.keumbi.prj.prd.vo.PrdCardRecoVO;
import com.keumbi.prj.prd.vo.PrdCardVO;
import com.keumbi.prj.prd.vo.PrdChallengeVO;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.prd.vo.TransSearchVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class PrdController {
	
	@Autowired	DepositService dep;
	@Autowired	SavingService sav;
	@Autowired 	LoanService loa;
	@Autowired	PrdChallengeService chal;
	@Autowired	PrdCardService card;
	@Autowired	AccountService accService;
	@Autowired 	ChallService mychall;
	@Autowired	CodeService codeService;
	@Autowired	LedgerService led;
	
	/* 예금 */
	// 예금상품 업데이트 처리 (관리자)
	@RequestMapping(value = "admin/depUpdate", produces = "application/text; charset=utf8")
	@ResponseBody
	public String depUpdate() {

		return dep.insertAllDeposits();
	}

	// 예금 상품추천 화면 출력
	@RequestMapping("/prdDepositList")
	public String prdDepositList(Model model, HttpSession session, UserVO userVO) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		model.addAttribute("depList", dep.selectAllDepBase()); // 상품 전체출력
		model.addAttribute("depBestList", dep.selectBestDepBase(loginUser)); // 사용자가 많은 상품 출력
		model.addAttribute("depRandomList", dep.selectRandomDepBase()); // 전체상품중 랜덤상품 출력

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
	
  
  
	
	/* 적금 */
	// 적금상품 업데이트처리
	@RequestMapping(value = "admin/savUpdate", produces = "application/text; charset=utf8")
	@ResponseBody
	public String savUpdate() {
		
		return sav.insertAllSavings();
	}
	
	// 적금 상품추천 화면 출력
	@RequestMapping("/prdSavingList")
	public String prdSavingList(Model model, HttpSession session, UserVO userVO) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		model.addAttribute("savList", sav.selectAllSavBase());
		model.addAttribute("savBestList", sav.selectBestSavBase(loginUser));
		model.addAttribute("savRandomList", sav.selectRandomSavBase());
		return "product/savingList";
	}
	
	// 적금정보 불러오기
	@RequestMapping("/prdSavBase")
	@ResponseBody
	public SavingBaseVO prdSavBaseList(int sav_id) {
		
		return sav.selectOneSavBase(sav_id);
	}
	
	// 선택된 적금상품 옵션 보여주기
	@RequestMapping("/prdSavOpt")
	@ResponseBody
	public List<SavingOptionVO> prdSavOptList(int sav_id) {
		return sav.selectAllSavOpt(sav_id);
	}
	
	
	/* 대출 */
	// 대출상품 업데이트처리
	@RequestMapping(value = "admin/loanUpdate", produces = "application/text; charset=utf8")
	@ResponseBody
	public String loanUpdate() {
		
		return loa.insertAllLoans();
	}

	// 대출 상품추천 화면 출력
	@RequestMapping("/prdLoanList")
	public String prdLoanList(Model model, HttpSession session, UserVO userVO) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		model.addAttribute("loanList", loa.selectAllLoanBase());
		model.addAttribute("loanBestList", loa.selectBestLoanBase(loginUser));
		model.addAttribute("loanRandomList", loa.selectRandomLoanBase());
		return "product/loanList";
	}
	
	// 대출정보 불러오기
	@RequestMapping("/prdLoanBase")
	@ResponseBody
	public LoanBaseVO prdLanBaseList(int loan_id) {
		
		return loa.selectOneLoanBase(loan_id);
	}
	
	// 선택된 대출상품 옵션 보여주기
	@RequestMapping("/prdLoanOpt")
	@ResponseBody
	public List<LoanOptionVO> prdLoanOptList(int loan_id) {
		return loa.selectAllLoanOpt(loan_id);
	}
	
	
	/* 카드 */
	// 카드전체목록
	@RequestMapping("/PrdCardListView")
	public String PrdCardListView(Model model) {
		model.addAttribute("cardList", card.selectRandomCard());
		return "product/prdCardList";
	}
	// 전체버튼
	@RequestMapping("/totalPrd")
	@ResponseBody
	public List<PrdCardVO> totalPrd() {
		return card.selectRandomCard();
	}
	// 카드 상세보기
	@RequestMapping("/cardDetail")
	@ResponseBody
	public PrdCardVO cardDetail(PrdCardVO vo) {		
		
		return card.selectOneCard(vo);
	}
	// 카드사별 리스트 출력
	@RequestMapping("/companyCard")
	@ResponseBody
	public List<PrdCardVO> companyCard(PrdCardVO vo){
		return card.selectCompanyCard(vo);
	}
	// 연령대별 카드 추천
	@RequestMapping("/recommendedAge")
	@ResponseBody
	public List<PrdCardVO> recommendedAge(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		return card.selectRecoAge(vo);
	}
	// 소비패턴별 카드 추천
	@RequestMapping("/recommendedConsum")
	@ResponseBody
	public List<PrdCardRecoVO> recommendedConsum(HttpSession session){
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		return card.selectCousum(vo);
	}
	// 키워드별 카드 추천
	@RequestMapping("/recommendedKey")
	@ResponseBody
	public List<PrdCardRecoVO> recommendedKey(HttpSession session){
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		return card.selectKeyword(vo);
	}
	
	
	
	
	
	
	
	/* 챌린지 */
	// 챌린지 리스트
	@RequestMapping("/prdChallengeList")
	public String prdChallengeList(Model model) {
		model.addAttribute("prdChall", chal.prdChallengeList());
		return "product/prdChallengeList";
	}
	
	// 선택된 챌린지 정보 return
	@RequestMapping("/prdChall")
	@ResponseBody
	public PrdChallengeVO prdChall(PrdChallengeVO vo) {
		return chal.prdChallengeSelect(vo);
	}
	
	
	// 소비목록 가져오기
	@RequestMapping("/prdChalltransList")
	@ResponseBody
	public List<LedgerVO> transList(TransSearchVO vo){
		
	    return chal.transList(vo);
	}
	
	@RequestMapping("/myChallCnt")
	@ResponseBody
	public int challCnt(ChallVO vo){
		
		return mychall.challCount(vo);
	}
}
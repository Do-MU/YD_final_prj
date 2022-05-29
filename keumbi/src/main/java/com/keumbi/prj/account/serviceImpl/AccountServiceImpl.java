package com.keumbi.prj.account.serviceImpl;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.accTrans.mapper.AccTransMapper;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.common.mapper.CodeMapper;
import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.prd.mapper.DepositMapper;
import com.keumbi.prj.prd.mapper.LoanMapper;
import com.keumbi.prj.prd.mapper.SavingMapper;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.LoanBaseVO;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.user.mapper.UserMapper;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired AccountMapper accMapper;
	@Autowired AccTransMapper transMapper;
	@Autowired UserMapper userMapper;
	@Autowired CodeMapper codeMapper;
	
	@Autowired DepositMapper depMapper;
	@Autowired SavingMapper savMapper;
	@Autowired LoanMapper loaMapper;
	
	// API를 통해 계좌목록/잔액/계좌거래내역을 가져와 각각 비교 후 DB에 저장
	// 회원 보유 계좌전체조회(API) -> DB저장(최초 1회)
	@Override
	public List<AccountVO> selectfirstAccount(UserVO user) {
		
		List<AccountVO> acclist = BankAPI.getAccountList(user);
		
		if(acclist != null) {
			// API에서 계좌 목록을 가져와서
			for(AccountVO avo : acclist) {
				// 해당 계좌가 DB에 존재하지 않으면 (API에 새로 등록된 계좌)
				if(selectOneAccount(avo) == null ) {
					avo.setUser_id(user.getId());
					avo.setBank_code_std("B" + avo.getBank_code_std());			// bank code 수정
					
					// 해당 계좌를 DB에 INSERT한다.
					accMapper.insertAccount(avo);
				}
				
				// 잔액 저장 (최초 1회)
				// DB에 저장된 계좌의 잔액이 0일 때
				if(selectOneAccount(avo).getBalance_amt() == 0) {
					// 해당 계좌의 잔액과 상품명을 가져와 accVO에 저장
					AccountVO accVO = (AccountVO) BankAPI.getBalance(user, avo.getFintech_use_num());		
					avo.setBalance_amt(accVO.getBalance_amt());				// 잔액 설정
					avo.setProduct_name(accVO.getProduct_name());			// 상품명 설정
					
					// 상품명 >> 상품아이디 및 계좌종류 설정
					if(accMapper.selectPrdDep(avo) != null) {
						avo.setAccount_code("AD");
						avo.setPrd_id(accMapper.selectPrdDep(avo));
					} else if(accMapper.selectPrdSav(avo) != null) {
						avo.setAccount_code("AS");
						avo.setPrd_id(accMapper.selectPrdSav(avo));
					} else if(accMapper.selectPrdLoan(avo) != null) {
						avo.setAccount_code("AL");
						avo.setPrd_id(accMapper.selectPrdSav(avo));
					} else {
						avo.setAccount_code("AF");
					}
					
					// 잔액, 상품명, 상품ID, 계좌종류를 UPDATE한다.
					accMapper.updateAccount(avo);
				}
				
				// 거래내역 저장 (최초 1회)
				// 거래내역 존재하는지 체크하고 거래내역이 없을 경우
				if(transMapper.selectAccTransOne(avo.getFintech_use_num()) == 0) {
					// API로부터 거래내역 리스트를 불러온다 
					List<AccTransVO> transList = BankAPI.getTransaction(user, avo.getFintech_use_num());
					// 각각의 거래내역을
					for(AccTransVO tvo : transList) {
						// 계좌 거래내역에 INSERT하고
						accMapper.insertAccTrans(tvo);
						
						// 지출내역 (total_trans) DB에 저장 (최초 1회)
						LedgerVO lvo = new LedgerVO();
						lvo.setTdate(tvo.getTran_date());
						lvo.setUser_id(user.getId());
						lvo.setIo_code(tvo.getInout_type());
						lvo.setContent(tvo.getPrint_content());
						lvo.setAmt(tvo.getTran_amt());
						lvo.setCat_code(tvo.getTran_type());
						accMapper.insertTrans(lvo);
					}
				}
			}
		}
		else {
			accMapper.deleteAccounts(user);
			user.setUser_seq_num("");
			user.setAccess_token("");
			user.setRefresh_token("");
			userMapper.updateToken(user);
		}
		
		return selectAllAccount(user);				
	}
	
	// DB에 저장된 회원의 전체 계좌 조회
	@Override
	public List<AccountVO> selectAllAccount(UserVO user) {

		return accMapper.selectAllAccount(user.getId());
	}

	// 잔액 합산 출력
	@Override
	public int selectAccTotalSum(String userId) {
		
		return accMapper.selectAccTotalSum(userId);
	}

	// 계좌 단건 조회
	@Override
	public AccountVO selectOneAccount(AccountVO vo) {
		
		return accMapper.selectOneAccount(vo);
	}

	
	
	
	
	
	
	// 예금상품 더미 데이터 만들기
	@Override
	public int makeDummyDep() {
		AccountVO dummy = new AccountVO();
		Random random = new Random();
		int finLetter = 21; // 핀테크코드 자리수
		int accLetter = 10; // 계좌코드 자리수
		
		int rand = 0;
		String resFinNum = "dep";
		String userID = "test";
		String resAccNum = "";
		
		// 핀테크 이용 번호
		for (int i = 0; i < finLetter; i++) {
			resFinNum += Integer.toString(random.nextInt(10));
		}
		dummy.setFintech_use_num(resFinNum);
		
		// 계좌소유주 id
		rand = random.nextInt(1005)+1;
		if(rand>=1000) {
			userID += Integer.toString(rand);
		}else if(rand>=100) {
			userID += "0"+Integer.toString(rand);
		}else if(rand>=10) {
			userID += "00"+Integer.toString(rand);
		}else{
			userID += "000"+Integer.toString(rand);
		}
		dummy.setUser_id(userID);
		
		// 계좌번호
		for (int i = 0; i < accLetter; i++) {
			resAccNum += Integer.toString(random.nextInt(10));
		}
		resAccNum += "***";
		dummy.setAccount_num_masked(resAccNum);
		
		// 계좌구분 코드
		dummy.setAccount_code("AD");
		
		// 계좌잔액
		dummy.setBalance_amt((random.nextInt(1000)+1)*10000);
		
		// 상품명, 상품코드, 은행 코드, 은행 이름
		rand = random.nextInt(50);
		DepositBaseVO dep = depMapper.selectAllDepBase().get(rand);
		dummy.setPrd_id(dep.getDep_id());
		dummy.setProduct_name(dep.getFin_prdt_nm());
		dummy.setBank_code_std(dep.getBank_code());
		dummy.setBank_name(dep.getKor_co_nm());
		
//		System.out.println(dummy);
		return accMapper.insertAccount(dummy);
	}


	// 적금상품 더미 데이터 만들기
	@Override
	public int makeDummySav() {
		AccountVO dummy = new AccountVO();
		Random random = new Random();
		int finLetter = 21; // 핀테크코드 자리수
		int accLetter = 10; // 계좌코드 자리수
		
		int rand = 0;

		// 핀테크 이용 번호
		String resFinNum = "sav";
		for (int i = 0; i < finLetter; i++) {
			resFinNum += Integer.toString(random.nextInt(10));
		}
		dummy.setFintech_use_num(resFinNum);
		
		// 계좌소유주 id
		String userID = "test";
		rand = random.nextInt(1005)+1;
		if(rand>=1000) {
			userID += Integer.toString(rand);
		}else if(rand>=100) {
			userID += "0"+Integer.toString(rand);
		}else if(rand>=10) {
			userID += "00"+Integer.toString(rand);
		}else{
			userID += "000"+Integer.toString(rand);
		}
		dummy.setUser_id(userID);
		
		// 계좌번호
		String resAccNum = "";
		for (int i = 0; i < accLetter; i++) {
			resAccNum += Integer.toString(random.nextInt(10));
		}
		resAccNum += "***";
		dummy.setAccount_num_masked(resAccNum);
		
		// 계좌구분 코드
		dummy.setAccount_code("AS");
		
		// 계좌잔액
		dummy.setBalance_amt((random.nextInt(1000)+1)*10000);
		
		// 상품명, 상품코드, 은행 코드, 은행 이름
		rand = random.nextInt(73);
		SavingBaseVO sav = savMapper.selectAllSavBase().get(rand);
		dummy.setPrd_id(sav.getSav_id());
		dummy.setProduct_name(sav.getFin_prdt_nm());
		dummy.setBank_code_std(sav.getBank_code());
		dummy.setBank_name(sav.getKor_co_nm());
		
//		System.out.println(dummy);
		
		return accMapper.insertAccount(dummy);
	}

	@Override
	public int makeDumLoa() {
		AccountVO dummy = new AccountVO();
		Random random = new Random();
		int finLetter = 21; // 핀테크코드 자리수
		int accLetter = 10; // 계좌코드 자리수
		
		int rand = 0;

		// 핀테크 이용 번호
		String resFinNum = "loa";
		for (int i = 0; i < finLetter; i++) {
			resFinNum += Integer.toString(random.nextInt(10));
		}
		dummy.setFintech_use_num(resFinNum);
		
		// 계좌소유주 id
		String userID = "test";
		rand = random.nextInt(1005)+1;
		if(rand>=1000) {
			userID += Integer.toString(rand);
		}else if(rand>=100) {
			userID += "0"+Integer.toString(rand);
		}else if(rand>=10) {
			userID += "00"+Integer.toString(rand);
		}else{
			userID += "000"+Integer.toString(rand);
		}
		dummy.setUser_id(userID);
		
		// 계좌번호
		String resAccNum = "";
		for (int i = 0; i < accLetter; i++) {
			resAccNum += Integer.toString(random.nextInt(10));
		}
		resAccNum += "***";
		dummy.setAccount_num_masked(resAccNum);
		
		// 계좌구분 코드
		dummy.setAccount_code("AL");
		
		// 계좌잔액
		dummy.setBalance_amt((random.nextInt(1000)+1)*(-10000));
		
		// 상품명, 상품코드, 은행 코드, 은행 이름
		rand = random.nextInt(45);
		LoanBaseVO loa = loaMapper.selectAllLoanBase().get(rand);
		dummy.setPrd_id(loa.getLoan_id());
		dummy.setProduct_name(loa.getFin_prdt_nm());
		dummy.setBank_code_std(loa.getBank_code());
		dummy.setBank_name(loa.getKor_co_nm());
		
//		System.out.println(dummy);
		
		return accMapper.insertAccount(dummy);
	}
	
}

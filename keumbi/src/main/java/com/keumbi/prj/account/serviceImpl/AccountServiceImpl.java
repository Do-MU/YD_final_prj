package com.keumbi.prj.account.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.accTrans.mapper.AccTransMapper;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.ledger.mapper.LedgerMapper;
import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired AccountMapper accMapper;
	@Autowired AccTransMapper transMapper;
	@Autowired LedgerMapper ledgerMapper;
	
	// 회원 보유 계좌전체조회(api) -> db저장(최초1회)
	@Override
	public List<AccountVO> selectfirstAccount(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		String userId = vo.getId();
		
		List<AccountVO> acclist = BankAPI.getAccountList(vo);
		//System.out.println("AccountServiceImpl  " + acclist);
		
		// 인증 회원 유무 
		//-> 인증 완료된 유저일 경우
		// 새로운 계좌 저장
		for(AccountVO avo : acclist) {
			String fintech_use_num = avo.getFintech_use_num();
			if(accMapper.selectAccount(avo.getFintech_use_num()) == 0 ) {
				avo.setUser_id(userId);
				accMapper.insertAccount(avo);
			}
			
			// 잔액 저장 (최초1회)
			// 잔액이 0일경우 -> UPDATE
			if(accMapper.selectOneAccount(avo.getFintech_use_num()).getBalance_amt() == 0) {
				//System.out.println("AccountServiceImpl 핀넘버 :   " + fintech_use_num);
				AccountVO accVO = (AccountVO) BankAPI.getBalance(vo, fintech_use_num);
				avo.setFintech_use_num(accVO.getFintech_use_num());
				avo.setBalance_amt(accVO.getBalance_amt());
				avo.setProduct_name(accVO.getProduct_name());
				//System.out.println("AccountServiceImpl 잔액 :   " + accVO.getFintech_use_num() + accVO.getProduct_name() + accVO.getBalance_amt());
				accMapper.updateBalance(avo);
			}
			
			// 거래내역 저장 (최초1회)
			// 거래내역 존재하는지 체크하고 없을 경우 insert
			if(transMapper.selectAccTransOne(avo.getFintech_use_num()) == 0) {
				List<AccTransVO> transList = BankAPI.getTransaction(vo, fintech_use_num);
				//System.out.println("00000" + transList);
				for(AccTransVO tvo : transList) {
					transMapper.insertAccTrans(tvo);
					
					// 거래내역 -> total_trans DB에 저장(최초1회)
					LedgerVO lvo = new LedgerVO();
					lvo.setTdate(tvo.getTran_date());
					lvo.setUser_id(userId);
					lvo.setIo_code(tvo.getInout_type());
					lvo.setContent(tvo.getPrint_content());
					lvo.setAmt(tvo.getTran_amt());
					ledgerMapper.transInsert(lvo);
					
				}
			}
		}
		
		return accMapper.selectAllAccount(userId);				
	}
	
	// db 저장 된 계좌 전체 조회
	@Override
	public List<AccountVO> selectAllAccount(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		String userId = vo.getId();
		return accMapper.selectAllAccount(userId);
	}

	// 잔액 합산 출력
	@Override
	public int selectAccTotalSum(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		String userId = vo.getId();
		
		return accMapper.selectAccTotalSum(userId);
	}
	
}

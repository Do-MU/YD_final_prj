package com.keumbi.prj.account.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.accTrans.mapper.AccTransMapper;
import com.keumbi.prj.accTrans.vo.AccTransVO;
import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.common.mapper.CodeMapper;
import com.keumbi.prj.ledger.mapper.LedgerMapper;
import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired AccountMapper accMapper;
	@Autowired AccTransMapper transMapper;
	@Autowired LedgerMapper ledgerMapper;
	@Autowired CodeMapper codeMapper;
	
	// API를 통해 계좌목록/잔액/계좌거래내역을 가져와 각각 비교 후 DB에 저장
	// 회원 보유 계좌전체조회(API) -> DB저장(최초 1회)
	@Override
	public List<AccountVO> selectfirstAccount(UserVO vo) {
		
		List<AccountVO> acclist = BankAPI.getAccountList(vo);
		if(acclist != null) {
			// API에서 계좌 목록을 가져와서
			for(AccountVO avo : acclist) {
				// 해당 계좌가 DB에 존재하지 않으면 (API에 새로 등록된 계좌)
				if(accMapper.selectAccount(avo.getFintech_use_num()) == 0 ) {
					avo.setUser_id(vo.getId());
					// 해당 계좌를 DB에 INSERT한다.
					accMapper.insertAccount(avo);
				}
				
				// 잔액 저장 (최초 1회)
				// DB에 저장된 계좌의 잔액이 0일 때
				if(accMapper.selectOneAccount(avo.getFintech_use_num()).getBalance_amt() == 0) {
					// 해당 계좌의 잔액과 상품명을 가져와 accVO에 저장
					AccountVO accVO = (AccountVO) BankAPI.getBalance(vo, avo.getFintech_use_num());		
					avo.setBalance_amt(accVO.getBalance_amt());				// 잔액 설정
					avo.setProduct_name(accVO.getProduct_name());			// 상품명 설정
					// 잔액과 상품명을 UPDATE한다.
					accMapper.updateBalance(avo);
				}
				
				// 거래내역 저장 (최초 1회)
				// 거래내역 존재하는지 체크하고 거래내역이 없을 경우
				if(transMapper.selectAccTransOne(avo.getFintech_use_num()) == 0) {
					// API로부터 거래내역 리스트를 불러온다 
					List<AccTransVO> transList = BankAPI.getTransaction(vo, avo.getFintech_use_num());
					// 각각의 거래내역을
					for(AccTransVO tvo : transList) {
						// 계좌 거래내역에 INSERT하고
						transMapper.insertAccTrans(tvo);
						
						// 지출내역 (total_trans) DB에 저장 (최초 1회)
						LedgerVO lvo = new LedgerVO();
						lvo.setTdate(tvo.getTran_date());
						lvo.setUser_id(vo.getId());
						lvo.setIo_code(tvo.getInout_type());
						lvo.setContent(tvo.getPrint_content());
						lvo.setAmt(tvo.getTran_amt());
						ledgerMapper.transInsert(lvo);
					}
				}
			}
		}else {
			accMapper.deleteAccounts(vo);
		}
		
		return selectAllAccount(vo);				
	}
	
	// DB에 저장된 회원의 전체 계좌 조회
	@Override
	public List<AccountVO> selectAllAccount(UserVO vo) {
		
		return accMapper.selectAllAccount(vo.getId());
	}

	// 잔액 합산 출력
	@Override
	public int selectAccTotalSum(String userId) {
		int amt = accMapper.selectAccTotalSum(userId);
		
		return amt;
	}

	// 계좌 단건 조회
	@Override
	public AccountVO selectOneAccount(String fintech_use_num) {
		
		return accMapper.selectOneAccount(fintech_use_num);
	}
	
}

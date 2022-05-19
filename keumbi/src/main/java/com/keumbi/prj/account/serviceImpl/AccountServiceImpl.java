package com.keumbi.prj.account.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.account.mapper.AccountMapper;
import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.openBank.BankAPI;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired AccountMapper m;
	
	@Override
	public List<AccountVO> selectAll(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		String userId = vo.getId();
		String userSeq = vo.getUser_seq_num();
		
		// 인증 회원 유무 
		//-> 인증 완료된 유저일 경우
		List<AccountVO> acclist = BankAPI.getAccountList(vo);
		//System.out.println("--- " + acclist);
		if(userSeq != null) {
			// 새로운 계좌, 잔액변동 유무 조회
			for(AccountVO avo : acclist) {
				if(m.selectAccount(avo.getFintech_use_num()) == 0 ) {
					//System.out.println("INSERT!!!!");
					avo.setUser_id(userId);
					m.insertAccount(avo);
				}
				
				long blist = BankAPI.getBalance(vo, avo.getFintech_use_num());
				//System.out.println("blist : " + blist);
				if(m.selectOne(avo.getFintech_use_num()).getBalance_amt() != blist) {
					//System.out.println("UPDATE!!!!");
					avo.getFintech_use_num();
					avo.setBalance_amt(blist);
					m.updateBalance(avo);
				}
			}
		} 
		
		/*else {
			//계좌목록 조회 -> db 저장
			for(AccountVO avo : acclist) {
				avo.setUser_id(userId);
				//잔액조회
				long blist = BankAPI.getBalance(vo, avo.getFintech_use_num());
				//System.out.println("blist : " + blist);
				avo.setBalance_amt(blist);
				//db저장
				m.insertAccount(avo);
			}
		}*/
		
		return m.selectAll(userId);				
	}

	@Override
	public AccountVO selectOne(String fintech_use_num) {
		return m.selectOne(fintech_use_num);
	}

	@Override
	public int insertAccount(AccountVO vo) {
		return m.insertAccount(vo);
	}

	@Override
	public int updateBalance(AccountVO vo) {
		return m.updateBalance(vo);
	}

	@Override
	public int selectAccount(String fintech_use_num) {
		
		return m.selectAccount(fintech_use_num);
	}
	
}

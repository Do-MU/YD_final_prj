package com.keumbi.prj.chall.serviceImpl;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.chall.mapper.ChallMapper;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.chall.vo.ChallVO;
import com.keumbi.prj.ledger.vo.LedgerVO;
import com.keumbi.prj.prd.mapper.PrdChallengeMapper;
import com.keumbi.prj.prd.vo.PrdChallengeVO;
import com.keumbi.prj.prd.vo.TransSearchVO;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class ChallServiceImpl implements ChallService {
	@Autowired ChallMapper chM;
	@Autowired PrdChallengeMapper prdM;
	
	@Override
	public List<ChallVO> challList(UserVO user) {
		for(ChallVO ch : chM.selectChallList(user)) {		// 해당 유저의 모든 챌린지를 가져온다 
			PrdChallengeVO prd = new PrdChallengeVO();
			prd.setNum(ch.getChall_num());					// chall_num을 통해 해당 챌린지를 가져온다
			prd = prdM.prdChallengeSelect(prd);
			
			TransSearchVO vo = new TransSearchVO();
			vo.setUser_id(ch.getUser_id());					// 유저의 ID
			vo.setCategory(prd.getCategory());				// 해당 챌린지의 카테고리
			vo.setSdate(ch.getSdate());						// 챌린지 시작일
			vo.setEdate(ch.getEdate());						// 챌린지 종료일
			
			String ck = vo.getCategory().substring(0,3);
			List<LedgerVO> list = null;
			if(ck.equals("CKA")) {							// 챌린지의 카테고리가 CKA인지 CKB인지 확인
				list = prdM.transListByCatA(vo);			// 지출 카테고리로 검색
			}else if(ck.equals("CKB")) {
				list = prdM.transListByCatB(vo);			// 지출 키워드로 검색
			}
			int sum = 0;
			for(LedgerVO t : list) {
				sum += t.getAmt();
			}
			ch.setAccum_amt(sum);
			if(sum>ch.getGoal()) {
				ch.setProgress(0);
			}else {
				ch.setProgress( Math.round( (double) sum/ch.getGoal()*1000 ) / 10.0 );				
			}
			
			chM.challUpdate(ch);
		}
		
		return chM.selectChallList(user);
	}

	@Override
	public int challCount(ChallVO vo) {
		return chM.challCount(vo);
	}

	@Override
	public int challInsert(ChallVO vo) {
		return chM.challInsert(vo);
	}
	
	// 챌린지 도전자 수
	@Override
	public int challTotalUser(int chall_num) {
		return chM.challTotalUser(chall_num);
	}

	// 챌린지 진행 이후 해당 챌린지의 카테고리에 해당하는 지출 총합
	@Override
	public int challTransAmt(ChallVO ch) {
		ch = chM.selectChall(ch);
		
		PrdChallengeVO prd = new PrdChallengeVO();
		prd.setNum(ch.getChall_num());
		prd = prdM.prdChallengeSelect(prd);
		
		TransSearchVO vo = new TransSearchVO();
		vo.setUser_id(ch.getUser_id());
		vo.setCategory(prd.getCategory());
		vo.setSdate(ch.getSdate());
		vo.setEdate(ch.getEdate());
		
		String ck = vo.getCategory().substring(0,3);
		List<LedgerVO> list = null;
		if(ck.equals("CKA")) {
			list = prdM.transListByCatA(vo);
		}else if(ck.equals("CKB")) {
			list = prdM.transListByCatB(vo);
		}else {
			return 0;
		}
		int sum = 0;
		for(LedgerVO t : list) {
			sum += t.getAmt();
		}
		return sum;
	}
	
	

	
	
	// 챌린지 더미 데이터 만들기
	@Override
	public int makeDummyChall() {
		ChallVO dummy = new ChallVO();
		Random random = new Random();
		
		int rand = 0;
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
		
		dummy.setGoal(50000);
		dummy.setChall_num(random.nextInt(8)+1);
		
//		System.out.println(dummy);
		return chM.challInsert(dummy);
	}
}

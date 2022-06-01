package com.keumbi.prj.chall.serviceImpl;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.chall.mapper.ChallMapper;
import com.keumbi.prj.chall.service.ChallService;
import com.keumbi.prj.chall.vo.ChallVO;

@Service
public class ChallServiceImpl implements ChallService {
	@Autowired ChallMapper m;
	
	@Override
	public List<ChallVO> challList(String id) {
		return m.challList(id);
	}

	@Override
	public int challSelect(ChallVO vo) {
		return m.challSelect(vo);
	}

	@Override
	public int challInsert(ChallVO vo) {
		return m.challInsert(vo);
	}
	
	//챌린지 도전자 수
	@Override
	public int challTotalUser(int chall_num) {
		return m.challTotalUser(chall_num);
	}

	
	
	// 예금상품 더미 데이터 만들기
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
		return m.challInsert(dummy);
	}

	@Override
	public int userAmtSumA(ChallVO vo) {
		return m.userAmtSumA(vo);
	}

}

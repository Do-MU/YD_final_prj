package com.keumbi.prj.prd.serviceImpl;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.prd.mapper.PrdCardMapper;
import com.keumbi.prj.prd.service.PrdCardService;
import com.keumbi.prj.prd.vo.PrdCardVO;
import com.keumbi.prj.prd.vo.PrdCardRecoVO;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class PrdCardServiceImpl implements PrdCardService {
	
	@Autowired PrdCardMapper mapper;

	// 전체 카드상품
	@Override
	public List<PrdCardVO> selectAllPrdCard() {
		return mapper.selectAllPrdCard();
	}

	// 랜덤으로 5개 출력
	@Override
	public List<PrdCardVO> selectRandomCard() {
		return mapper.selectRandomCard();
	}

	// 카드 단건 상세보기 출력
	@Override
	public PrdCardVO selectOneCard(PrdCardVO vo) {
		return mapper.selectOneCard(vo);
	}

	// 카드사별 상품 리스트
	@Override
	public List<PrdCardVO> selectCompanyCard(PrdCardVO vo) {
		return mapper.selectCompanyCard(vo);
	}

	// 연령대별 카드 추천
	@Override
	public List<PrdCardVO> selectRecoAge(UserVO vo) {
		return mapper.selectRecoAge(vo);
	}

	// 소비패턴별 카드 추천
	@Override
	public List<PrdCardRecoVO> selectCousum(UserVO vo) {
		return mapper.selectConsum(vo);
	}

	// 소비패턴별 카드 추천
	@Override
	public List<PrdCardRecoVO> selectKeyword(UserVO vo) {
		return mapper.selectKeyword(vo);
	}
	
	
	
	// 카드상품 더미 데이터 만들기
	@Override
	public int makeDummyCard() {
		PrdCardVO dummy = new PrdCardVO();
		Random random = new Random();
		String resCardID = ""; // 카드식별자
		
		int cardIdLetter = 24;		// 카드 식별자 자릿수
		int cardNumLetter = 12; 	// 카드 번호 자릿수

		int rand = 0;
		String userID = "test";
		String resCardNum = ""; 	// 카드번호
		
		//카드 식별자
		for(int i=0; i<cardIdLetter; i++) {
			int index = random.nextInt(4);
			switch(index) {
			case 0 : 
				resCardID += ((char)(random.nextInt(26) + 97));
				break;
			case 1 : 
				resCardID += ((char)(random.nextInt(26) + 65));
				break;
			case 2 : 
				resCardID += ((char)(random.nextInt(26) + 97));
				break;
			case 3 : 
				resCardID += (random.nextInt(10));
				break;
			}
		}
		//System.out.println("===" + sb);
		dummy.setCard_id(resCardID);
		
		// 계좌소유주 id
		rand = random.nextInt(1005)+1;
		if(rand>=1000) {
			userID += Integer.toString(rand);
		} else if(rand>=100) {
			userID += "0"+Integer.toString(rand);
		} else if(rand>=10) {
			userID += "00"+Integer.toString(rand);
		} else {
			userID += "000"+Integer.toString(rand);
		}
		dummy.setUser_id(userID);
		
		// 카드번호
		for (int i=0; i<cardNumLetter; i++) {
			resCardNum += Integer.toString(random.nextInt(10));
		}
		resCardNum += "****";
		String cardNum = resCardNum.substring(0, 4) + "-" + resCardNum.substring(4, 8) + "-" 
							+ resCardNum.substring(8, 12) + "-" + resCardNum.substring(12);
		//System.out.println("===" + cardNum);
		dummy.setCard_num_masked(cardNum);
		
		// 카드상품명, 카드사코드, 회원금융사코드
		rand = random.nextInt(62);
		PrdCardVO card = mapper.selectAllPrdCard().get(rand);
		dummy.setCard_name(card.getCard_name());
		dummy.setBank_code_std(card.getCard_company());
		dummy.setMember_bank_code(card.getCard_seq());
		
		//System.out.println(dummy);
		return mapper.insertPrdCard(dummy);
	}

	// 사용자인증 -> 카드 임의 생성
	@Override
	public int makeCard(String id) {
		PrdCardVO dummy = new PrdCardVO();
		Random random = new Random();
		String resCardID = ""; 		// 카드식별자
		
		int cardIdLetter = 24;		// 카드 식별자 자릿수
		int cardNumLetter = 16; 	// 카드 번호 자릿수

		int rand = 0;
		String resCardNum = ""; 	// 카드번호
		
		//카드 식별자
		for(int i=0; i<cardIdLetter; i++) {
			int index = random.nextInt(4);
			switch(index) {
			case 0 : 
				resCardID += ((char)(random.nextInt(26) + 97));
				break;
			case 1 : 
				resCardID += ((char)(random.nextInt(26) + 65));
				break;
			case 2 : 
				resCardID += ((char)(random.nextInt(26) + 97));
				break;
			case 3 : 
				resCardID += (random.nextInt(10));
				break;
			}
		}
		dummy.setCard_id(resCardID);
		
		// UserID
		dummy.setUser_id(id);
		
		// 카드번호
		for (int i=0; i<cardNumLetter; i++) {
			resCardNum += Integer.toString(random.nextInt(10));
		}
		resCardNum += "****";
		String cardNum = resCardNum.substring(0, 4) + "-" + resCardNum.substring(4, 8) + "-" 
							+ resCardNum.substring(8, 12) + "-" + resCardNum.substring(12, 16) + "-" + resCardNum.substring(16);
		dummy.setCard_num_masked(cardNum);
		
		// 카드상품명, 카드사코드, 회원금융사코드
		rand = random.nextInt(62);
		PrdCardVO card = mapper.selectAllPrdCard().get(rand);
		dummy.setCard_name(card.getCard_name());
		dummy.setBank_code_std(card.getCard_company());
		dummy.setMember_bank_code(card.getCard_seq());
		
		return mapper.insertPrdCard(dummy);
	}
}

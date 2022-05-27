package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.prd.mapper.SavingMapper;
import com.keumbi.prj.prd.service.SavingService;
import com.keumbi.prj.prd.vo.SavingBaseVO;
import com.keumbi.prj.prd.vo.SavingOptionVO;
import com.keumbi.prj.prd.vo.SavingVO;
import com.keumbi.prj.prd.web.PrdAPI;

@Service
public class SavingServiceImpl implements SavingService {
	@Autowired
	SavingMapper s;

	@Override //전체 적금 목록 불러오기
	public List<SavingBaseVO> selectAllSavBase() {
		return s.selectAllSavBase();
	}

	@Override // 단건 적금 정보 불러오기
	public SavingBaseVO selectOneSavBase(int sav_id) {
		return s.selectOneSavBase(sav_id);
	}

	@Override // 적금의 옵션 목록 불러오기
	public List<SavingOptionVO> selectAllSavOpt(int sav_id) {
		return s.selectAllSavOpt(sav_id);
	}

	@Override // 적금 정보 DB에 저장
	public String insertAllSavings() {
		int baseCnt = 0;
		int optCnt = 0;

		SavingVO saving = PrdAPI.getSavingList();
		
		deleteAllSavings();

		for (SavingBaseVO svo : saving.getBaseList()) {
			CodeVO bankCode = s.selectBankName(svo.getKor_co_nm()); 
			svo.setKor_co_nm(bankCode.getVal());
			svo.setBank_code(bankCode.getCode());
			baseCnt += s.insertSavBase(svo);
		}

		for (SavingOptionVO svo : saving.getOptionList()) {
			
			optCnt += s.insertSavOpt(svo);
		}
		
		return "적금상품 : " + baseCnt + "건\n적금상품옵션 : " + optCnt + "건\n업데이트 완료";
	}

	@Override // 적금정보 삭제
	public void deleteAllSavings() {
		s.deleteAllSavOpt();
		s.deleteAllSavBase();
	}
	

}

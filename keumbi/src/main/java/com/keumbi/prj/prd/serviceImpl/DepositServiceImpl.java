package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.prd.mapper.DepositMapper;
import com.keumbi.prj.prd.service.DepositService;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;
import com.keumbi.prj.prd.web.PrdAPI;

@Service
public class DepositServiceImpl implements DepositService {

	@Autowired
	DepositMapper m;

	@Override // 전쳬 예금 목록 불러오기
	public List<DepositBaseVO> selectAllDepBase() {

		return m.selectAllDepBase();
	}

	@Override // 단건 예금 정보 불러오기
	public DepositBaseVO selectOneDepBase(int dep_id) {

		return m.selectOneDepBase(dep_id);
	}

	@Override // 예금의 옵션 목록 불러오기
	public List<DepositOptionVO> selectAllDepOpt(int dep_id) {

		return m.selectAllDepOpt(dep_id);
	}

	@Override // 예금 정보 DB에 저장
	public String insertAllDeposits() {
		int baseCnt = 0;
		int optCnt = 0;

		DepositVO deposits = PrdAPI.getDepositList();

		deleteAllDeposits();

		for (DepositBaseVO bvo : deposits.getBaseList()) {
			bvo.setKor_co_nm(m.selectBankName(bvo.getKor_co_nm()));
			m.insertDepBase(bvo);
			baseCnt++;
		}

		for (DepositOptionVO ovo : deposits.getOptionList()) {
			m.insertDepOpt(ovo);
			optCnt++;
		}

		return "예금상품 : " + baseCnt + "건\n예금상품옵션 : " + optCnt + "건\n업데이트 완료";
	}

	@Override // 예금 정보 삭제
	public void deleteAllDeposits() {
		m.deleteAllDepOpt();
		m.deleteAllDepBase();
	}
}

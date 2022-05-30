package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.prd.mapper.DepositMapper;
import com.keumbi.prj.prd.service.DepositService;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;
import com.keumbi.prj.prd.vo.DepositVO;
import com.keumbi.prj.prd.web.PrdAPI;

@Service
public class DepositServiceImpl implements DepositService {

	@Autowired DepositMapper m;

	@Override // 전체 예금 목록 불러오기
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
			CodeVO bankCode = m.selectBankName(bvo.getKor_co_nm());
			bvo.setKor_co_nm(bankCode.getVal());
			bvo.setBank_code(bankCode.getCode());
			baseCnt += m.insertDepBase(bvo);
		}

		for (DepositOptionVO ovo : deposits.getOptionList()) {
			
			optCnt += m.insertDepOpt(ovo);
		}

		return "예금상품 : " + baseCnt + "건\n예금상품옵션 : " + optCnt + "건\n업데이트 완료";
	}

	@Override // 예금 정보 삭제
	public void deleteAllDeposits() throws SqlSessionException{
		m.deleteAllDepOpt();
		m.deleteAllDepBase();
	}

	@Override
	public List<DepositBaseVO> selectBestDepBase() {
		return m.selectBestDepBase();
	}
}

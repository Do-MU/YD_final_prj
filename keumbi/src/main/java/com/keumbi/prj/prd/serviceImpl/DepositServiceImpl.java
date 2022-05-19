package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.prd.mapper.DepositMapper;
import com.keumbi.prj.prd.service.DepositService;
import com.keumbi.prj.prd.vo.DepositBaseVO;
import com.keumbi.prj.prd.vo.DepositOptionVO;

@Service
public class DepositServiceImpl implements DepositService{

	@Autowired DepositMapper m;
	
	@Override
	public List<DepositBaseVO> selectAllDepBase() {
		return m.selectAllDepBase();
	}

	@Override
	public List<DepositOptionVO> selectAllDepOpt(int dep_id) {
		return m.selectAllDepOpt(dep_id);
	}

	@Override
	public int insertDepBase(DepositBaseVO vo) {
		return m.insertDepBase(vo);
	}

	@Override
	public int insertDepOpt(DepositOptionVO vo) {
		return m.insertDepOpt(vo);
	}

	@Override
	public int deleteAllDepBase() {
		return m.deleteAllDepBase();
	}

	@Override
	public int deleteAllDepOpt() {
		return m.deleteAllDepOpt();
	}

	@Override
	public List<DepositBaseVO> selectBankName() {
		// TODO Auto-generated method stub
		return m.selectBankName();
	}

	@Override
	public List<DepositBaseVO> selectAllDepBase(int dep_id) {
		// TODO Auto-generated method stub
		return m.selectAllDepBase(dep_id);
	}

}

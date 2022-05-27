package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.prd.mapper.PrdCardMapper;
import com.keumbi.prj.prd.service.PrdCardService;
import com.keumbi.prj.prd.vo.PrdCardVO;

@Service
public class PrdCardSertviceImpl implements PrdCardService {
	
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

}

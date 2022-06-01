package com.keumbi.prj.card.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.card.mapper.CardMapper;
import com.keumbi.prj.card.service.CardService;
import com.keumbi.prj.card.vo.CardVO;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class CardServiceImpl implements CardService{
	@Autowired CardMapper mapper;

	// 보유카드 전체조회
	@Override
	public List<CardVO> selectAllCard(UserVO vo) {
		return mapper.selectAllCard(vo);
	}

}

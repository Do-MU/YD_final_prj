package com.keumbi.prj.card.service;

import java.util.List;

import com.keumbi.prj.card.vo.CardVO;
import com.keumbi.prj.user.vo.UserVO;

public interface CardService {

	List<CardVO> selectAllCard(UserVO vo);	// 보유카드 전체조회
}

package com.keumbi.prj.card.mapper;

import java.util.List;

import com.keumbi.prj.card.vo.CardVO;
import com.keumbi.prj.user.vo.UserVO;

public interface CardMapper {
	List<CardVO> selectAllCard(UserVO vo);	// 보유카드 전체조회
}

package com.keumbi.prj.kb.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.kb.mapper.KeumbiMapper;
import com.keumbi.prj.kb.service.KeumbiService;
import com.keumbi.prj.kb.vo.KeumbiVO;

@Service
public class KeumbiServiceImpl implements KeumbiService {

	@Autowired KeumbiMapper m;
	
	@Override
	public List<KeumbiVO> selectTeamMember() {
		return m.selectTeamMember();
	}

}

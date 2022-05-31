package com.keumbi.prj.sanction.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.keumbi.prj.sanction.mapper.SanctionMapper;
import com.keumbi.prj.sanction.service.SanctionService;
import com.keumbi.prj.sanction.vo.SanctionVO;

@Service
public class SanctionServiceImpl implements SanctionService{
	@Autowired SanctionMapper m;
	
	@Override
	public List<SanctionVO> sanUser() {
		return m.sanUser();
	}
	
}

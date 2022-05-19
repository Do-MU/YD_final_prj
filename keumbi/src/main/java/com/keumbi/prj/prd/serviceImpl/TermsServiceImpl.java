package com.keumbi.prj.prd.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.prd.mapper.TermsMapper;
import com.keumbi.prj.prd.service.TermsService;
import com.keumbi.prj.prd.vo.TermsVO;

@Service
public class TermsServiceImpl implements TermsService {
	@Autowired TermsMapper m;
	
	
	@Override
	public List<TermsVO> selectAllTerms() {
		
		return m.selectAllTerms();
	}

	@Override
	public TermsVO selectDepTerms(String term_name) {
		// TODO Auto-generated method stub
		return m.selectDepTerms(term_name);
	}

}

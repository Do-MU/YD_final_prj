package com.keumbi.prj.prd.service;

import java.util.List;

import com.keumbi.prj.prd.vo.TermsVO;

public interface TermsService {
	
	List<TermsVO> selectAllTerms();
	
	TermsVO selectDepTerms(String term_name);
}

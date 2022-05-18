package com.keumbi.prj.prd.mapper;

import java.util.List;

import com.keumbi.prj.prd.vo.TermsVO;

public interface TermsMapper {
	List<TermsVO> selectAllTerms();
	
	TermsVO selectDepTerms(String term_name);
}

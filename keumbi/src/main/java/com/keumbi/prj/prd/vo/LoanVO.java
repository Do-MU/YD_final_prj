package com.keumbi.prj.prd.vo;

import java.util.List;

import lombok.Data;

@Data
public class LoanVO {
	private List<LoanBaseVO> baseList;
	private List<LoanOptionVO> optionList;
}

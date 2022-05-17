package com.keumbi.prj.prd.vo;

import java.util.List;

import lombok.Data;

@Data
public class SavingVO {
	private List<SavingBaseVO> baseList;
	private List<SavingOptionVO> optionList;
}

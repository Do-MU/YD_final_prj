package com.keumbi.prj.prd.vo;

import java.util.List;

import lombok.Data;

@Data
public class DepositVO {
	private List<DepositBaseVO> baseList;
	private List<DepositOptionVO> optionList;
}

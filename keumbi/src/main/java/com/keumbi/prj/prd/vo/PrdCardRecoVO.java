package com.keumbi.prj.prd.vo;

import lombok.Data;

@Data
public class PrdCardRecoVO {

	// common_code
	private String val;
	
	// prd_cards
	private String card_seq;
	private String card_code;
	private String card_name;
	private String card_company;
	private String card_info;
	private String card_annualfee;
	private String card_benefit;
	private String card_image;
	private String card_perfo;
	
	// 지출
	private String cat_code;
	
}

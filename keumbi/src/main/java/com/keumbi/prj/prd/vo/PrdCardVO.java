package com.keumbi.prj.prd.vo;

import lombok.Data;

@Data
public class PrdCardVO {

	private String card_seq;
	private String card_name;
	private String card_company;
	private String card_info;
	private String card_annualfee;
	private String card_benefit;
	private String card_image;
	private String card_perfo;
	private String val;
	
	//dummyVO
	private String card_id;
	private String user_id;
	private String card_num_masked;
	private String bank_code_std;
	private String member_bank_code;
}

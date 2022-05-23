package com.keumbi.prj.card.vo;

import lombok.Data;

@Data
public class CardVO {

	private String card_id;
	private String user_id;
	private String card_num_masked;
	private String card_name;
	private String bank_code_std;
	private String member_bank_code;
	private String issue_date;
	private String state_code; 
}

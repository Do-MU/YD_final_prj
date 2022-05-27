package com.keumbi.prj.account.vo;

import lombok.Data;

@Data
public class AccountVO {
	private String fintech_use_num;
	private String user_id;
	private String account_num_masked;
	private String account_alias;
	private String bank_code_std;
	private String bank_name;
	private String account_code;
	private int balance_amt;
	private String product_name;
	private String prd_id;
}

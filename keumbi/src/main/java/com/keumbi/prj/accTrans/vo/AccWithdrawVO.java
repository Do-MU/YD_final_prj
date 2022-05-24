package com.keumbi.prj.accTrans.vo;

import lombok.Data;

@Data
public class AccWithdrawVO {

	private int wit_seq;
	private String wit_fintech_use_num;
	private String wit_tran_date;
	private String wit_tran_time;
	private String wit_inout_type = "출금";
	private String wit_tran_type = "송금";
	private String wit_print_content;
	private int wit_tran_amt;
	private int wit_after_balance_amt;
	private String wit_branch_name = "금비";
}

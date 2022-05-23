package com.keumbi.prj.accDeposit.vo;

import lombok.Data;

@Data
public class AccDepositVO {

	private int dep_seq;
	private String dep_fintech_use_num;
	private String dep_tran_date;
	private String dep_tran_time;
	private String dep_inout_type;
	private String dep_tran_type;
	private String dep_print_content;
	private int dep_tran_amt;
	private int dep_after_balance_amt;
	private String dep_branch_name;
	
}

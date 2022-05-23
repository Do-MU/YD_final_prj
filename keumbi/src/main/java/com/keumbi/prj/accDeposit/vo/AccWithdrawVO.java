package com.keumbi.prj.accDeposit.vo;

import lombok.Data;

@Data
public class AccWithdrawVO {

	private int wit_seq;
	private String witfintech_use_num;
	private String wittran_date;
	private String wittran_time;
	private String witinout_type;
	private String wittran_type;
	private String witprint_content;
	private int wittran_amt;
	private int witafter_balance_amt;
	private String witbranch_name;
}

package com.keumbi.prj.accTrans.vo;

import lombok.Data;

@Data
public class AccTransVO {

	private int seq;
	private String fintech_use_num;
	private String tran_date;
	private String tran_time;
	private String inout_type;
	private String tran_type;
	private String print_content;
	private int tran_amt;
	private int after_balance_amt;
	private String branch_name;
}

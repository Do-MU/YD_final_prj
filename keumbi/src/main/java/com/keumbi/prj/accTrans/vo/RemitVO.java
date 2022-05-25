package com.keumbi.prj.accTrans.vo;


import lombok.Data;

@Data
public class RemitVO {

	private int seq;
	
	// 출금계좌
	private String wit_fintech_use_num;
	private String wit_inout_type = "출금";
	private String wit_print_content;
	private int wit_after_balance_amt;
	private int wit_amt;
	private String wit_bank_name;
	
	// 입금계좌
	private String dep_fintech_use_num;
	private String dep_inout_type = "입금";
	private String dep_print_content;
	private int dep_after_balance_amt;
	private int dep_amt;
	private String dep_bank_name;
	
	// 공통
	private String tran_date;
	private String tran_time;
	private int tran_amt;
	private String tran_type = "송금";
	private String branch_name = "금비";
}
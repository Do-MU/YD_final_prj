package com.keumbi.prj.accTrans.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RemitVO {

	private int seq;
	
	// 출금계좌
	private String wit_fintech_use_num;
	private String wit_inout_type = "출금";
	private String wit_print_content;
	private int wit_tran_amt;
	private int wit_after_balance_amt;
	
	// 입금계좌
	private String dep_fintech_use_num;
	private String dep_inout_type = "입금";
	private String dep_print_content;
	private int dep_tran_amt;
	private int dep_after_balance_amt;
	
	// 공통
	@JsonFormat(pattern="yyyyMMdd", timezone="Asia/Seoul")
	private Date tran_date;
	@JsonFormat(pattern="hhmmss", timezone="Asia/Seoul")
	private Date tran_time;
	private String tran_type = "송금";
	private String branch_name = "금비";
}
package com.keumbi.prj.prd.vo;

import lombok.Data;

@Data
public class LoanOptionVO {
	private int loan_id;
	private String dcls_month;
	private String fin_co_no;
	private String fin_prdt_cd;
	
	private String crdt_prdt_type;
	private String crdt_lend_rate_type;
	private String crdt_lend_rate_type_nm;
	private String crdt_grad_1;
	private String crdt_grad_4;
	private String crdt_grad_5;
	private String crdt_grad_6;
	private String crdt_grad_10;
	private String crdt_grad_11;
	private String crdt_grad_12;
	private String crdt_grad_13;
	private String crdt_grad_avg;
}

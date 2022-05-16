package com.keumbi.prj.prd.vo;

import lombok.Data;

@Data
public class LoanBaseVO {
	private int loan_id;
	private String dcls_month;
	private String fin_co_no;
	private String fin_prdt_cd;
	private String crdt_prdt_type;
	private String kor_co_nm;
	private String fin_prdt_nm;
	private String join_way;
	private String cb_name;
	private String crdt_prdt_type_nm;
}

package com.keumbi.prj.ledger.vo;

import lombok.Data;

@Data
public class LedgerVO {

	private String tdate;
	private int num;
	private String user_id;
	private String content;
	private int amt;
	private String io_code;
	private String val;
	private String cat_code;
	private String keyword;
	
}

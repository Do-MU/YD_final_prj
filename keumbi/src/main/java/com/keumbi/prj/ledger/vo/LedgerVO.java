package com.keumbi.prj.ledger.vo;

import lombok.Data;

@Data
public class LedgerVO {

	private String tdate;
	private int num;
	private String user_id;
	private String io_code;
	private String content;
	private int amt;
	private String cat_code;
	
}

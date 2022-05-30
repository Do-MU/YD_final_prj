package com.keumbi.prj.sanction.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SanctionVO {
	private int sanc_num;
	private String user_id;
	private String sanc_code;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date sdate;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date edate;
	private String sanc_reason;
}

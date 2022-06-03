package com.keumbi.prj.report.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReportVO {
	private int rep_num;
	private String rep_id;
	private	String reped_id;
	@JsonFormat(pattern="yy/MM/dd", timezone="Asia/Seoul")
	private	String rep_date;
	private String rep_code;
	private int rep_reason;
}

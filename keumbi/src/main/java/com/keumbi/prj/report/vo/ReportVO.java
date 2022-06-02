package com.keumbi.prj.report.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
	private int req_num;
	private String req_id;
	private	String reqed_id;
	private	Date req_date;
	private String req_reason;
}

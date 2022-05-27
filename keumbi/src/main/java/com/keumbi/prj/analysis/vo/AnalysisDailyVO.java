package com.keumbi.prj.analysis.vo;

import lombok.Data;

@Data
public class AnalysisDailyVO {
	private String user_id;
	private String firstday;
	private String lastday;
	private String dt;
	private int amt;
	
}

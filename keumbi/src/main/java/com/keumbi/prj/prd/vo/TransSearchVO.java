package com.keumbi.prj.prd.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TransSearchVO {
	private String category;
	private String user_id;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date sdate;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date edate;
}

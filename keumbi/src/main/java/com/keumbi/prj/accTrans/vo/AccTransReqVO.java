package com.keumbi.prj.accTrans.vo;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AccTransReqVO {
	
	private String fintech_use_num;
	
	@JsonFormat(pattern="yyyyMMdd", timezone="Asia/Seoul")
	private Date from_date;
	
	@JsonFormat(pattern="yyyyMMdd", timezone="Asia/Seoul")
	private Date to_date;

	private String tran_dtime;
}

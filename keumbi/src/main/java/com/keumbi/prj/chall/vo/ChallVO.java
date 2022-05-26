package com.keumbi.prj.chall.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ChallVO {
	private int num;
	private String user_id;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date sdate;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date edate;
	private int dday;
	private int goal;
	private String chall_code;
	private int chall_num;
}

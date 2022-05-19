package com.keumbi.prj.chall.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChallVO {
	private int num;
	private String user_id;
	private Date s_date;
	private Date e_date;
	private int goal;
	private String chall_code;
	private int chall_num;
}

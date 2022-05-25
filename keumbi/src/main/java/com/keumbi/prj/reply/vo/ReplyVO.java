package com.keumbi.prj.reply.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private int re_num;
	private String user_id;
	private int bod_num;
	private int pre_re_num;
	private String re_contents;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date re_date;
	private String re_code;
}

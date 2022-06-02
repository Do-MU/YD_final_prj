package com.keumbi.prj.reply.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private int re_num;
	private String user_id;
	private int bod_num;
	private int pre_re_num;
	private String re_contents;
	@JsonFormat(pattern="yyyy-MM-dd kk:mm:ss", timezone="Asia/Seoul") 
	private Date re_date; 	
	private String re_code;
	
	List <ReplyVO> pre_re; 
}

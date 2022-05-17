package com.keumbi.prj.board.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class BoardVO {
	private int bod_num;
	private String user_id;
	private String title;
	private String contents;
	
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date wDate;
	private String bod_code;
	private int hit;
}

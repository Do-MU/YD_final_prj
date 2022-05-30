package com.keumbi.prj.qna.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private int num;
	private String user_id;
	private String title;
	private String qcontents;
	private Date qdate;
	private String acontents;
	private Date adate;
	private String answer_code;
}

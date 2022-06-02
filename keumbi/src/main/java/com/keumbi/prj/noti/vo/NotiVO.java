package com.keumbi.prj.noti.vo;

import lombok.Data;

@Data
public class NotiVO {
	private int num;
	private String user_id;
	private String noti_code;			// N
	private String noti_contents;
	private String noti_read_code;		// AR
	
	private String challTitle;			// 챌린지 이름
}

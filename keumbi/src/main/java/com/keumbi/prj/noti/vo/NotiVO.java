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
	private String kwds;				// 키워드 집합
	private String sanc_code;			// 제재 코드
	private String edate;				// 제재 만료일
}

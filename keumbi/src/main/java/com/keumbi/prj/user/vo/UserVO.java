package com.keumbi.prj.user.vo;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String gender_code;
	private String email; 
	private String phone;
	private String addr;
	private String user_code;
	private String user_seq_num;
	private String access_token;
	private String refresh_token;
	
}

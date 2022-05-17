package com.keumbi.prj.openBank;

import lombok.Data;

@Data
public class AuthVO {
	private String client_id = "97816d1a-0be1-4cc1-bafe-d622c3b815cb";
	private String client_secret = "46f57b4a-308a-4546-9c34-960a58ca26b7";
	private String redirect_uri = "http://localhost/prj/bankCallback";
	private String scope = "login inquiry transfer";
	private String auth_type = "0";
}

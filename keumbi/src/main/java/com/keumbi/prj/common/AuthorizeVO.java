package com.keumbi.prj.common;

import lombok.Data;

@Data
public class AuthorizeVO {
	private String client_id = "56623ec9-ff89-4e8d-b59b-3ab59a9f0b97";
	private String client_secret = "ca148e70-9156-4edd-bb51-a3fc6c9abb04";
	private String redirect_uri = "http://localhost/prj/bankCallback";
	private String scope = "login inquiry transfer";
	private String auth_type = "0";
}

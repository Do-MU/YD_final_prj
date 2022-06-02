package com.keumbi.prj.common.vo;

import lombok.Data;

@Data
public class PageVO {
	private int pageNo = 1;			// 현재 page
	private int totalPage;			// 총 페이지
	private int startPage = 1;		// 시작 페이지
	private int endPage = 10;		// 마지막 페이지
	private int pageScale = 10;		// 한 페이지에 보여질 수
	private int totalNo;			// 전체 수
	private String code;
}

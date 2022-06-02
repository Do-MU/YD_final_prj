package com.keumbi.prj.main.vo;

import lombok.Data;

@Data
public class MainVO {
	private double twenty; //20대 사용자수
	private double thirty; //30대 사용자수
	private double fourty; //40대 사용자수
	private double fifty; // 50대 사용자수
	private double over; // 60대이상
	private int cntfinance; // 금융상품 카운트
	private int cntcard; // 카드수 카운트
	private int cntchal; // 챌린지수 카운트
}

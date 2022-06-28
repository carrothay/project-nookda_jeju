package com.ch.nookdajeju.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Likes {
	private int lno;
	private int mno; 
	private int acmno;
	
	//숙소 불러오기용
	private String acm_name;
	private String acm_loc;
	// paging용
	private int startRow;
	private int endRow;
	// 지도 마커용
	private float latitude;
	private float longtitude;

}

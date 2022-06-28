package com.ch.nookdajeju.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Booking {
    private int bookno;
    private int mno;
    private int acmno;
    private String bookdate;
    private String checkin;
    private String checkout;
    private int guestcnt;
    private int bookprice;
    private String payby;
    private String request;
    private String bookstatus;
    
    // 날짜에 따라 예약 상태 변경 값을 구하기 위함
    private String bs;
    
    // 숙소상세페이지 달력에서 예약된 날짜를 막기 위함
    private String b_date;
    
    // 매출 관리 페이지
    private int income;
    
    // acm model
	private String acm_name;
	private String acm_loc;
	private String acm_addr;
	private String acm_phone;
	private String acm_checkin;
	private String acm_checkout;
	private String acm_email;
	private String acm_type;
	private String acm_content;
	private int acm_price;
	private int latitude;
	private int longtitude;
	private Date acm_regdate;
	private int acm_view;
	private String del;
	private int acm_capa;
	private String acm_bedtype;
	private String acm_size;
	
	// acm member;
    private String memail;
    private String mlastname;
    private String mfstname;
    private String mphone;
    private String nickname;
   
	//paging용
    private int startRow;
    private int endRow;
    
    //review check용
    private int rvno;
}
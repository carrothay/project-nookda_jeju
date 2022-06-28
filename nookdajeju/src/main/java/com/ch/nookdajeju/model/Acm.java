package com.ch.nookdajeju.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data 
public class Acm {
	private int acmno;
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
	private float latitude;
	private float longtitude;
	private Date acm_regdate;
	private int acm_view;
	private String del;
	private int mno;
	private int acm_capa;
	private String acm_bedtype;
	private String acm_size;
	//paging용
    private int startRow;
    private int endRow;
    // booking model
    private int bookno;
    private String bookdate;
    private String checkin;
    private String checkout;
    private Integer guestcnt;
    private int bookprice;
    private String payby;
    private String request;
    private String bookstatus;
    // 검색용
    private String search;
    private String keyword;
    //닉네임 불러오기
    private String nickname;
}

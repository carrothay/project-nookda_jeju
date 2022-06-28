package com.ch.nookdajeju.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Review {
	private int rvno;
	private int star_rate;
	private String rv_content;
	private String rv_regdate;
	private int acmno;
	private int mno;
	private int bookno;
	private String rvpic;
	private String del;
	
	//숙소이름 불러오기용
	private String acm_name;
	//닉네임 불러오기용
	private String nickname;
	// paging용
	private int startRow;
	private int endRow;
    // 업로드
    private MultipartFile file;
}
package com.ch.nookdajeju.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private int mno;
    private String memail;
    private String mpw;
    private String mlastname;
    private String mfstname;
    private String mphone;
    private String nickname;
    private String mhost; 
    private Date mregdate;
    private String del;
    // paging용
    private int startRow;
    private int endRow;
    // 검색용
    private String search;
    private String keyword;
	
}


package com.ch.nookdajeju.model;

import lombok.Data;

@Data
public class Faq {
	private int fno;
	private String fname;
	private String faq_content;
    private String del;
	//paging용
    private int startRow;
    private int endRow;
    // 검색용
    private String search;
    private String keyword;
}

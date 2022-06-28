package com.ch.nookdajeju.model;

import lombok.Data;

@Data
public class Askboard {
	private int askno;
	private int mno;
	private String askname;
	private String askcontent;
	private String ask_regdate;
	private int readcount;
	private String password;
	private int ref;
	private int re_step;
	private int re_level;
	private String del;
	private String secret;
	private String re_name;

	//닉네임 불러오기 용
	private String nickname;
}

package com.ch.nookdajeju.model;

import lombok.Data;

@Data
public class MessageModel {
	private int msgno; 
	private int mroom;
	private String send_nick;
	private String recv_nick;
	private String send_time;
	private String read_time;
	private String msg_text;
	private String read_chk;
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_nick;
	
	// 현재 사용자 nick
	private String nickname;
	
	// 안읽은 메세지 갯수 
	private int unread;
}

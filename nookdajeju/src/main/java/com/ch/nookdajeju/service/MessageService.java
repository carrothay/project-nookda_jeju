package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.MessageModel;

public interface MessageService {
	
	List<MessageModel> roomContentList(MessageModel to);
	int updateRead(MessageModel to);

	int messageSendInlist2(MessageModel to);

	MessageModel select(MessageModel to);
}

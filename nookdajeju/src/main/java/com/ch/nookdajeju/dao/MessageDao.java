package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.MessageModel;

public interface MessageDao {

	List<MessageModel> messageList(MessageModel to);

	List<MessageModel> roomContentList(MessageModel to);
	
	int updateRead(MessageModel to);

	int messageSendInlist2(MessageModel to);

	MessageModel select(MessageModel to);
}

package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.MessageDao;
import com.ch.nookdajeju.model.MessageModel;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao msd;
	@Override
	public int updateRead(MessageModel to) {
		return msd.updateRead(to);
	}
	@Override
	public List<MessageModel> roomContentList(MessageModel to) {
		return msd.roomContentList(to);
	}
	@Override
	public int messageSendInlist2(MessageModel to) {
		return msd.messageSendInlist2(to);
	}
	@Override //임시
	public MessageModel select(MessageModel to) {
		return msd.select(to);
	}
}

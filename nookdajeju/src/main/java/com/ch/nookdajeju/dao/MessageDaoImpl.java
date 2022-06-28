package com.ch.nookdajeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.MessageModel;

@Repository
public class MessageDaoImpl implements MessageDao {
	@Autowired
	private SqlSessionTemplate sst;
		@Override
		public List<MessageModel> messageList(MessageModel to) {
			String nickname = to.getNickname();
			// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 nick
			List<MessageModel> list = sst.selectList("messagens.message_list", to);
			for (MessageModel mto : list) {
				//리스트에 set 할 것들
				mto.setNickname(nickname);
				// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
				int unread = sst.selectOne("messagens.count_unread", mto);
				mto.setUnread(unread);
				// 메세지 상대 nick을 세팅한다. other_nick 현재 닉네임이 받는사람인지, 보낸사람인지
				if (nickname.equals(mto.getSend_nick())) {
					mto.setOther_nick(mto.getRecv_nick());
				} else {
					mto.setOther_nick(mto.getSend_nick());
				}
			}
			return list;
		}
		@Override
		public List<MessageModel> roomContentList(MessageModel to) {
			return sst.selectList("messagens.room_content_list", to);
		}
		@Override
		public int updateRead(MessageModel to) {
			return sst.update("messagens.message_read_chk", to);
		}
		@Override
		public int messageSendInlist2(MessageModel to) {
			// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
			if(to.getMroom() == 0) {	// room이 0이라면 프로필에서 보낸거다
				//int exist_chat = sst.selectOne("messagens.exist_chat", to);
				int exist_chat = sst.selectOne("messagens.exist_chat", to); 
			// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
				if (exist_chat == 0) { // 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
					 int max_room = sst.selectOne("messagens.max_room", to);
					//int max_room = msgs.maxRoom(to);
					to.setMroom(max_room + 1);
				} else { // 메세지 내역이 있다면 해당 room 번호를 가져온다.
					int thisroom = sst.selectOne("messagens.select_room", to);
					//int thisroom = msgs.selectRoom(to);
					to.setMroom(thisroom);
				}
			}
			return sst.insert("messagens.insert2",to);
		}
		//임시
		@Override
		public MessageModel select(MessageModel to) {
			return sst.selectOne("messagens.selectOne",to);
		}
}

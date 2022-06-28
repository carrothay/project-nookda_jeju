package com.ch.nookdajeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.nookdajeju.dao.MessageDao;
import com.ch.nookdajeju.model.Member;
import com.ch.nookdajeju.model.MessageModel;
import com.ch.nookdajeju.service.MemberService;
import com.ch.nookdajeju.service.MessageService;

@Controller
public class MessageController {
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private MemberService ms;
	@Autowired
	private MessageService msgs;
		// 메세지 목록
		@RequestMapping(value = "message_list")
		public String message_list(Model model, HttpSession session) {
			// 세션에서 회원 정보 가져오기
			String memail = (String)session.getAttribute("memail");
			Member member2 = ms.select(memail);
			String nickname = member2.getNickname();

			MessageModel to = new MessageModel();
			to.setNickname(nickname);
			
			// 메세지 리스트
			List<MessageModel> list = messageDao.messageList(to);
			
			model.addAttribute("list", list);
			return "message/message_list";
		}
		
		// 메세지 목록
		@RequestMapping(value = "message_ajax_list")
		public String message_ajax_list(Model model, HttpSession session) {
			// 세션에서 회원 정보 가져오기
			String memail = (String)session.getAttribute("memail");
			Member member2 = ms.select(memail);
			String nickname = member2.getNickname();
			
			MessageModel to = new MessageModel();
			to.setNickname(nickname);
			
			// 메세지 리스트
			List<MessageModel> list = messageDao.messageList(to);
		
			model.addAttribute("list", list);
			return "nolayout/message_ajax_list";
		}
		
		//메세지 내용
		@RequestMapping(value = "message_content_list")
		public String message_content_list(HttpServletRequest request, Model model, HttpSession session) {
			int mroom = Integer.parseInt(request.getParameter("room"));
			
			// 세션에서 회원 정보 가져오기
			String memail = (String)session.getAttribute("memail");
			Member member2 = ms.select(memail);
			String nickname = member2.getNickname();

			MessageModel to = new MessageModel();
			to.setMroom(mroom);
			to.setNickname(nickname);

			// 메세지 내용을 가져온다.
			List<MessageModel> clist = msgs.roomContentList(to);
			
			// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
			int result = msgs.updateRead(to);
			
			model.addAttribute("clist", clist);
			model.addAttribute("result", result);
			return "nolayout/message_content_list";
		}
		
		// 메세지 리스트에서 메세지 보내기
		@ResponseBody
		@RequestMapping(value = "message_send_inlist")
		public String message_send_inlist(
				@RequestParam(value="r",defaultValue="1") int room,
				@RequestParam String other_nick,
				@RequestParam String content, HttpSession session, Model model
				) {
			
			int result = 0;
			
			// 세션에서 회원 정보 가져오기
			String memail = (String)session.getAttribute("memail");
			Member member2 = ms.select(memail);
			String nickname = member2.getNickname();
			
//			MessageModel to2 = msgs.select(to);
//			int room = to2.getMroom();
			MessageModel to = new MessageModel();

			to.setSend_nick(nickname);
			to.setRecv_nick(other_nick);
			to.setMsg_text(content);
		
			result = msgs.messageSendInlist2(to);
			
			model.addAttribute("result",result);
			model.addAttribute("msgno",to.getMsgno());
			return "nolayout/message_content_list";
		}
		
		@RequestMapping("hostProfile")
		public String hostProfile(String nickname, Model model, HttpSession session) {
				Member host = ms.selectProfile(nickname);
				model.addAttribute("host", host);
			return "message/hostProfile";
		}
		
		// 프로필 내 메세지 목록 가져오기
		@RequestMapping(value = "message_content_list_inprofile")
		public String message_content_list_inprofile(HttpServletRequest request, Model model, HttpSession session) {
			
			String other_nick = request.getParameter("other_nick");

			MessageModel to = new MessageModel();
			to.setRecv_nick(other_nick); //받는사람 host1
			
			// 세션에서 회원 정보 가져오기
			String memail = (String)session.getAttribute("memail");
			Member member2 = ms.select(memail);
			String nickname = member2.getNickname();
			to.setNickname(nickname);
			
			// 메세지 내용을 가져온다.
			List<MessageModel> clist = msgs.roomContentList(to);
			
			model.addAttribute("clist", clist);
			model.addAttribute("nickname", member2.getNickname());
			return "nolayout/message_content_list";
		}
		

		// 프로필에서 메세지 보내기
		@ResponseBody
		@RequestMapping(value = "message_send_inlist_inprofile")
		public String message_send_inlist_inprofile(@RequestParam String other_nick, @RequestParam String content, Model model, HttpSession session) {
			
			int result = 0;
			// 세션에서 회원 정보 가져오기
			String memail = (String)session.getAttribute("memail");
			Member member2 = ms.select(memail);
			String nickname = member2.getNickname();
			
			MessageModel to = new MessageModel();
			to.setSend_nick(nickname);
			to.setRecv_nick(other_nick);
			to.setMsg_text(content);
			
			result = msgs.messageSendInlist2(to);
			
			model.addAttribute("result",result);
			model.addAttribute("msgno",to.getMsgno());
			
			return "nolayout/message_content_list";
			//return "message/message_result";
			}
}

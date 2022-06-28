package com.ch.nookdajeju.controller;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.nookdajeju.model.Member;
import com.ch.nookdajeju.service.MemberService;
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder bpPass;
	@Autowired
	private HttpSession session;
	@Autowired
	private JavaMailSender jMailSender;
	
	// 회원 가입 폼으로 이동
	@RequestMapping("joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	// 이메일 중복 체크
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody  // jsp를 통하지 않고 직접 문자를 전달해
	public String idChk1(String memail) {
		String msg = "";
		Member member = ms.select(memail);
		if (member == null) msg = "사용 가능한 이메일입니다";
		else msg = "사용 중인 이메일입니다";
		return msg;
	}

	// 회원 가입 로직
	@RequestMapping("joinAction")
	public String joinAction (Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		// form 에서 입력한 member데이터를 가져와서 member2 객체에 대입하여 아이디가 존재하는지 확인
		Member member2 = ms.select(member.getMemail());
		if (member2 == null) {
			String password = bpPass.encode(member.getMpw());
			member.setMpw(password);
			result = ms.insert(member);
		} else {
			result = -1; //이미 있는 데이터
		}
		model.addAttribute("result", result);

		return "member/joinAction";

	}
	
	// 로그인 폼으로 이동
	@RequestMapping("loginForm")
	public String loginForm (HttpServletRequest request, Model model) {
		return "member/loginForm";
	}
	
	// 로그인 로직
	@RequestMapping("loginAction")
	public String loginAction (Member member, Model model, HttpSession session, HttpServletRequest request) {
		int result = 0; // 암호가 다름
		Member member2 = ms.select(member.getMemail());
		
		String prevUrl = request.getParameter("prevUrl");
		prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring("http://localhost:8080/nookda/".length());
		
		if (member2 == null || member2.getDel().equals("y"))
			result = -1; // 없는 아이디
	
		  else if (member.getMpw().equals(member2.getMpw())) {
			  result = 1;
			  session.setAttribute("memail", member2.getMemail());
			  session.setAttribute("mhost", member2.getMhost());
			  session.setAttribute("mno", member2.getMno()); 
			  session.setAttribute("nickname", member2.getNickname());

		  }
		 
			// 비밀번호 암호화
		  else if (bpPass.matches(member.getMpw(), member2.getMpw())) {
				result = 1; // 성공 암호와 아이디가 일치
				session.setAttribute("memail", member2.getMemail());
				session.setAttribute("mhost", member2.getMhost());
				session.setAttribute("mno", member2.getMno());
				session.setAttribute("nickname", member2.getNickname());
			}
		model.addAttribute("result", result);
		model.addAttribute("prevUrl", prevUrl);
	
		return "member/loginAction";
	}
	
	// 로그아웃 로직
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
	
	// 아이디 찾기 폼으로 이동
	@RequestMapping("findFormId")
	public String findFormId() {
		return "member/findFormId";
	}
	
	// 아이디 찾기
	@RequestMapping("findIdAction")
	public String findIdAction(Member member, Model model) {
		int result = 0;
		Member member2 = ms.selectFindId(member);
		if (member2 != null) {
			result = 1;
			model.addAttribute("member", member2);
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		return "member/findIdAction";
	}
		
	// 비밀번호 찾기 폼으로 이동
	@RequestMapping("findFormPw")
	public String findPwForm(String memail, Model model) {
		// 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어가게 하기 위함
		model.addAttribute("memail", memail);
		return "member/findFormPw";
	}
		
	// 비밀번호 찾기
	@RequestMapping("findPwAction")
	public String findPwAction(Member member, Model model) {
		int result = 0;
		Member member2 = ms.selectFindPw(member);
		if (member2 != null) {
			String memail = member2.getMemail();
			result = ms.updatePw(memail);
			model.addAttribute("result", result);
			model.addAttribute("member", member2);
		} else {
			result = -1;
		}
		
		model.addAttribute("result", result);
		return "member/findPwAction";
	}

	// 닉네임 중복 체크
	@RequestMapping(value = "nickChk", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지말고 바로 본문으로 전달
	public String nickChk(String nickname) {
		String msg = "";
		
		Member member = ms.selectNick(nickname);
		if (member == null) msg = "사용 가능한 닉네임입니다.";
		else msg = "이미 사용중인 닉네임입니다.";
		return msg;
	}
	
}
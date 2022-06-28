package com.ch.nookdajeju.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.nookdajeju.model.Askboard;
import com.ch.nookdajeju.model.Member;
import com.ch.nookdajeju.service.AskboardService;
import com.ch.nookdajeju.service.MemberService;
import com.ch.nookdajeju.service.PageBean;

@Controller
public class AskboardController {
	@Autowired
	private AskboardService as;
	@Autowired
	private MemberService ms;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("askForm")
	public String askForm(int askno, Model model, HttpSession session) {
		String memail = (String) session.getAttribute("memail");
		Member member = ms.select(memail);
		
		int ref=0, re_level=0, re_step=0;
		String secret="";
		String re_name="";
		Askboard askboard = new Askboard();
		//답변글 시작
		if (memail.equals("admin")) {
			askboard = as.select(askno);// 읽은 글 정보 가져오기
			ref=askboard.getRef();
			re_level=askboard.getRe_level();
			re_step=askboard.getRe_step();
			secret=askboard.getSecret();
			re_name=askboard.getRe_name();
			model.addAttribute("re_name", re_name);
		}
		//답변글 끝
		
		askboard.setNickname(member.getNickname());
		
		model.addAttribute("askno", askno);
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		model.addAttribute("secret", secret);
		
		model.addAttribute("writer", askboard.getNickname());
		
		model.addAttribute("member", member);
		return "askboard/askForm";
	}
	
	@RequestMapping("askResult")
	public String askResult(Askboard askboard, String re_name, Model model, HttpSession session, HttpServletRequest request) {
		String memail = (String) session.getAttribute("memail");
		Member member = ms.select(memail);
		
		askboard.setRe_name(member.getNickname());
		// askno 자동으로 1씩 증가
		int number = as.maxNum();
		//답변글 용
		if (memail.equals("admin")) {
			// ref가 같고, re_step이 읽은 글보다 클 경우 > re_step+1
			as.updateRe_step(askboard);
			askboard.setRe_level(askboard.getRe_level()+1);
			askboard.setRe_step(askboard.getRe_step()+1);
			askboard.setPassword("1");
			askboard.setSecret(askboard.getSecret());
			askboard.setRe_name(re_name);
			// ref는 읽은 글의 ref를 그대로 사용!
			
		} else 
			askboard.setRef(number);
		askboard.setAskno(number);
		askboard.setMno(member.getMno());
		

		/* 현재시간 가져오기 */
		long systemTime = System.currentTimeMillis();
		SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd HH:mm", Locale.KOREA);
		String dTime = formatter.format(systemTime);
		askboard.setAsk_regdate(dTime);
		
		int result = as.insert(askboard);
		
		model.addAttribute("result", result);
		return "askboard/askResult";
	}
	
	@RequestMapping("askList")
	public String askList(String pageNum, Askboard askboard, Model model, HttpSession session) {
		String memail = (String) session.getAttribute("memail");
		Member member = ms.select(memail);
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotal(askboard);
		int rowPerPage = 10;
		int startRow = (currentPage -1) * rowPerPage +1;
		int endRow = startRow + rowPerPage -1;
		
		List<Askboard> list = as.list(startRow, endRow);
		int num = total-startRow + 1;
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		
		
/*		List<Integer> refs = new ArrayList();
		for (Askboard ab : list ) {
			refs.add(ab.getRef());
		}
*/		
		model.addAttribute("member", member);
		model.addAttribute("list", list);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("total", total);
		
		return "askboard/askList";
	}
	
	@RequestMapping("askView")
	public String askView (int askno, Model model, HttpSession session) {
		Askboard askboard = as.select(askno);
		Member member = ms.selectByMno(askboard.getMno());
		
		askboard.setNickname(member.getNickname());
		
		String memail = (String) session.getAttribute("memail");
		Member nowmem = ms.select(memail);
		as.updateReadCount(askno);
		model.addAttribute("nowmem", nowmem);
		model.addAttribute("askboard", askboard);
		model.addAttribute("member", member);
		return "askboard/askView";
	}
	
	@RequestMapping("askUpdate")
	public String askUpdate(int askno, Model model) {
		Askboard askboard = as.select(askno);
		Member member = ms.selectByMno(askboard.getMno());
		model.addAttribute("member", member);
		model.addAttribute("askboard", askboard);
		return "askboard/askUpdate";
	}
	
	@RequestMapping("askUpdateResult")
	public String askUpdateResult(Askboard askboard, Model model) {
		int result = as.update(askboard);
		model.addAttribute("result", result);
		model.addAttribute("askboard", askboard);
		return "askboard/askUpdateResult";
	}
	
	@RequestMapping("askDelete")
	public String askDelete(int askno, Model model) {
		int result = as.delete(askno);
		model.addAttribute("result", result);
		return "askboard/askDelete";
	}
}

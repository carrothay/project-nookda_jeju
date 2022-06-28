package com.ch.nookdajeju.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Member;
import com.ch.nookdajeju.service.AcmService;
import com.ch.nookdajeju.service.MemberService;
import com.ch.nookdajeju.service.PageBean;

@Controller
public class AdminController {
	@Autowired
	private MemberService ms;
	@Autowired
	private AcmService as;
	@Autowired
	private HttpSession session;

	// 관리자 메인으로 이동
	@RequestMapping("adminMain")
	public String adminMain(Member member, Model model, HttpSession session) {
		String memail = (String) session.getAttribute("memail");
		if (memail == "admin") {
			member = ms.select(memail);
			model.addAttribute("member", member);
		}
		return "admin/adminMain";
	}

	@RequestMapping("adminMainMenu")
	public String adminMainMenu(Model model, HttpSession session) {
		String memail = (String) session.getAttribute("memail");
		Member member = ms.select(memail);
		model.addAttribute("member", member);
		return "admin/adminMainMenu";
	}

	// 관리자 멤버 리스트 로직
	@RequestMapping("adminMemberList")
	public String adminMemberList(Member member, String pageNum, Model model) {
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보여주는 게시글 갯수
		int total = ms.getMbTotal(member);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		List<Member> mbList = ms.mbList(member); // 회원 목록
		int num = total - startRow + 1;
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		String[] title = { "이메일", "성", "이름", "닉네임", "휴대폰 번호", "가입일" };

		model.addAttribute("title", title);
		model.addAttribute("pb", pb); // paginbean pb
		model.addAttribute("mbList", mbList);
		model.addAttribute("num", num); // 목록 번호 생성 위한 num
		return "admin/adminMemberList";
	}

	// 관리자 호스트 리스트 로직
	@RequestMapping("adminHostList")
	public String adminHostList(Member member, String pageNum, Model model) {
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보여주는 게시글 갯수
		int total = ms.getHostTotal(member);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		List<Member> hostList = ms.hostList(member); // 회원 목록
		int num = total - startRow +1;
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		String[] title = { "이메일", "성", "이름", "휴대폰 번호", "승인 여부" };

		model.addAttribute("title", title);
		model.addAttribute("pb", pb); // paginbean pb
		model.addAttribute("hostList", hostList);
		model.addAttribute("num", num); // 목록 번호 생성 위한 num
		return "admin/adminHostList";
	}

	// 관리자 호스트 신청 리스트 로직
	@RequestMapping("adminRequestList")
	public String adminRequestList(Member member, String pageNum, Model model) {
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보여주는 게시글 갯수
		int total = ms.getRequestTotal(member);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		List<Member> requestList = ms.requestList(member); // 회원 목록
		int num = total - startRow +1;
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		String[] title = { "이메일", "성", "이름", "휴대폰 번호", "승인 여부" };

		model.addAttribute("title", title);
		model.addAttribute("pb", pb); // paginbean pb
		model.addAttribute("requestList", requestList);
		model.addAttribute("num", num); // 목록 번호 생성 위한 num
		return "admin/adminRequestList";
	}

	// 관리자 호스트 승인
	@RequestMapping("adminHostApproval")
	public String adminHostApproval(Member member, Model model, HttpSession session) {
		int result = 0;
		result = ms.hostPermit(member);
		model.addAttribute("result", result);
		return "admin/adminHostApproval";
	}

	// 관리자 호스트 삭제
	@RequestMapping("adminHostCancle")
	public String adminHostCancle(Member member, Model model, HttpSession session) {
		int result = 0;
		result = ms.hostReject(member);
		model.addAttribute("result", result);
		return "admin/adminHostCancle";
	}

	// 관리자 숙소 리스트 로직
	@RequestMapping("adminAcmList")
	public String adminAcmList(Acm acm, String pageNum, Model model) {
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10; // 한 화면에 보여주는 게시글 갯수
		int total = as.getAcmTotal(acm);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		acm.setStartRow(startRow);
		acm.setEndRow(endRow);
		List<Acm> adminAcmList = as.adminAcmList(acm); // 회원 목록
		int num = total - startRow + 1;
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		String[] title = { "숙소명", "주소", "대표 번호", "대표 이메일", "숙소 타입", "등록일" };

		model.addAttribute("title", title);
		model.addAttribute("pb", pb); // paginbean pb
		model.addAttribute("adminAcmList", adminAcmList);
		model.addAttribute("num", num); // 목록 번호 생성 위한 num
		return "admin/adminAcmList";
	}
	  
	  // 관리자 회원 삭제
	  @RequestMapping("adminMemberDel") 
	  public String adminMemberDel(String memail, String pageNum, Model model) { 
		  int result = ms.addelete(memail);
		  
		  Member member = ms.select(memail); 
		  int mno = member.getMno();
		  
		  model.addAttribute("result", result); 
		  model.addAttribute("pageNum", pageNum);
		  return "admin/adminMemberDel"; 
	  }
	  
	 // 관리자 숙소 삭제 
	@RequestMapping("adminAcmDel")
	public String adminAcmDel(Acm acm, String pageNum, Model model, HttpSession session) {
		int result = as.delete(acm);
		model.addAttribute("result", result);
		return "admin/adminAcmDel";
	}
	
	// 관리자 숙소 삭제 취소 
	@RequestMapping("adminAcmDelBack")
	public String adminAcmDelBack(Acm acm, String pageNum, Model model, HttpSession session) {
		int result = as.delCancel(acm);
		model.addAttribute("result", result);
		return "admin/adminAcmDelBack";
		}
	
	// 관리자 회원 삭제 취소 
	@RequestMapping("adminMemDelBack")
	public String adminMemDelBack(Member member, String pageNum, Model model, HttpSession session) {
		int result = ms.delCancel(member);
		model.addAttribute("result", result);
		return "admin/adminMemDelBack";
	}
}

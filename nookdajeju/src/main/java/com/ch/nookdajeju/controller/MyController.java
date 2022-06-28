package com.ch.nookdajeju.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.nookdajeju.model.Booking;
import com.ch.nookdajeju.model.Likes;
import com.ch.nookdajeju.model.Member;
import com.ch.nookdajeju.model.Review;
import com.ch.nookdajeju.service.BookingService;
import com.ch.nookdajeju.service.LikesService;
import com.ch.nookdajeju.service.MemberService;
import com.ch.nookdajeju.service.PageBean;
import com.ch.nookdajeju.service.ReviewService;
@Controller
@RequestMapping
public class MyController {
	@Autowired
	private MemberService ms;
	@Autowired
	private LikesService ls;
	@Autowired
	private ReviewService rvs;
	@Autowired
	private BookingService bs;
	@Autowired
	private BCryptPasswordEncoder bpPass;
	
	@RequestMapping("myMain")
	public String myMain(Member member, Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		if (memail != null && !memail.equals("")) {
			member = ms.select(memail);
			model.addAttribute("member", member);
		}
		return "mypage/myMain";
	}
	@RequestMapping("myMainMenu")
	public String myMainMenu(Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		Member member = ms.select(memail);
		model.addAttribute("member", member);
		return "mypage/myMainMenu";
	}
	@RequestMapping("myDelete")
	public String myDelete(Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		int result = ms.delete(memail);
		// 탈퇴한 사람은 현재 사이트를 사용하지 못하게 하기 위해
		if (result > 0) session.invalidate();
		model.addAttribute("result", result);
		return "mypage/myDelete";
	}
	@RequestMapping("myInfoUpdateForm")
	public String myInfoUpdateForm(Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		Member member = ms.select(memail);
		
		int adminchk = 0;
		if (member.getNickname().equals("admin")) {
			adminchk = 1;
		}else {
			adminchk = -1;
		}
		
		model.addAttribute("member", member);
		model.addAttribute("adminchk", adminchk);
		return "mypage/myInfoUpdateForm";
	}
	@RequestMapping("myInfoUpdateResult")
	public String myInfoUpdateResult(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		//암호화 설정 보류
		String encPassword = bpPass.encode(member.getMpw());
		member.setMpw(encPassword);
		result = ms.update(member);
		model.addAttribute("result", result);
		return "mypage/myInfoUpdateResult";
	}
	@RequestMapping("myHostRequest")
	public String myHostRequest(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		result = ms.hostrequest(member);
		model.addAttribute("result",result);
		return "mypage/myHostRequest";
	}
	@RequestMapping("myHostCancel")
	public String myHostCancel(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		result = ms.hostcancel(member);
		model.addAttribute("result",result);
		return "mypage/myHostCancel";
	}
	@RequestMapping("myLikesList")
	public String myLikesList(Likes likes, String pageNum, Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		int mno = (Integer)session.getAttribute("mno");
		likes.setMno(mno);
		
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int rowPerPage = 6;
		int currentPage = Integer.parseInt(pageNum);
		int total = ls.getmyLikes(memail);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		likes.setStartRow(startRow);
		likes.setEndRow(endRow);
		List<Likes> list = ls.list(likes);
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		model.addAttribute("num", num);
		model.addAttribute("pb", pb); //묶어서보내기
		model.addAttribute("list", list);
		model.addAttribute("total",total);
		return "mypage/myLikesList";
	}
	@RequestMapping("myReviewList")
	public String myReviewList(Review review, String pageNum, Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		int mno = (Integer)session.getAttribute("mno");
		review.setMno(mno);
	
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int rowPerPage = 3;
		int currentPage = Integer.parseInt(pageNum);
		int total = rvs.getmyRv(memail);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		List<Review> list = rvs.list(review);
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		model.addAttribute("num", num);
		model.addAttribute("pb", pb); //묶어서보내기
		model.addAttribute("list", list);
		model.addAttribute("rvno", review.getRvno());
		return "mypage/myReviewList";
	}
	@RequestMapping("myReviewDelete")
	public String myReviewDelete(Review review, String pageNum, Model model, HttpSession session) {
		int rvno = review.getRvno();
		int result = rvs.delete(rvno);
		model.addAttribute("result", result);
		return "mypage/myReviewDelete";
	}
	@RequestMapping("myReviewUpdateForm")
	public String myReviewUpdateForm(int rvno, Model model, HttpSession session) {
		Review review = rvs.selectRvno(rvno);
		model.addAttribute("review", review);
		return "mypage/myReviewUpdateForm";
	}
	@RequestMapping("myReviewUpdateResult")
	public String myReviewUpdateResult(Review review, Model model, HttpSession session)
			throws IOException{
		int result = 0;
		
		//파일 저장 로직
		//fileName에는 null(현재 사진 그대로 사용)일수도 있고 값(사진 변경)이 넘어올 수도 있다
		String fileName = review.getFile().getOriginalFilename();
		if(fileName != null && ! fileName.contentEquals("")) {//값이 있을 때만 처리
			review.setRvpic(fileName);
			String real = session.getServletContext().getRealPath("/resources/rvpic");
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(review.getFile().getBytes());
			fos.close();
		}
		
		result = rvs.update(review);
	
		model.addAttribute("result", result);
		return "mypage/myReviewUpdateResult";
	}
	@RequestMapping("myBookingList")
	public String myBookingList(Booking booking, String pageNum, Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		int mno = (Integer)session.getAttribute("mno");
		booking.setMno(mno);
		
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int rowPerPage = 3;
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getmyBookings(memail);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		booking.setStartRow(startRow);
		booking.setEndRow(endRow);
		List<Booking> list = bs.myBookingList(booking);
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		
		model.addAttribute("num", num);
		model.addAttribute("pb", pb); //묶어서보내기
		model.addAttribute("list", list);
		model.addAttribute("total",total);
		return "mypage/myBookingList";
	}
	@RequestMapping("myBookingDelete")
	public String myBookingDelete(Booking booking, String pageNum, Model model, HttpSession session) {
		int bookno = booking.getBookno();
		int result = bs.myBookDelete(bookno);
		model.addAttribute("result", result);
		return "mypage/myBookingDelete";
	}
	@RequestMapping("myHistoryList")
	public String myHistoryList(Booking booking, 
			String pageNum, Model model, HttpSession session) {
		String memail = (String)session.getAttribute("memail");
		int mno = (Integer)session.getAttribute("mno");
		booking.setMno(mno);
		
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int rowPerPage = 3;
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getmyHistory(memail);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		booking.setStartRow(startRow);
		booking.setEndRow(endRow);
		List<Booking> list = bs.myHistoryList(booking);
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		
		model.addAttribute("num", num);
		model.addAttribute("pb", pb); //묶어서보내기
		model.addAttribute("list", list);
		model.addAttribute("total",total);
		return "mypage/myHistoryList";
	}
	
}

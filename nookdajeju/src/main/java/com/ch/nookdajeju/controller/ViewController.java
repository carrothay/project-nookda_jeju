package com.ch.nookdajeju.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Acmpic;
import com.ch.nookdajeju.model.Booking;
import com.ch.nookdajeju.model.Likes;
import com.ch.nookdajeju.model.Member;
import com.ch.nookdajeju.model.Review;
import com.ch.nookdajeju.service.AcmService;
import com.ch.nookdajeju.service.AcmpicService;
import com.ch.nookdajeju.service.BookingService;
import com.ch.nookdajeju.service.LikesService;
import com.ch.nookdajeju.service.MemberService;
import com.ch.nookdajeju.service.PageBean;
import com.ch.nookdajeju.service.ReviewService;

@Controller
public class ViewController {
	@Autowired
	private AcmService as;
	@Autowired
	private AcmpicService aps;
	@Autowired
	private LikesService ls;
	@Autowired
	private MemberService ms;
	@Autowired
	private BookingService bs;
	@Autowired
	private ReviewService rvs;
	@Autowired
	private HttpSession session;
	@RequestMapping("acmView")
	public String acmView(Acm acm, String checkin, String checkout, Integer guestcnt, Likes likes, Review review, String pageNum, Model model, HttpSession session) {
		Acm acm2 = as.select(acm);
		List<Acmpic> acmpicList = aps.acmpicList(acm);
		
		acm.setCheckin(checkin);
		acm.setCheckout(checkout);
		acm.setGuestcnt(guestcnt);
		
		model.addAttribute("guestcnt", guestcnt);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		
		if (session.getAttribute("memail") != null ) {
			// 세션에서 회원 정보 가져오기
			String memail = (String)session.getAttribute("memail");
			Member member = ms.select(memail);
			// 좋아요 했는지 확인
			String result = "";
			likes.setAcmno(acm2.getAcmno());
			likes.setMno(member.getMno());
			Likes likes2 = ls.select(likes);
			if (likes2 == null ) {
				result="n";
			} else result="y";
			model.addAttribute("result", result);
			model.addAttribute("memail", memail);
		}
			
		/* 호스트 프로필 hy */
		int hostno = acm2.getMno();
		String hostnick = as.getHostNick(hostno);
		acm2.setNickname(hostnick);
		
		if (session.getAttribute("memail") != null ) {
		// 세션에서 회원 정보 가져오기
		String memail = (String)session.getAttribute("memail");
		Member member2 = ms.select(memail);
		//이 세션의 닉네임
		String nickname2 = member2.getNickname();
		
		int hostchk = 0;
		if(nickname2.equals(hostnick)) {
			hostchk = 1;
		}else {
			hostchk = -1;
		}
		model.addAttribute("hostchk", hostchk);}
		/* 호스트 프로필 끝  */
		
		/* 리뷰용 hy */
		//숙소정보받기
		Acm acm3 = as.selectforrv(acm2.getAcmno());
		
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int rowPerPage = 5;
		int currentPage = Integer.parseInt(pageNum);
		int total = rvs.gettotalRv(acm2.getAcmno());
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;		
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		
		List<Review> list = rvs.rvlist(review);
		
		//평균 별점
		float star_rate = 0;
		if(list.size() == 0) {
			star_rate = 0;
		}else {
			star_rate = (float)rvs.selectStar(acm2.getAcmno());
		}
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		model.addAttribute("num", num);
		model.addAttribute("pb", pb); //묶어서보내기
		model.addAttribute("list", list);
		model.addAttribute("star_rate", star_rate);
		model.addAttribute("acm",acm3);
		model.addAttribute("total",total);
		/* 리뷰용 끝 */
		
		/* 조회수 카운트 */
		as.updateReadCount(acm2.getAcmno());	
		
		model.addAttribute("aplist",acmpicList);
		model.addAttribute("acm2", acm2);
		return "acm/acmView";
	}
	@RequestMapping("acmLikeUnlike")
	@ResponseBody
	public String acmLikesUnLike(Acm acm, String name, Likes likes, Model model, HttpSession session) {
		Acm acm2 = as.select(acm);
		String memail = (String)session.getAttribute("memail");
		Member member = ms.select(memail);
		likes.setAcmno(acm2.getAcmno());
		likes.setMno(member.getMno());
		String result = "";
		
		if ( name.equals("like")  ) { 
			ls.insert(likes);
			result = "1";
		} else {
			ls.delete(likes);
			result = "0";
		}
		model.addAttribute("result", result);
		return result;
	}
	
	@RequestMapping("bookingForm") 
	public String bookingForm(Acm acm, String checkin, String checkout, Integer guestcnt, Model model, HttpSession session) {
		Acm acm1 = as.select(acm);

		if (checkin == null ) {
			checkin = "1";
		}
		acm.setCheckin(checkin);
		acm.setCheckout(checkout);
		acm.setGuestcnt(guestcnt);
		
		model.addAttribute("guestcnt", guestcnt);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		
		List<Booking> bookedList = bs.booked(acm1);
		ArrayList<Booking> bList = new ArrayList<Booking>();
		for (Booking booking : bookedList) {
			List<Booking> bookeddates = bs.bookeddate(booking);
			bList.addAll(bookeddates);
		}
		model.addAttribute("bList", bList);
		
		String memail = (String) session.getAttribute("memail");
		Member member1= ms.select(memail);
		model.addAttribute("acm", acm1);
		model.addAttribute("member", member1);
		return "acm/bookingForm"; 
	}
	  
	@RequestMapping("bookingResult")
	public String bookingAction(Acm acm, Booking booking, Model model) { 
		int result= bs.insert(booking);
		int acmno = acm.getAcmno();
		Booking booking1 = bs.select(booking);
		String memail = (String) session.getAttribute("memail");
		Member member= ms.select(memail);
		model.addAttribute("member", member);
		
		model.addAttribute("booking", booking1);
		model.addAttribute("acmno", acmno);
		model.addAttribute("result", result);
		return "acm/bookingResult"; 
	}
	
	/*리뷰페이지 병합 전*/
//	@RequestMapping("acmReview")
//	public String acmReview(Review review, Acm acm, String pageNum, Model model) {
//		//숙소정보받기
//		Acm acm2 = as.select(acm);
//		Acm acm3 = as.selectforrv(acm2.getAcmno());
//		
//		if (pageNum == null || pageNum.equals("")) pageNum = "1";
//		int rowPerPage = 8;
//		int currentPage = Integer.parseInt(pageNum);
//		int total = rvs.gettotalRv(acm3.getAcmno());
//		int startRow = (currentPage - 1) * rowPerPage + 1;
//		int endRow = startRow + rowPerPage - 1;		
//		review.setStartRow(startRow);
//		review.setEndRow(endRow);
//		
//		List<Review> list = rvs.rvlist(review);
//		
//		//평균 별점
//		float star_rate = 0;
//		if(list.size() == 0) {
//			star_rate = 0;
//		}else {
//			star_rate = (float)rvs.selectStar(acm3.getAcmno());
//		}
//		
//		PageBean pb = new PageBean(currentPage, rowPerPage, total);
//		int num = total - startRow + 1;
//		model.addAttribute("num", num);
//		model.addAttribute("pb", pb); //묶어서보내기
//		model.addAttribute("list", list);
//		model.addAttribute("star_rate", star_rate);
//		model.addAttribute("acm2",acm2);
//		model.addAttribute("acm",acm3);
//		model.addAttribute("total",total);
//		     //System.out.println("list출력테스트"+list);
//		return "acm/acmReview";
//	}

	@RequestMapping("reviewWriteForm")
	public String reviewWriteForm(Booking booking,
			Acm acm, Model model, HttpSession session) {
		Acm acmrv = as.select(acm);
		Booking bookingrv = bs.select(booking);
		//model.addAttribute("acm",acm); //필요한가 몰라서 일단킵
		String memail = (String)session.getAttribute("memail");
		Member member = ms.select(memail);
		model.addAttribute("member", member);
		model.addAttribute("mno",member.getMno());
		model.addAttribute("acmno", acmrv.getAcmno());
		model.addAttribute("bookno", bookingrv.getBookno());
		return "acm/reviewWriteForm";
	}
	
	@RequestMapping("reviewWriteResult")
	public String reviewWriteResult(Booking booking, Acm acm,
			Review review, Model model, HttpSession session) throws IOException{
		int result = 0;
		//닉네임출력을 위해 mno 받기
				String memail = (String)session.getAttribute("memail");
				Member memrvR = ms.select(memail);
				int mno = ms.selectMno(memail);
				review.setMno(mno);
		//acm정보 받기
				Acm acmrvR = as.select(acm);
		//파일 저장 로직
				String fileName = review.getFile().getOriginalFilename();
				review.setRvpic(fileName);

		// 파일이름이 겹치지 않게 하기 위함 (일단 킵)
		/*
		String fileName1 = review.getFile().getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "_" + fileName1;*/
		
		// 파일을 리소스 rvpic 폴더에 저장
				if(fileName != null && ! fileName.contentEquals("")) {//값이 있을 때만 처리
					review.setRvpic(fileName);
					String real = session.getServletContext().getRealPath("/resources/rvpic");
					FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
					fos.write(review.getFile().getBytes());
					fos.close();
				}

		// bookno를 받아서 중복된 '리뷰'가 있는지 확인할것
		int bookno2 = booking.getBookno();
		Review review2 = rvs.select(bookno2);
		
		if( review2 == null ) {
		review.setBookno(bookno2);
		result=rvs.insert(review);

		} else {
			result = -1; //이미 있는 데이터
		}
		
		model.addAttribute("mno",memrvR.getMno());
		model.addAttribute("acmno", acmrvR.getAcmno());
		model.addAttribute("result",result);
		model.addAttribute("bookno2", bookno2);
		return "acm/reviewWriteResult";
	}
}

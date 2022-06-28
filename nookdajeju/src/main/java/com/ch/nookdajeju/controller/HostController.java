package com.ch.nookdajeju.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Acmpic;
import com.ch.nookdajeju.model.Booking;
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
public class HostController {
	@Autowired
	private AcmService as;
	@Autowired
	private AcmpicService aps;
	@Autowired
	private BookingService bs;
	@Autowired
	private LikesService ls;
	@Autowired
	private MemberService ms;
	@Autowired
	private ReviewService rs;

	@Autowired
	private BCryptPasswordEncoder bpPass;
	@Autowired
	private HttpSession session;
	

	@RequestMapping("main")
	public String main(Acm acm, HttpSession session, Model model) {
		List<Acm> acmList = as.pList(acm); // 숙소 인기리스트(top6)
		model.addAttribute("acmList", acmList);
		return "main/main";
	}
	
	//메인검색결과
	@RequestMapping("mainResult")
	public String mainResult(String acm_loc, String checkin, String checkout, int guestcnt, Acm acm, HttpSession session, Model model) {
		int acmno = 1;
		acm.setAcmno(acmno);
		List<Acm> searchList = as.searchList(acm);
		model.addAttribute("searchList", searchList);
		model.addAttribute("acm_loc",acm_loc);
		model.addAttribute("checkin",checkin);
		model.addAttribute("checkout",checkout);
		model.addAttribute("guestcnt",guestcnt);
		return "main/mainResult";
	}
	
	@RequestMapping("hostMain")
	public String hostMain(Acm acm, HttpSession session, Model model) {
		return "hostPage/hostMain";
	}
	
	@RequestMapping("hostAcmList")
	public String hostAcmList(Acm acm, String pageNum, HttpSession session, Model model) {
		int mno = (Integer) session.getAttribute("mno");
		acm.setMno(mno);
		//페이징
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total  = as.getTotal(mno);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		acm.setStartRow(startRow);
		acm.setEndRow(endRow);
		// 해당 host가 등록한 숙소 리스트 불러오기
		List<Acm> acmList = as.hostList(acm);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow+1;
		
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("acmList", acmList);
		model.addAttribute("total", total);
		return "hostPage/hostAcmList";
	}
	
	
	@RequestMapping("hostAcmRegForm")
	public String hostAcmRegForm(){
		return "hostPage/hostAcmRegForm";
	}
	
	@RequestMapping("hostSalesManagement")
	public String hostSalesManagement(Acm acm, Booking booking, HttpSession session, Model model) {
		int mno = (Integer) session.getAttribute("mno");
		acm.setMno(mno);
		List<Acm> acmList = as.hostAcmList(mno); // 호스트가 등록한 모든 숙소. -> 를 foreach 돌려서 월별 incomeList를 구해야함.
		ArrayList<Booking> list = new ArrayList<Booking>();
		for (Acm am : acmList) {
	 		int acmno = am.getAcmno();
			List<Booking> incomeList = bs.incomeList(acmno); // 월별 매출 조회
			list.addAll(incomeList);
	 	}
 	 	model.addAttribute("list", list);
		model.addAttribute("acmList", acmList);
		return "hostPage/hostSalesManagement";
	}
	
	@RequestMapping("hostAcmRegResult")
	public String hostAcmRegResult(Acm acm, Acmpic acmpic, MultipartHttpServletRequest mhr,
			HttpSession session, Model model) throws IOException {
		List<MultipartFile> fileList = mhr.getFiles("file");
		List<String> list = new ArrayList<String>();
		int result=0;
		int maxAcmno = as.max();
		int i = 0;
		for (MultipartFile mf : fileList) {
			String fileName2 = i + ".jpg";
			list.add(fileName2);
			int result_acm = 0;
			int result_ap = 0;
			if (i == 0){
				String real = session.getServletContext().getRealPath("/resources/acmpic"); 
				String newPath = real + "\\" + (maxAcmno+1) ; 
				File fileCheck = new File(newPath);
				if(!fileCheck.exists()) fileCheck.mkdirs();
				FileOutputStream fos = new FileOutputStream(new File(newPath+"/"+fileName2));
				fos.write(mf.getBytes());
				fos.close();
				// acm insert
				int mno = (Integer) session.getAttribute("mno");
				acm.setMno(mno);
				result_acm = as.insert(acm);
				// acmpic insert
				acmpic.setAcmno(maxAcmno+1);
				acmpic.setAcm_picname(fileName2);
				acmpic.setAcm_picurl("/"+"acmpic"+"/"+(maxAcmno+1));
				result_ap = aps.insertap(acmpic);
				i++;
			} else if (i > 0){
				String real = session.getServletContext().getRealPath("/resources/acmpic"); 
				String newPath = real + "\\" + (maxAcmno+1) ; 
				FileOutputStream fos = new FileOutputStream(new File(newPath+"/"+fileName2));
				fos.write(mf.getBytes());
				fos.close();
				// acmpic insert
				acmpic.setAcmno(maxAcmno+1);
				acmpic.setAcm_picname(fileName2);
				acmpic.setAcm_picurl("/"+"acmpic"+"/"+(maxAcmno+1));
				result_ap = aps.insertap(acmpic);
				i++;
			}
		}
		if (i == fileList.size()){
			result = 1;
			model.addAttribute("result", result);
		} else {
			result = 0;
			model.addAttribute("result", result);
		}
			// 업로드 오류 시 등록된 애들 삭제 구현 필요... 
		return "hostPage/hostAcmRegResult";
	}
	
	@RequestMapping("hostAcmUpdateForm")
	public String hostAcmUpdateForm(Acm acm, Acmpic acmpic, Model model , HttpSession session) {
		Acm acm2 = as.select(acm);
		List<Acmpic> acmpicList = aps.acmpicList(acm);
		model.addAttribute("aplist",acmpicList);
		model.addAttribute("acm", acm2);
		return "hostPage/hostAcmUpdateForm";
	}
	
	@RequestMapping("hostAcmUpdateResult")
	public String hostAcmUpdateResult(Acm acm, Acmpic acmpic, MultipartHttpServletRequest mhr,
			HttpSession session, Model model) throws IOException {
		int acmno = acm.getAcmno();
			List<MultipartFile> fileList = mhr.getFiles("file");
			// List<String> list = new ArrayList<String>();
			List<Acmpic> acmpicList = aps.acmpicList(acm);
			String parentPath = "";
			int result=0;
			int i=0;
			for (MultipartFile mf : fileList) {
				String fileName2 = i + ".jpg";
				// list.add(fileName2);
				int result_acm = 0;
				int result_ap = 0;
				parentPath = "";
				if (i == 0){
				//사진부터 지우고 관련 acmpic 지우기.  
					for (Acmpic aplist : acmpicList) {
						int d_result = aps.deleteUp(acmno);  // db 진짜 삭제
						String real = session.getServletContext().getRealPath("/resources/acmpic"); // acmpic폴더 패쓰
						parentPath = real +"\\"+ acmno; // 사진폴더 패쓰
						String childPath = parentPath + "/" + aplist.getAcm_picname(); // 사진 패쓰
						File f = new File(childPath);
						if (! f.isDirectory()){
							f.delete(); // 폴더가 아니라면 지워~
						} else { 
						};
					}
					// File fileCheck = new File(parentPath); //이건 폴더만드는거 아닌가? nono 파일은 참조한다는건데 필요한가? 
					FileOutputStream fos = new FileOutputStream(new File(parentPath+"/"+fileName2));
					fos.write(mf.getBytes());
					fos.close();
					// acm update
					int result_acm_up = as.update(acm);
					// acmpic insert
					acmpic.setAcmno(acmno);
					acmpic.setAcm_picname(fileName2);
					acmpic.setAcm_picurl("/"+"acmpic"+"/"+acmno);
					result_ap = aps.insertap(acmpic);
					i++;
				} else if (i > 0){
					String real = session.getServletContext().getRealPath("/resources/acmpic"); 
					String newPath = real + "\\" + acmno ; 
					FileOutputStream fos = new FileOutputStream(new File(newPath+"/"+fileName2));
					fos.write(mf.getBytes());
					fos.close();
					// acmpic insert
					acmpic.setAcmno(acmno);
					acmpic.setAcm_picname(fileName2);
					acmpic.setAcm_picurl("/"+"acmpic"+"/"+acmno);
					result_ap = aps.insertap(acmpic);
					i++;
				}
			}
			if (i == fileList.size()){
				result = 1;
				model.addAttribute("result", result);
			} else {
				result = 0;
				model.addAttribute("result", result);
			}
		
		return "hostPage/hostAcmUpdateResult";
	}
	
	@RequestMapping("hostAcmDelete")
	public String hostAcmDelete(Acm acm, String pageNum, Model model, HttpSession session) {
		int result = as.delete(acm);
		model.addAttribute("result", result);
		return "hostPage/hostAcmDelete";
	}
	
	@RequestMapping("hostBookingDelete")
	public String hostBookingDelete(Booking booking, Model model, HttpSession session) {
		int result = bs.hostDelete(booking);
		model.addAttribute("result", result);
		return "hostPage/hostBookingDelete";
	}
	
	@RequestMapping("hostBookingList")
	public String hostBookingList(Acm acm, Booking booking, String pageNum, HttpSession session, Model model) {
		// 세션mno로 등록한 acm전체리스트 뽑고 페이징
		int mno = (Integer) session.getAttribute("mno");
		acm.setMno(mno);
		
		//페이징
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total  = as.getTotal(mno);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		acm.setStartRow(startRow);
		acm.setEndRow(endRow);
		
		// 해당 host가 등록한 숙소 리스트 불러오기(페이징있음)
		List<Acm> acmList = as.hostList(acm);
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow+1;
		
		model.addAttribute("acmList", acmList);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("total", total);
		
		
		//페이징없음
		List<Acm> acmList1 = as.hostAcmList(mno);
		List<Booking> bookingList4 = bs.list4(acm);
		List<Booking> bookingList3 = bs.list3(acm);
		List<Booking> bookingList2 = bs.list2(acm);
		List<Booking> bookingList1 = bs.list1(acm);
		
		model.addAttribute("acmList1", acmList1);
		model.addAttribute("bookingList4", bookingList4);
		model.addAttribute("bookingList1", bookingList1);
		model.addAttribute("bookingList2", bookingList2);
		model.addAttribute("bookingList3", bookingList3);
		return "hostPage/hostBookingList";
	}
		
	@RequestMapping("hostReviewList")
	public String hostReviewList(Acm acm, Member member, Review review, String pageNum, HttpSession session, Model model) {
		int mno = (Integer) session.getAttribute("mno");
		acm.setMno(mno);
		//페이징
		if(pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total  = as.getTotal(mno);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		acm.setStartRow(startRow);
		acm.setEndRow(endRow);
		// 해당 host가 등록한 숙소 리스트 불러오기(페이징x)
		List<Acm> acmList = as.hostAcmList(mno);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow+1;
		model.addAttribute("acmList", acmList);
		model.addAttribute("num", num);
		model.addAttribute("pb", pb);
		model.addAttribute("total", total);
		List<Review> reviewList = rs.hostRvList(mno);
		model.addAttribute("reviewList", reviewList);
		return "hostPage/hostReviewList";
	}
	
	//지도결과
		@RequestMapping("mapResult")
		public String mapResult(String acm_loc, Acm acm, HttpSession session, Model model) {
			acm.setAcm_loc(acm_loc);
			List<Acm> mapSearchList = as.mapSearchList(acm);
			model.addAttribute("mapSearchList",mapSearchList);
			model.addAttribute("acm_loc",acm_loc);
			return "main/mapResult";
		}
		
	
}
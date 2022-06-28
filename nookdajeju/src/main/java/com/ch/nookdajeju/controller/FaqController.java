package com.ch.nookdajeju.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.nookdajeju.model.Faq;
import com.ch.nookdajeju.service.FaqService;
import com.ch.nookdajeju.service.PageBean;

@Controller
public class FaqController {
	@Autowired
	private HttpSession session;
	@Autowired
	private FaqService fs;
	
	// faq 리스트 로직
		@RequestMapping("faqList")
		public String faqList(Faq faq, String pageNum, Model model) {
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int rowPerPage = 10; // 한 화면에 보여주는 게시글 갯수
			int total = fs.getfaqTotal(faq);
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			faq.setStartRow(startRow);
			faq.setEndRow(endRow);
			List<Faq> faqList = fs.faqList(faq); // 목록
			int num = total - startRow + 1;
			PageBean pb = new PageBean(currentPage, rowPerPage, total);
			String[] title = { "제목", "내용"};

			model.addAttribute("title", title);
			model.addAttribute("pb", pb); // paginbean pb
			model.addAttribute("faqList", faqList);
			model.addAttribute("num", num); // 목록 번호 생성 위한 num
			return "faq/faqList";
		}
		
		@RequestMapping("faqWriteForm")
		public String insertForm(int fno, Model model) {
			
			model.addAttribute("fno", fno);

			return "faq/faqWriteForm";
		}
		
		@RequestMapping("faqWriteResult")
		public String faqWriteForm(Faq faq, Model model, HttpSession session) {
			int number = fs.getMaxNum();
			faq.setFno(number);
			int result = fs.insert(faq);
			
			model.addAttribute("result", result);
			
			return "faq/faqWriteResult";
		}
		
		@RequestMapping("faqUpdateForm")
		public String faqUpdateForm(int fno, Model model, HttpSession session) {
			Faq faq = fs.select(fno);
			model.addAttribute("faq", faq);
			return "faq/faqUpdateForm";
		}
		
		@RequestMapping("faqUpdateResult")
		public String faqUpdateResult(Faq faq, Model model) throws IOException {
			int result = fs.update(faq);
			model.addAttribute("result", result);
			return "faq/faqUpdateResult";
		}
		
		// 관리자 질문 삭제		  
		@RequestMapping("faqDelete")
		public String faqDelete(Faq faq, String pageNum, Model model, HttpSession session) {
			int result = fs.delete(faq);
			model.addAttribute("result", result);
			model.addAttribute("pageNum", pageNum);
			return "faq/faqDelete";
		}

}

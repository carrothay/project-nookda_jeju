package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.Faq;
import com.ch.nookdajeju.model.Member;

public interface FaqService {


	List<Faq> faqList(Faq faq); // faq 리스트
	
	int getfaqTotal(Faq faq);

	int delete(Faq faq);

	Faq select(int fno);

	int update(Faq faq);
	
	int getMaxNum();

	int insert(Faq faq);

}

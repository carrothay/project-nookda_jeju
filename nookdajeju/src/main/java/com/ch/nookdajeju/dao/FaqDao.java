package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.Faq;
import com.ch.nookdajeju.model.Review;

public interface FaqDao {
	int getfaqTotal(Faq faq); // faq 총 수

	List<Faq> faqList(Faq faq); // faq 리스트

	int delete(Faq faq);

	Faq select(int fno);

	int update(Faq faq);

	int getMaxNum();

	int insert(Faq faq);
	
	/*
	 * int insert(Faq faq);
	 * 
	 * int update(Faq faq);
	 * 
	 * int delete(int fno);
	 */
}

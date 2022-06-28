package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.FaqDao;
import com.ch.nookdajeju.model.Faq;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao fd;
	
	@Override
	public int getfaqTotal(Faq faq) {
		return fd.getfaqTotal(faq); // faq 총 수
	}

	@Override
	public List<Faq> faqList(Faq faq) {
		return fd.faqList(faq); // faq 리스트
	}

	@Override
	public int delete(Faq faq) {
		return fd.delete(faq);
	}

	@Override
	public Faq select(int fno) {
		return fd.select(fno);
	}

	@Override
	public int update(Faq faq) {
		return fd.update(faq);
	}

	@Override
	public int getMaxNum() {
		return fd.getMaxNum();
	}

	@Override
	public int insert(Faq faq) {
		return fd.insert(faq);
	}
	
}

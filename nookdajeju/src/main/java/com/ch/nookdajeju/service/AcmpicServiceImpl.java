package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.AcmpicDao;
import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Acmpic;

@Service
public class AcmpicServiceImpl implements AcmpicService{
	@Autowired
	private AcmpicDao apd;

	public int insertap(Acmpic acmpic) {
		return apd.insertap(acmpic);
	}
	
	public List<Acmpic> acmpicList(Acm acm) {
		return apd.acmpicList(acm);
	}

	@Override
	public List<Acmpic> apHostAUp(int acmno) {
		return apd.apHostAUp(acmno);
	}

	@Override
	public int deleteUp(int acmno) {
		return apd.deleteUp(acmno);
	}
	
}

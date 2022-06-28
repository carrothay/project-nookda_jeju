package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Acmpic;

public interface AcmpicService {

	int insertap(Acmpic acmpic);	
	
	List<Acmpic> acmpicList(Acm acm);

	List<Acmpic> apHostAUp(int acmno);

	int deleteUp(int acmno);

}

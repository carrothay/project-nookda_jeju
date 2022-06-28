package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Acmpic;

public interface AcmpicDao {

	int insertap(Acmpic acmpic);
	List<Acmpic> acmpicList(Acm acm);
	List<Acmpic> apHostAUp(int acmno);
	int deleteUp(int acmno);

}

package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.Booking;
import com.ch.nookdajeju.model.Review;

public interface ReviewService {
	
	int getmyRv(String memail);

	List<Review> list(Review review); //마이
	
	int gettotalRv(int acmno);
	
	List<Review> rvlist(Review review); //전체
	
	int delete(int rvno);
	
	float selectStar(int acmno);
	
	Review selectRvno(int rvno);
	
	int update(Review review);
	
	int insert(Review review);
	
	List<Review> hostRvList(int mno); //호스트

	Review select(int bookno2);
	

}

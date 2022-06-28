package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.Review;

public interface ReviewDao {

	int getmyRv(String memail);
	
	List<Review> list(Review review);
	
	int getTotalrv(int acmno);
	
	List<Review> rvlist(Review review);
	
	int delete(int rvno);
	
	float selectStar(int acmno);
	
	Review selectRvno(int rvno);
	
	int update(Review review);
	
	int insert(Review review);
	
	List<Review> hostRvList(int mno);

	Review select(int bookno2);

}

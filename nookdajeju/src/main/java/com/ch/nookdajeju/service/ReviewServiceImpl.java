package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.ReviewDao;
import com.ch.nookdajeju.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao rvd;

	public int getmyRv(String memail) {
		return rvd.getmyRv(memail);
	}

	public List<Review> list(Review review) {
		return rvd.list(review);
	}

	public int gettotalRv(int acmno) {
		return rvd.getTotalrv(acmno);
	}

	public List<Review> rvlist(Review review) {
		return rvd.rvlist(review);
	}

	public int delete(int rvno) {
		return rvd.delete(rvno);
	}

	public float selectStar(int acmno) {
		return rvd.selectStar(acmno);
	}

	public Review selectRvno(int rvno) {
		return rvd.selectRvno(rvno);
	}

	public int update(Review review) {
		return rvd.update(review);
	}

	public int insert(Review review) {
		return rvd.insert(review);
	}

	public List<Review> hostRvList(int mno) {
		return rvd.hostRvList(mno);
	}

	@Override
	public Review select(int bookno2) {
		return rvd.select(bookno2);
	}
	
}

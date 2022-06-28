package com.ch.nookdajeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int getmyRv(String memail) {
		return sst.selectOne("reviewns.getmyRv",memail);
	}

	public List<Review> list(Review review) {
		return sst.selectList("reviewns.myList",review);
	}

	public int getTotalrv(int acmno) {
		return sst.selectOne("reviewns.getTotalrv",acmno);
	}

	public List<Review> rvlist(Review review) {
		return sst.selectList("reviewns.acmRvList",review);
	}

	public int delete(int rvno) {
		return sst.update("reviewns.delete",rvno);
	}

	public float selectStar(int acmno) {
		return sst.selectOne("reviewns.selectStar",acmno);
	}

	public Review selectRvno(int rvno) {
		return sst.selectOne("reviewns.selectRvno",rvno);
	}

	public int update(Review review) {
		return sst.update("reviewns.update",review);
	}

	public int insert(Review review) {
		return sst.insert("reviewns.insert",review);
	}
	
	public List<Review> hostRvList(int mno) {
		return sst.selectList("reviewns.hostRvList", mno);
	}

	@Override
	public Review select(int bookno2) {
		return sst.selectOne("reviewns.selectOne", bookno2);
	}


}

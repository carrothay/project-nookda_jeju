package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.LikesDao;
import com.ch.nookdajeju.model.Likes;

@Service
public class LikesServiceImpl implements LikesService {
	@Autowired
	private LikesDao ld;
	
	public int insert(Likes likes) {
		return ld.insert(likes);
	}
	
	public Likes select(Likes likes) {
		return ld.select(likes);
	}
	
	public int delete(Likes likes) {
		return ld.delete(likes);
	}
	
	public int getmyLikes(String memail) {
		return ld.getmyLikes(memail);
	}

	public List<Likes> list(Likes likes) {
		return ld.list(likes);
	}
}

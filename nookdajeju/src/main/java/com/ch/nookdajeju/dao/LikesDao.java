package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.Likes;
public interface LikesDao {
	
	int insert(Likes likes);
	Likes select(Likes likes);
	int delete(Likes likes);
	int getmyLikes(String memail);
	List<Likes> list(Likes likes);

}

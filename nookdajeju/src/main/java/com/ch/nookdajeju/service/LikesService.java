package com.ch.nookdajeju.service;
import java.util.List;

import com.ch.nookdajeju.model.Likes;
public interface LikesService {
	
	Likes select(Likes likes);
	int delete(Likes likes);
	int insert(Likes likes);
	int getmyLikes(String memail);
	List<Likes> list(Likes likes);

}

package com.ch.nookdajeju.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Likes;

@Repository
public class LikesDaoImpl implements LikesDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	public int insert(Likes likes) {
		return sst.insert("likesns.insert", likes);
	}

	public Likes select(Likes likes) {
		return sst.selectOne("likesns.select", likes);
	}

	public int delete(Likes likes) {
		return sst.delete("likesns.delete", likes);
	}
	
	public int getmyLikes(String memail) {
		return sst.selectOne("likesns.getmyLikes", memail);
	}

	public List<Likes> list(Likes likes) {
		return sst.selectList("likesns.myList", likes);
	}


}

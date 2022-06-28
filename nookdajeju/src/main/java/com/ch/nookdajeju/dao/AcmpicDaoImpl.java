package com.ch.nookdajeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Acmpic;

@Repository
public class AcmpicDaoImpl implements AcmpicDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int insertap(Acmpic acmpic) {
		return sst.insert("apns.insertap", acmpic);
	}
	
	public List<Acmpic> acmpicList(Acm acm) {
		return sst.selectList("apns.acmpicList", acm); //상세페이지 사진리스트 조회용
	}

	@Override
	public List<Acmpic> apHostAUp(int acmno) {
		return sst.selectList("apns.apHostAUp", acmno); // 호스트 숙소 정보 수정 시 사진불러오기용
	}

	@Override
	public int deleteUp(int acmno) {
		return sst.delete("apns.deleteUp", acmno); // 호스트 숙소 정보 수정 시 사진불러오기용
	}

}
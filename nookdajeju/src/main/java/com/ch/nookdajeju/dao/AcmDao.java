package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.Acm;

public interface AcmDao {
	List<Acm> list(Acm acm);

	List<Acm> pList(Acm acm);

	List<Acm> hostList(Acm acm);

	int getTotal(int mno);

	int insert(Acm acm);

	int insertCancle(Acm acm);

	int select(int mno);
	
	int insertDelete(int dAcmno);
	
	// 상세페이지 용
	Acm select(Acm acm);
	
	//리뷰페이지용
	Acm selectforrv(int acmno);

	List<Acm> adminAcmList(Acm acm); // 관리자가 숙소 전체를 가져오기 위함

	int getAcmTotal(Acm acm); // 관리자가 숙소 전체 수를 알기 위함

	List<Acm> mapSearchList(Acm acm);
	
	//호스트 추가 5/19
	int max(); // 숙소등록시 acmno 최대값 구함
	List<Acm> hostAcmList(int mno); // 페이징x리스트

	int update(Acm acm);

	int delete(Acm acm);

	List<Acm> searchList(Acm acm);

	String getHostNick(int hostno);

	void updateReadCount(int acmno);

	int delCancel(Acm acm); // 관리자 숙소 삭제 취소
	
}

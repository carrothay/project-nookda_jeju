package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Member;

public interface AcmService {
	Acm select(Acm acm); //상세페이지 조회용
	
	List<Acm> list(Acm acm);

	List<Acm> pList(Acm acm);

	List<Acm> hostList(Acm acm);
	
	List<Acm> hostAcmList(int mno);

	int getTotal(int mno);

	int insert(Acm acm);

	int insertCancle(Acm acm);

	int select(int mno);

	int insertDelete(int dAcmno);
	
	Acm selectforrv(int acmno);
	
	List<Acm> adminAcmList(Acm acm); // 관리자가 숙소 목록을 가져오기 위함

	int getAcmTotal(Acm acm); // 관리자가 숙소 수를 가져오기 위함

	List<Acm> mapSearchList(Acm acm); //메인페이지 - 지도 검색결과 표시
	
	int max(); // 호스트 숙소등록시 최대 mno 구하기 위함

	int update(Acm acm);

	int delete(Acm acm);

	List<Acm> searchList(Acm acm);

	String getHostNick(int hostno); //호스트 닉네임 불러오기

	void updateReadCount(int acmno);

	int delCancel(Acm acm); // 관리자 숙소 삭제 취소

}

package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.AcmDao;
import com.ch.nookdajeju.model.Acm;

@Service
public class AcmServiceImpl implements AcmService {
@Autowired
	private AcmDao ad;

public List<Acm> list(Acm acm) {
	return ad.list(acm); // 숙소리스트 전체조회
}

public List<Acm> pList(Acm acm) {
	return ad.pList(acm); // 숙소리스트 조회수 Top6 조회 : 메인용
}

public List<Acm> hostList(Acm acm) {
	return ad.hostList(acm);
}

public List<Acm> hostAcmList(int mno) {
	return ad.hostAcmList(mno);
}

public int getTotal(int mno) {
	return ad.getTotal(mno);
}

public int insert(Acm acm) {
	return ad.insert(acm);
}

public int insertCancle(Acm acm) {
	return ad.insertCancle(acm);
}

public int select(int mno) {
	return ad.select(mno);
}

public int insertDelete(int dAcmno) {
	return ad.insertDelete(dAcmno);
}

// 상세페이지 - 조회용
public Acm select(Acm acm) {
	return ad.select(acm);
}

public Acm selectforrv(int acmno) {
	return ad.selectforrv(acmno);
}

@Override
public List<Acm> adminAcmList(Acm acm) { // 관리자가 숙소 목록을 가져오기 위함
	return ad.adminAcmList(acm);
}

@Override
public int getAcmTotal(Acm acm) { // 관리자가 숙소 수를 알기 위함
	return ad.getAcmTotal(acm);
}

@Override
public int max() {
	return ad.max();
}

@Override
public List<Acm> mapSearchList(Acm acm) {
	return ad.mapSearchList(acm);
}

@Override
public int update(Acm acm) {
	return ad.update(acm);
}

@Override
public int delete(Acm acm) {
	return ad.delete(acm);
}

@Override
public List<Acm> searchList(Acm acm) {
	return ad.searchList(acm);
}

@Override
public String getHostNick(int hostno) {
	return ad.getHostNick(hostno);
}

@Override
public void updateReadCount(int acmno) {
	ad.updateReadCount(acmno);
}

@Override
public int delCancel(Acm acm) { // 관리자 숙소 삭제 취소 
	return ad.delCancel(acm); 
}

}

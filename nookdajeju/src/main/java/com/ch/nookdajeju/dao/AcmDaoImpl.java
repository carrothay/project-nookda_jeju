package com.ch.nookdajeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Acm;

@Repository
public class AcmDaoImpl implements AcmDao {
@Autowired
private SqlSessionTemplate sst;

public List<Acm> list(Acm acm) {
	return sst.selectList("acmns.list", acm); // 숙소전체리스트
}

public List<Acm> pList(Acm acm) {
	return sst.selectList("acmns.pList", acm); // 메인 인기숙소 리스트
}

public List<Acm> hostList(Acm acm) {
	return sst.selectList("acmns.hostList", acm); // 호스트 숙소리스트
}

public int getTotal(int mno) {
	return sst.selectOne("acmns.getTotal", mno); // 숙소리스트 getTotal
}

public int insert(Acm acm) {
	return sst.insert("acmns.insert", acm); // 숙소등록
}

public int insertCancle(Acm acm) {
	return sst.delete("acmns.insertCancle", acm); // acmpic 실패하면 insert된 acm도 삭제
}

public int select(int mno) {
	return sst.selectOne("acmns.select", mno); // 숙소 등록 후 등록한 숙소의 acmno불러오기
}

public int insertDelete(int dAcmno) {
	return sst.delete("acmns.insertDelete", dAcmno); // 중복등록된 acm 삭제.
}

// 상세페이지 용 - 숙소 조회
public Acm select(Acm acm) {
	return sst.selectOne("acmns.select1", acm);
}

//리뷰페이지용 - 숙소이름 불러오기
public Acm selectforrv(int acmno) {
	return sst.selectOne("acmns.selectforrv",acmno);
}

@Override
public List<Acm> adminAcmList(Acm acm) { // 관리자가 숙소 전체 리스트를 가져오기 위함
	return sst.selectList("acmns.adminAcmList", acm); 
}

@Override
public int getAcmTotal(Acm acm) {
	return sst.selectOne("acmns.getAcmTotal", acm); // 관리자가 숙소 전체 수를 알기 위함
}

@Override
public List<Acm> mapSearchList(Acm acm) {
	return sst.selectList("acmns.mapSearchList",acm);
}

// 호스트 추가 5/19
public int max() {
	return sst.selectOne("acmns.max");
}

public List<Acm> hostAcmList(int mno) {
	return sst.selectList("acmns.hostAcmList", mno);
}

@Override
public int update(Acm acm) {
	return sst.update("acmns.update", acm);
}

@Override
public int delete(Acm acm) {
	return sst.update("acmns.delete", acm);
}

@Override
public List<Acm> searchList(Acm acm) {
	return sst.selectList("acmns.searchList", acm);
}

@Override
public String getHostNick(int hostno) {
	return sst.selectOne("acmns.getHostNick", hostno);
}

@Override
public void updateReadCount(int acmno) {
	sst.update("acmns.updateReadCount", acmno);
}

@Override
public int delCancel(Acm acm) { // 관리자 숙소 삭제 취소
	return sst.update("acmns.delCancel", acm);
}

}

package com.ch.nookdajeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Member;
@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	public int getMbTotal(Member member) {	// 회원 총 수 구하기
		return sst.selectOne("memberns.getMbTotal", member);
	}
	
	public List<Member> mbList(Member member) {	// 관리자가 회원 목록
		return sst.selectList("memberns.mbList", member);
	}
	
	public List<Member> requestList(Member member) { // 관리자가 호스트 신청 목록
		return sst.selectList("memberns.requestList", member);
	}

	public List<Member> hostList(Member member) { // 관리자가 호스트 목록
		return sst.selectList("memberns.hostList", member);
	}
	
	public int hostPermit(Member member) { // 관리자 호스트 신청 승인
		return sst.update("memberns.hostPermit", member);
	}

	public int hostReject(Member member) { // 관리자 호스트  신청 거절		
		return sst.update("memberns.hostReject", member);
	}

	public int hostRequest(Member member) { // 관리자 호스트 신청 대기
		return sst.update("memberns.hostRequest", member);
	}
	
	public Member select(String memail) {
		return sst.selectOne("memberns.select", memail); // 로그인할 때 사용하는 로직
	}

	public Member selectNick(String nickname) {
		return sst.selectOne("memberns.selectNick", nickname); // 닉네임 중복 체크
	}

	public int insert(Member member) {
		return sst.insert("memberns.insert", member); // 회원 가입
	}

	public Member selectFindId(Member member) {
		return sst.selectOne("memberns.selectFindId", member); // 아이디 찾기
	}

	public Member selectFindPw(Member member) {
		return sst.selectOne("memberns.selectFindPw", member); // 비밀번호 찾기
	}

	public int update(Member member) {
		return sst.update("memberns.update", member); // 회원정보 수정
	}
	
	public int updatePw(String memail) {
		return sst.update("memberns.updatePw", memail); // 비밀번호 변경
	}
	
	public int delete(String memail) {
		return sst.update("memberns.delete", memail); // 회원 탈퇴
	}

	public int getHostTotal(Member member) { // 호스트 총 수 구하기
		return sst.selectOne("memberns.getHostTotal", member);
	}

	public int getRequestTotal(Member member) { // 호스트 신청 총 수 구하기
		return sst.selectOne("memberns.getRequestTotal", member);
	}

	//호스트신청 시 상태를 p로 변경
	public int hostrequest(Member member) {
		return sst.update("memberns.hostrequest",member);
	}
	//호스트그만하기 상태를 다시 n으로 변경
	public int hostcancel(Member member) {
		return sst.update("memberns.hostcancel",member);
	}
	//이메일로 mno 불러오기
	public int selectMno(String memail) {
		return sst.selectOne("memberns.selectmno",memail);
	}

	@Override
	public int addelete(String memail) {
		return sst.update("memberns.addelete", memail);
	}

	@Override
	public Member selectProfile(String nickname) {
		return sst.selectOne("memberns.selectProfile",nickname);
	}

	@Override
	public Member selectByMno(int mno) {
		return sst.selectOne("memberns.selectByMno", mno);
	}

	@Override
	public int delCancel(Member member) {
		return sst.update("memberns.delCancel", member);
	}
}
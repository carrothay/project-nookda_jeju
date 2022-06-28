package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.Member;
public interface MemberDao {
	
	int getMbTotal(Member member); // 관리자가 회원 수를 불러옴
	
	List<Member> mbList(Member member); // 관리자가 회원 목록을 불러옴
	
	List<Member> requestList(Member member); // 관리자가 호스트 신청 목록을 불러옴

	List<Member> hostList(Member member); // 관리자가 호스트 목록을 불러옴
	
	int hostPermit(Member member); // 관리자 호스트 신청 승인
	
	int hostReject(Member member); // 관리자 호스트 신청 거절
	
	int hostRequest(Member member); // 관리자 호스트 신청 대기

	Member select(String memail); // 회원가입 아이디 중복 체크, 로그인할 때 사용하는 로직

	Member selectNick(String nickname); // 닉네임 중복체크

	int insert(Member member); // 회원정보 입력
	
	Member selectFindId(Member member); // 아이디 찾기
	
	Member selectFindPw(Member member); // 비밀번호 찾기
	
	int update(Member member); // 회원정보 수정
	
	int updatePw(String memail); // 비밀번호 변경
	
	int delete(String memail); // 회원 탈퇴

	int getHostTotal(Member member); // 관리자가 호스트 수를 불러옴

	int getRequestTotal(Member member); // 관리자가 호스트 신청 수를 불러옴
	
	int hostrequest(Member member);
	int hostcancel(Member member);
	int selectMno(String memail);
	int addelete(String memail);

	Member selectProfile(String nickname);

	Member selectByMno(int mno);

	int delCancel(Member member); // 관리자 멤버 삭제 취소

}
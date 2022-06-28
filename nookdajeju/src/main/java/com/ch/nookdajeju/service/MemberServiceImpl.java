package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.nookdajeju.dao.MemberDao;
import com.ch.nookdajeju.model.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	public int getMbTotal(Member member) {
		return md.getMbTotal(member); // 관리자 회원 수를 알기 위함
	}
	
	public List<Member> mbList(Member member) {
		return md.mbList(member); // 관리자 회원 목록을 가져오기 위함
	}
	
	public List<Member> requestList(Member member) {
		return md.requestList(member); // 관리자 호스트 신청 목록을 가져오기 위함
	}
	
	public List<Member> hostList(Member member) {
		return md.hostList(member); // 관리자 호스트 목록을 가져오기 위함
	}

	public int hostPermit(Member member) {
		return md.hostPermit(member); // 관리자 호스트 신청 승인
	}

	public int hostReject(Member member) {
		return md.hostReject(member); // 관리자 호스트 신청 거절
	}
	
	public int hostRequest(Member member) {
		return md.hostRequest(member); // 관리자 호스트 신청 대기
	}
	
	public Member select(String memail) { // 회원가입 아이디 중복 체크, 로그인할 때 사용하는 로직
		return md.select(memail);
	}

	public Member selectNick(String nickname) { // 닉네임 중복 체크
		return md.selectNick(nickname);
	}

	public int insert(Member member) { // 회원가입
		return md.insert(member);
	}

	public Member selectFindId(Member member) { // 아이디  찾기
		return md.selectFindId(member);
	}

	public Member selectFindPw(Member member) { // 비밀번호 찾기
		return md.selectFindPw(member);
	}

	public int update(Member member) { // 회원정보 수정
		return md.update(member);
	}
	
	public int updatePw(String memail) { // 비밀번호 변경
		return md.updatePw(memail);
	}
	
	public int delete(String memail) { // 회원 탈퇴
		return md.delete(memail);
	}

	public int getHostTotal(Member member) { // 관리자가 호스트 수를 알기 위함
		return md.getHostTotal(member);
	}

	public int getRequestTotal(Member member) { // 관리자가 호스트 신청 수를 알기 위함
		return md.getRequestTotal(member);
	}
	
	public int hostrequest(Member member) {
		return md.hostrequest(member);
	}
	
	public int hostcancel(Member member) {
		return md.hostcancel(member);
	}
	
	public int selectMno(String memail) {
		return md.selectMno(memail);
	}

	@Override
	public int addelete(String memail) {
		return md.addelete(memail);
	}
	@Override
	public Member selectProfile(String nickname) {
		return md.selectProfile(nickname);
	}

	@Override
	public Member selectByMno(int mno) {
		return md.selectByMno(mno);
	}

	@Override
	public int delCancel(Member member) { // 관리자 멤버 삭제 취소
		return md.delCancel(member); 
	}
}
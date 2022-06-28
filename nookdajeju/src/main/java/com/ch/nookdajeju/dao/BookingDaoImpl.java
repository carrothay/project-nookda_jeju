package com.ch.nookdajeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Booking;

@Repository
public class BookingDaoImpl implements BookingDao{
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 예약페이지 - 예약하기
	public int insert(Booking booking) {
		return sst.insert("bns.insert", booking);
	}
	
	public List<Booking> list3(Acm acm) {
		return sst.selectList("bns.list3", acm); // 호스트 예약리스트 - 사용완료
	}

	public List<Booking> list2(Acm acm) {
		return sst.selectList("bns.list2", acm); // 호스트 예약리스트 - 취소
	}

	public List<Booking> list1(Acm acm) {
		return sst.selectList("bns.list1", acm); // 호스트 예약리스트 - 예약중
	}

	public List<Booking> list4(Acm acm) {
		return sst.selectList("bns.list4", acm); // 호스트 예약리스트 - 전체
	}

	public int getmyBookings(String memail) {
		return sst.selectOne("bns.getmyBookings", memail); //마이페이지 예약리스트 개수 - 예정
	}

	public List<Booking> myBookingList(Booking booking) {
		return sst.selectList("bns.myBookingList", booking); //마이페이지 예약리스트 - 예정
	}

	public int myBookDelete(int bookno) {
		return sst.update("bns.myBookDelete", bookno); //마이페이지 내 예약 취소
	}

	@Override
	public Booking selectOnebooking(Booking booking) {
		return sst.selectOne("bns.selectOne",booking); //임시
	}

	@Override
	public int getmyHistory(String memail) {
		return sst.selectOne("bns.getmyHistory", memail); //마이페이지 예약리스트 개수 - 완료
	}

	@Override
	public List<Booking> myHistoryList(Booking booking) {
		return sst.selectList("bns.myHistoryList", booking); //마이페이지 예약리스트 - 완료
	}

	@Override
	public int hostDelete(Booking booking) {
		return sst.update("bns.hostDelete", booking); // 호스트 예약 취소
	}

	@Override
	public List<Booking> incomeList(int acmno) {
		return sst.selectList("bns.incomeList", acmno); // 호스트 매출 관리
	}

	@Override
	public List<Booking> booked(Acm acm) {
		return sst.selectList("bns.booked", acm); 
	}

	@Override
	public List<Booking> bookeddate(Booking booking) {
		return sst.selectList("bns.bookeddate", booking); 
	}
	
}

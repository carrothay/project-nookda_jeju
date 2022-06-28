package com.ch.nookdajeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.nookdajeju.dao.BookingDao;
import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Booking;

@Service
public class BookingServiceImpl implements BookingService{
	@Autowired
	private BookingDao bd;

	public List<Booking> list3(Acm acm) {
		return bd.list3(acm); // 숙소 별 예약리스트 사용완료 조회
	}

	public List<Booking> list2(Acm acm) {
		return bd.list2(acm); // 숙소 별 예약리스트 취소 조회
	}

	public List<Booking> list1(Acm acm) {
		return bd.list1(acm); // 숙소 별 예약리스트 예약중 조회
	}

	public List<Booking> list4(Acm acm) {
		return bd.list4(acm); // 숙소 별 예약리스트 전체 조회
	}
	
	// 예약페이지 - 예약하기
	public int insert(Booking booking) {
		return bd.insert(booking);
	}
	
	public int getmyBookings(String memail) {
		return bd.getmyBookings(memail); //마이페이지 - 예정된 예약 수
	}

	public List<Booking> myBookingList(Booking booking) {
		return bd.myBookingList(booking); //마이페이지 - 예정된 예약리스트
	}

	public int myBookDelete(int bookno) {
		return bd.myBookDelete(bookno);
	}

	@Override
	public Booking select(Booking booking) {
		return bd.selectOnebooking(booking); //임시
	}

	@Override
	public int getmyHistory(String memail) {
		return bd.getmyHistory(memail); //마이페이지 - 완료된 예약 수
	}

	@Override
	public List<Booking> myHistoryList(Booking booking) {
		return bd.myHistoryList(booking); //마이페이지 - 완료된 예약리스트
	}

	@Override
	public int hostDelete(Booking booking) {
		return bd.hostDelete(booking);
	}

	@Override
	public List<Booking> incomeList(int acmno) {
		return bd.incomeList(acmno);
	}

	@Override
	public List<Booking> booked(Acm acm) {
		return bd.booked(acm);
	}

	@Override
	public List<Booking> bookeddate(Booking booking) {
		return  bd.bookeddate(booking);
	}

}

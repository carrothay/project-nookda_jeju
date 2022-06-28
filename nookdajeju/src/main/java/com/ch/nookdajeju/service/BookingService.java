package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Booking;

public interface BookingService {
	List<Booking> list3(Acm acm);

	List<Booking> list2(Acm acm);

	List<Booking> list1(Acm acm);

	List<Booking> list4(Acm acm);
	
	// 예약페이지 - 예약하기
	int insert(Booking booking);

	int getmyBookings(String memail);

	List<Booking> myBookingList(Booking booking);

	int myBookDelete(int bookno);

	Booking select(Booking booking);

	int getmyHistory(String memail);

	List<Booking> myHistoryList(Booking booking);

	int hostDelete(Booking booking);

	List<Booking> incomeList(int acmno);

	List<Booking> booked(Acm acm);

	List<Booking> bookeddate(Booking booking);

}

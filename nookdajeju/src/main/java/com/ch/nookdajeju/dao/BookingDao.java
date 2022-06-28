package com.ch.nookdajeju.dao;

import java.util.List;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Booking;

public interface BookingDao {

	//예약페이지용 - 예약하기
	int insert(Booking booking);

	List<Booking> list3(Acm acm);

	List<Booking> list2(Acm acm);

	List<Booking> list1(Acm acm);

	List<Booking> list4(Acm acm);

	int getmyBookings(String memail);

	List<Booking> myBookingList(Booking booking);

	int myBookDelete(int bookno);

	Booking selectOnebooking(Booking booking);

	int getmyHistory(String memail);

	List<Booking> myHistoryList(Booking booking);

	int hostDelete(Booking booking);

	List<Booking> incomeList(int acmno);

	List<Booking> booked(Acm acm);

	List<Booking> bookeddate(Booking booking);

}

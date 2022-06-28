<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/booking.css">
<script type="text/javascript">

$(document).ready(function(){
	// 천 단위 콤마 찍기
	var nData = addComma(${booking.bookprice });
	$("#bookprice").text(nData+'원');
})

function addComma(num){
var regexp = /\B(?=(\d{3})+(?!\d))/g;
return num.toString().replace(regexp,',');
};	

</script>
</head>
<body>
<c:if test="${result >0 }">
	 <div class="container_middle">
		<div class="showResult">
			<div class="title">예약이 완료되었습니다 ♬</div>
			<div class="bookct">
				<table>
					<tr><th>예약번호</th>
					<td>${booking.bookno }</td></tr>
					
					<tr><th>예약자 이름</th>
					<td>${member.mlastname }${member.mfstname }</td></tr>
					
					<tr><th>체크인 날짜</th>
					<td>${booking.checkin }</td></tr>
					
					<tr><th>체크아웃 날짜</th>
					<td>${booking.checkout }</td></tr>
					
					<tr><th>예약 인원 수</th>
					<td>${booking.guestcnt }</td></tr>
					
					<tr><th>결제 금액</th>
					<td id="bookprice"></td></tr>
					
					<tr><th>결제 수단</th>
					<td>${booking.payby }</td></tr>
					
					<tr><th>요청사항</th>
					<td>${booking.request }</td></tr>
					
					<tr><th>예약 완료 날짜</th>
					<td>${booking.bookdate }</td></tr>
				</table>
			</div>
			<div class="btn_box">
				<a href="myBookingList.do" class="btn">내 예약 리스트 보기</a>
				<a href="acmView.do?acmno=${acm.acmno }" class="btn">숙소 상세 페이지 보기</a>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("예약 실패했습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>
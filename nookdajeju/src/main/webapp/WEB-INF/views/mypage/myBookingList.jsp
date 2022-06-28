<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/mystyle.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
</head><body>
<div class="container_wide">
		<!-- myMainMenu -->
		<jsp:include page="myMainMenu.jsp"/>
		<!-- 내용 -->
		<div class="content">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">여행 예정인 숙소가 없습니다. 지금 예약해보세요 :)</span></li>
					<span><a href="myHistoryList.do" class="his_btn">완료된 여행</a></span>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<div class="my_title">예약된 여행</div>
				
<!-- 				<a href="adminRequestList.do" class="adbtn">취소된 여행</a> -->
				<span><a href="myHistoryList.do" class="his_btn">완료된 여행</a></span>
				<ul>
					<c:forEach var="mybooking" items="${list}">
		<!-- 예정된 여행만 출력 -->
						<!-- 리스트 시작 -->
						<li class= "booklist">
							<a href="acmView.do?acmno=${mybooking.acmno}">
								<img alt="숙소사진" src="resources/acmpic/${mybooking.acmno}/1.jpg">
							</a>
							<div class="txt_booking">
								<a href="acmView.do?acmno=${mybooking.acmno}" class="cursor">
									<span class="txt_title" id="bookacmN">${mybooking.acm_name }</span></a>
									<hr id="hr2">
									<span class="txt_bookd">예약번호: 0000${mybooking.bookno}</span>
									<span class="txt_bookd" id="b_highlight">체크인: ${mybooking.checkin}
									</span>
									<span class="txt_bookd" id="b_highlight">체크아웃: ${mybooking.checkout}
									</span>
									<span class="txt_bookd">인원: 총 ${mybooking.guestcnt}명</span>
									<span class="txt_bookd">금액:
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${mybooking.bookprice}"/>원</span>
									<span class="txt_bookd">결제방법: ${mybooking.payby}</span>
									<span class="txt_bookd">요청사항:
										<c:if test="${mybooking.request != null}">
									${mybooking.request}</c:if>
										<c:if test="${mybooking.request ==null }">
										없음</c:if>
									</span>
									<span class="txt_bookd">예약일: ${mybooking.bookdate}
									</span>
								<div class="txt_bottom">
										<a href="myBookingDelete.do?bookno=${mybooking.bookno}" class="mybtn"
										onclick="return confirm('정말 예약을 취소 하실래요?ㅜㅜ \n취소할 시 복구할 수 없습니다.');">예약 취소하기</a>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	<p>
	<div align="center">
	<ul class="pagination_bottom">
		<!-- 시작페이지가 pagePerBlock 보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="myBookingList.do?pageNum=1">
				<img alt="이전" src="${path }/resources/img/left2.png"></a></li>
			<li><a href="myBookingList.do?pageNum=${pb.startPage - 1 }">
				<img alt="이전" src="${path }/resources/img/left.png"></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li class="currentPage"><a href="myBookingList.do?pageNum=${i }">${i }</a></li>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="myBookingList.do?pageNum=${i }">${i }</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="myBookingList.do?pageNum=${pb.endPage + 1 }">
				<img alt="다음" src="${path }/resources/img/right.png"></a></li>
			<li><a href="myBookingList.do?pageNum=${pb.totalPage}">
				<img alt="다음" src="${path }/resources/img/right2.png"></a></li>
		</c:if>
		</ul>
		</div>
	</div>
</body>
</html>
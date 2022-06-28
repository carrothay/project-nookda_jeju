<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/mystyle.css">
<style>

.menu { 
	display: inline-block;
	width: 100%;
}

</style>

<script type="text/javascript">
	function showCon(id) {
		location.href = id + ".do";
	}
</script>
</head>
<body>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul class="myMenu">
		<!-- 메뉴 영역 -->
		<li id="myLikesList" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="resources/img/favicon.png" >  위시리스트
		</li>
		<li id="myBookingList" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="resources/img/bookmark.svg" >  예약
		</li>
		<li id="myReviewList" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="resources/img/review.svg" >  리뷰
		</li>
		<li id="myInfoUpdateForm" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="resources/img/userinfo.svg" >  내 정보
		</li>
		<li id="message_list" style="cursor:pointer" onclick="window.open('message_list.do','width=400, height=430')">
			<img src="resources/img/chat.svg" >  메시지
		</li>
	</ul>
</div>
<div class="line"></div>
</body>
</html>

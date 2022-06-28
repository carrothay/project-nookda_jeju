<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/hoststyle.css">
</head>
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
<body>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul class="hostMenu">
		<li id="hostBookingList" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="resources/img/bookmark.svg"> 예약관리
		</li>
		<li id="hostAcmList" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="resources/img/house.svg"> 숙소관리
		</li>
		<li id="hostReviewList" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="resources/img/review.svg"> 리뷰관리	
		</li>
		<li id="hostSalesManagement" style="cursor:pointer" onclick="showCon(this.id)">
			<img src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3ECalculator%3C/title%3E%3Cdesc%3EA line styled icon from Orion Icon Library.%3C/desc%3E%3Crect data-name='layer1' x='10' y='2' width='44' height='60' rx='2' ry='2' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/rect%3E%3Ccircle data-name='layer2' cx='21.5' cy='53.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='32' cy='53.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='42.5' cy='53.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='21.5' cy='42.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='32' cy='42.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='42.5' cy='42.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='21.5' cy='31.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='32' cy='31.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Ccircle data-name='layer2' cx='42.5' cy='31.5' r='1.5' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/circle%3E%3Cpath data-name='layer1' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' d='M16 8h32v14H16zm26 4v4' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="Calculator" /> 매출관리	
		</li>
	</ul>
</div>
<div class="line"></div>
</body>
</html>
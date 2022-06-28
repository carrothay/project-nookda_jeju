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
	href="${path }/resources/bootstrap/css/adstyle.css">
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
		<ul class="adMenu">
			<li id="adminMemberList" style="cursor:pointer" onclick="showCon(this.id)">
				<img src="resources/img/member.svg">  멤버 관리
			</li>
			<li id="adminHostList" style="cursor:pointer" onclick="showCon(this.id)">
				<img src="resources/img/host.svg">  호스트 관리
			</li>
			<li id="adminAcmList" style="cursor:pointer" onclick="showCon(this.id)">
				<img src="resources/img/house.svg">  숙소 관리
			</li>
		</ul>
	</div>
	<div class="line"></div>
</body>
</html>
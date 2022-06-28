<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/adstyle.css">
<style>

.content_adminMain {
	margin-top: 150px;
	margin-bottom: 100px;
    width: 100%;
	text-align: center;
	font-size: 20px; 
	font-weight: 600;
	font-family: 'nookda';
}

.adtext {
	color: var(--point-color);
	text-decoration: underline;
	padding-right: 3px;
}

.container_middle {
	margin-top: 190px;
}

</style>
</head>
<body>
	<div class="container_middle">
		<!-- Menu -->
		<jsp:include page="adminMainMenu.jsp"></jsp:include>
	
		<!-- 내용 -->
		<div class="content_adminMain">
			<b class="adtext">관리자</b><b>님 환영합니다.</b>
		</div>
	</div>
</body>
</html>
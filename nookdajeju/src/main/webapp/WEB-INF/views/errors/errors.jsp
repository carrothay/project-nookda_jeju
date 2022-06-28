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
	href="${path }/resources/bootstrap/css/font.css">
<style>
body {
	margin: 0;
}
.btn {
	display: inline;
	height: 43px;
	border: none;
	font-size: 14px;
	font-weight: 500;
	color: #000;
	cursor: pointer;
	text-decoration: underline;
	text-align: center;
	margin: auto;
	background-color: #fff;
	font-family: 'nookda';
	margin-left: 46%;
}

.btn:hover {
	color: #999;
}

</style>
</head>
<body>
<img width="100%" src="resources/img/error.png">
<br>
<a href="main.do"><button  class="btn">메인으로 돌아가기</button></a>
</body>
</html>
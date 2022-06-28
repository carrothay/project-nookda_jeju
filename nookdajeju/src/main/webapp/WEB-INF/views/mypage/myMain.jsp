<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content_myMain {
	margin-top: 150px;
	margin-bottom: 100px;
    width: 100%;
	text-align: center;
	font-size: 20px; 
	font-weight: 600;
	font-family: 'nookda';
}

.mytext {
	color: var(--point-color);
	text-decoration: underline;
	padding-right: 3px;
}

.content_myMain {
	margin-top: 190px;
}

</style>
</head><body>

		<div class="content_myMain">
		
			<!-- myMainMenu -->
			<jsp:include page="myMainMenu.jsp"></jsp:include>
		
			<!-- 내용 -->
			<div class="content_myMain">
				<b class="mytext">${member.nickname }</b> 님 환영합니다.
			</div>
		
		</div>
</body>
</html>
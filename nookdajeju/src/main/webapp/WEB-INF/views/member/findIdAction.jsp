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
	href="${path }/resources/bootstrap/css/login.css">
<style>

.findresult {
	padding-top: 50px;
	padding-bottom: 50px;
	font-weight: 600;
	font-size: 15px;
}

</style>
</head>
<body>
<div align="center" class="container">
	<h2 class="title">아이디 찾기</h2>
	<c:if test="${result == 1 }">
		<table class="findresult">
			<tr>
				<th>회원님의 이메일은 [${member.memail }] 입니다.</th>
			</tr>
		</table>
			<a href="findFormPw.do" class="btn">비밀 번호 찾기</a>
			<a href="loginForm.do" class="btn">로그인</a>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("찾을 수 없는 계정입니다. 입력한 정보를 확인해 주세요.");
			history.go(-1);
		</script>
	</c:if>
</div>
</body>
</html>
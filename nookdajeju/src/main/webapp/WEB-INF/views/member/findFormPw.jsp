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
td, th {
    padding: 14px 0px;
}

</style>
</head>
<body>
<div class="container" align="center">
<form action="findPwAction.do" method="post">
<h2 class="title">비밀번호 찾기</h2>
	<table class="join">
		<tr>
			<td class="col-md-4">성</td>
			<td class="chk_value">
				<input type="text" name="mlastname" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<td class="col-md-4">이름</td>
			<td class="chk_value">
				<input type="text" name="mfstname" required="required">
			</td>
		</tr>
		<!-- 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어옴 -->
		<c:if test="${memail != null }">
		<tr>		
			<td class="col-md-4">이메일</td>
			<td class="chk_value">
				<input type="email" name="memail" id="email" required="required" value="${memail }">
			</td>
		</tr>
		</c:if>
		<c:if test="${memail == null }">
		<tr>
			<td class="col-md-4">이메일</td>
			<td class="chk_value">
				<input type="email" name="memail" id="email" required="required">
			</td>
		</tr>  
		</c:if>
		<tr>
			<td class="container_submit" colspan="2" align="center">
				<input type="submit" value="비밀번호 찾기" class="lbtn" id="idBtn">
			</td>
		</tr>
		
	</table>
		<a href="findFormId.do" class="btn">아이디 찾기</a>
		<a href="joinForm.do" class="btn">회원 가입</a>
		<a href="loginForm.do" class="btn">로그인</a>
	</form>
</div>
</body>
</html>
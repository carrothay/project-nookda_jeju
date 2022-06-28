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
<form action="loginAction.do?prevUrl=${prevUrl}" method="post">
<h2 class="title">L O G I N</h2>
<table class="join">
	<tr>
		<td class="col-md-4">이메일</td>
		<td class="chk_value">
			<input type="text" name="memail" required="required" autofocus="autofocus">
		</td>
	</tr>
	<tr>
		<td class="col-md-4">암호</td>
		<td class="chk_value"><input type="password" name="mpw" required="required"></td>
	</tr>
	<tr>
		<td class="container_submit" colspan="2" align="center">
			<input type="submit" value="확인" class="lbtn">
		</td>
	</tr>
</table>
</form>
	<a href="findFormId.do" class="btn">아이디 찾기</a>
	<a href="findFormPw.do" class="btn">비밀번호 찾기</a>
	<a href="joinForm.do" class="btn">회원 가입</a>
</div>
</body>
</html>
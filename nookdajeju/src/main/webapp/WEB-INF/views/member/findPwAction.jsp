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
	<!-- 엔터키 전송 막기 -->
	<div style="display:none">
		<input type="submit" onclick="return false"/>
		<input type="text"/>
	</div>
		
	<h2 class="title">비밀번호 찾기</h2>
	<table class="findresult">
		<c:if test="${result > 0 }">
			<tr>
				<th>${member.nickname } 님의 임시 비밀 번호는 [1234] 입니다. 로그인 후 변경해 주세요.</th>
			</tr>
		</c:if>
		<c:if test="${result == -1 }">
			<script type="text/javascript">
				alert("찾을 수 없는 계정입니다. 입력한 정보를 확인해 주세요.");
				history.go(-1);
			</script>
		</c:if>
	</table>
	<a href="findFormId.do?" class="btn">아이디 찾기</a>
</div>
</body>
</html>
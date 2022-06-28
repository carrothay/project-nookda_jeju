<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<title>Insert title here</title>
</head>
<body>
<footer>
	<div class="footer_content">
		<img src="${path }/resources/img/logo.svg" class="footer_logo">
		<p>© 2022, NookdaJeju. All Rights Reserved.</p>
	</div>
<script src="${path }/resources/bootstrap/js/jquery.js"></script>
<script src="${path }/resources/datepicker/public/theme/js/t-datepicker.min.js"></script>
</footer>
</body>
</html>
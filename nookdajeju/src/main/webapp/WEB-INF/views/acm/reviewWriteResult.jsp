<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
				alert("리뷰가 등록되었습니다.")
				location.href = "acmView.do?acmno=${acmno}&mno=${mno}";
		</script>
	</c:if>
		<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("이미 이 예약에 대한 리뷰를 작성했습니다.")
			location.href = "myReviewList.do";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			history.back();
		</script>
	</c:if>
</body>
</html>
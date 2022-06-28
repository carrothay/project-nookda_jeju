<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/common_my.css">
</head><body>
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("리뷰가 수정되었습니다.");
		location.href="myReviewList.do";
	</script>
</c:if>
<c:if test="${result<=0} ">
	<script type="text/javascript">
		alert("리뷰 수정 실패\n다시 시도해주세요")
		history.back();
	</script>
</c:if>
</body>
</html>
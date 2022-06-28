<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/ask.css">
<script type="text/javascript">
	function delChk(){
		var del = confirm("삭제하시겠습니까?");
		if (del == true){
			location.href="askDelete.do?askno=${askboard.askno}"
		} else {
			return false;
		}
	}
</script>
<style type="text/css">
.btn {
	width: 15%;
	height: 35px;
	font-size: 14px;
}



</style>
</head>
<body>
<div class="container_semiwide" >
	<div class="title_box">
		<div class="title">게시글 상세</div>
	</div>
	<div class="top">
		<div class="ask_title">
		<b class="title2">제목 : </b><b class="ask_name">${askboard.askname }</b>
	</div>
		<div class="line"></div>
	<div class="user_info">
		<b>작성자 : ${askboard.nickname } &nbsp;  | </b>
		<b>조회수 : ${askboard.readcount } &nbsp;  |</b>
		<b>작성일 : ${askboard.ask_regdate }</b>
	</div>
	</div>
	<div class="content_box">
		<div class="content">${askboard.askcontent }</div>
	</div>
	<div class="btn_box">
		<a class="btn" href="askList.do?pageNum=1">목록으로</a>
		
		<div class="bottom_right">
			<c:if test="${nowmem.mno == askboard.mno }">
				<a class="smbtn" href="askUpdate.do?askno=${askboard.askno }">수정</a>
				<a class="smbtn" id="delete" onclick="return delChk()">삭제</a>
			</c:if>
			<c:if test="${nowmem.memail == 'admin'}">
				<a class="smbtn" href="askForm.do?askno=${askboard.askno }&secret=${askboard.secret}&re_name=${askboard.nickname}">답변</a>
			</c:if>
		</div>
	</div>
 </div>
</body>
</html>
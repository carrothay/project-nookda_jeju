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
	function chk(){
		if (frm.password.value != frm.password2.value){
			alert("암호가 다릅니다.");
			frm.password.focus();
			frm.password.value="";
			return false;
		}
	}
</script>
</head>
<body>
<form action="askUpdateResult.do?askno=${askboard.askno }" method="post" name="frm" onsubmit="return chk()">
	<div class="container_semiwide">
		<div class="title_box">
			<div class="title">문의 수정하기</div>
		</div>
		<div class="table_box">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="askno" value="${askboard.askno}">
			<input type="hidden" name="password2" value="${askboard.password}">
			<table>
				<tr><th>제목</th><td><input type="text" name="askname" required="required"  autofocus="autofocus" value="${askboard.askname }"></td></tr>
				<tr><th>작성자</th><td class="cname">${member.mlastname }${member.mfstname }</td></tr>
				<tr><th>문의내용</th>
					<td>
						<!-- 엔터키 전송 막기 -->
						<div style="display:none">
							<input type="submit" onclick="return false"/>
							<input type="text"/>
						</div>
						<textarea name="askcontent" rows="10" cols="60" required="required" placeholder="${askboard.askcontent }"></textarea>
					</td>
				</tr>
				<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
			</table>
		</div>
		<div class="submit_box">
			<input id="submit" type="submit" class="btn" value="확인">
			<input type="button" class="btn" onclick="location.href='askView.do?askno=${askboard.askno}'" value="취소">
		</div>
	</div>
</form>
</body>
</html>
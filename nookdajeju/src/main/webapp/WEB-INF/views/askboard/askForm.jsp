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
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/acm.css">
<script type="text/javascript">
	function chk(){
		if(frm.password.value != frm.password2.value){
			alert("암호와 암호확인이 다릅니다.");
			frm.password.focus();
			frm.password.value="";
			frm.password2.value="";
			return false;
		}
	}
</script>
</head>
<body>
<form action="askResult.do" method="post" name="frm" onsubmit="return chk()">
	<div class="container_semiwide">
		<div class="title_box">
			<div class="title">1:1 문의하기</div>
		</div>
		<div class="table_box">
			<input type="hidden" name="askno" value="${askno}">
			<input type="hidden" name="ref" value="${ref}">
			<input type="hidden" name="re_level" value="${re_level}">
			<input type="hidden" name="re_step" value="${re_step}">
			<input type="hidden" name="re_name" value="${re_name }">
			<table>
				<c:if test="${askno == 0 }">
					<tr><th>제목</th><td class="askformName"><input type="text" name="askname" required="required"  autofocus="autofocus" placeholder="문의 제목을 입력해주세요 *"></td>
							<td class="col-md-2"><input type="checkbox" class="nookdaChk" name="secret"  value="y" id="s1"><label for="s1">비밀글</label></td>
					</tr>
				</c:if>
				<c:if test="${askno != 0 }">
					<tr><th>제목</th>
						<td class="askformName">
							<input type="text" name="askname" required="required" autofocus="autofocus"  value="답변)">
							<c:if test="${secret == 'y'}">
								<input type="hidden" class="nookdaChk" name="secret"  value="y" id="s1" checked="checked">
							</c:if>
						</td>
					</tr>
				</c:if>
				<tr><th>작성자</th><td class="cname">${writer }</td></tr>
				<tr><th>문의내용</th>
					<td>
						<!-- 엔터키 전송 막기 -->
						<div style="display:none">
							<input type="submit" onclick="return false"/>
							<input type="text"/>
						</div>
						<textarea name="askcontent" rows="10" cols="60" required="required"></textarea>
					</td>
				</tr>
				<c:if test="${memail != 'admin' }">
					<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
					<tr><th>암호확인</th><td><input type="password" name="password2" required="required"> </td></tr>
				</c:if>
			</table>
		</div>
		<div class="submit_box">
			<input id="submit" type="submit" class="btn" value="확인">
		</div>
	</div>
</form>
</body>
</html>
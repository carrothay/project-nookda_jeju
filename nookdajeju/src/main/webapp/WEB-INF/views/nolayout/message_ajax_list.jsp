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
<!-- other_nick, unread 세팅하기 -->
<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.mroom } chat_list_box">
		<div type="button" class="chat_list" room="${tmp.mroom }" other-nick="${tmp.other_nick }">
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_img" >
					
				</div>
				<div class="chat_ib">
					<h5>${tmp.other_nick }
					</h5>
					<span class="chat_date">${tmp.send_time }</span>
					<div class="row">
						<div class="chat_date">
							<p>${tmp.msg_text }</p>
						</div>
						<%-- 만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다. --%>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.mroom }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</body>
</html>
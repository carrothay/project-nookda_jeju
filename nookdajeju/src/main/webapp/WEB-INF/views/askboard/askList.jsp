<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/ask.css">
<style>
.btn {

	width: 15%;

}
</style>
</head>
<body>
<div class="container_acmwide">
	<div class="title_box">
		<div class="title">1:1 문의 게시판</div>
	</div>
	<div class="table_box">
		<table class="listTable">
			<tr class="headt"><th class="askno">번호</th><th class="askname">제목</th><th class="writer">작성자</th>
					<th class="askcount">조회수</th><th class="askdate">작성일</th></tr>
			<c:if test="${empty list }">
				<tr><th colspan="4" align="center">문의글이 없습니다</th></tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="askboard" items="${list }">
					<tr><td align="center">${num }<c:set var="num" value="${num - 1}"></c:set>
						<c:if test="${askboard.del != 'y' }">
							<!-- 공개글 -->
							<c:if test="${askboard.secret eq 'n' or askboard.secret == null}">
								<td title="${askboard.askcontent }">
									<c:if test="${askboard.re_level >0 }">
										<img alt="" src="${path }/resources/img/level.gif" height="5" width="${askboard.re_level*10 }">
										<img alt="" src="${path }/resources/img/reply.svg" width="25px">
									</c:if>
									<a href="askView.do?askno=${askboard.askno }">${askboard.askname }</a>
								</td>
								<td class="text-center col-md-2" align="center">${askboard.nickname }</td>
								<td class="text-center" align="center">${askboard.readcount }</td>
								<td class="text-center" align="center">${askboard.ask_regdate }</td>
							</c:if>
							<!-- 비공개 글 -->
							<c:if test="${askboard.secret eq 'y' }">
									<c:if test="${askboard.re_name == member.nickname or member.memail == 'admin' }">
										<td title="${askboard.askcontent }">
											<c:if test="${askboard.re_level >0 }">
												<img alt="" src="${path }/resources/img/level.gif" height="5" width="${askboard.re_level*10 }">
												<img alt="" src="${path }/resources/img/reply.svg" width="25px">
											</c:if>
											<a href="askView.do?askno=${askboard.askno }"><img alt="비밀글" src="${path }/resources/img/lock.svg" width="25px" height="20px">${askboard.askname }</a>
										</td>
									</c:if>
									<c:if test="${askboard.re_name != member.nickname and member.memail != 'admin'}">
										<td title="${askboard.askcontent}">
											<c:if test="${askboard.re_level >0 }">
												<img alt="" src="${path }/resources/img/level.gif" height="5" width="${askboard.re_level*10 }">
												<img alt="" src="${path }/resources/img/reply.svg" width="25px">
											</c:if>
										<img alt="비밀글" src="${path }/resources/img/lock.svg" width="25px" height="20px">비밀글은 작성자와 관리자만 볼 수 있습니다.</td>
									</c:if>	
										<td class="text-center col-md-2" align="center">${askboard.nickname }</td>
										<td class="text-center" align="center">${askboard.readcount }</td>
										<td class="text-center" align="center">${askboard.ask_regdate }</td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock 보다 크면 앞에 보여줄 것이 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li>
						<a href="askList.do?pageNum=1">
							<img alt="이전" src="${path }/resources/img/left2.png">
						</a>
					</li>
					<li>
						<a href="askList.do?pageNum=${pb.startPage - 1 }">
							<img alt="이전" src="${path }/resources/img/left.png">
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li class="currentPage"><a href="askList.do?pageNum=${i }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="askList.do?pageNum=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="askList.do?pageNum=${pb.endPage + 1 }">
						<img alt="다음" src="${path }/resources/img/right.png"></a></li>
					<li><a href="askList.do?pageNum=${pb.totalPage}">
						<img alt="다음" src="${path }/resources/img/right2.png"></a></li>
				</c:if>
			</ul>
		</div>
		<c:if test="${member.memail != 'admin' }">
			<a href="askForm.do?askno=0" class="btn btn_write btn-primary">게시글 입력</a>
		</c:if>
</div>
</body>
</html>
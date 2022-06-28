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
	href="${path }/resources/bootstrap/css/adstyle.css">
<style>
</style>
</head>
<body>
<div class="container_wide">
<!-- Menu -->
<jsp:include page="adminMainMenu.jsp"></jsp:include>
<h2 class="title">호스트 신청 목록</h2>
	<a href="adminHostList.do" class="adbtn">호스트 목록</a>
	<table class="adtable">
		<tr>
			<th class="col-md-1 text-center">NO</th>
			<th class="col-md-3 text-center">이메일</th>
			<th class="col-md-1 text-center">성</th>
			<th class="col-md-2 text-center">이름</th>
			<th class="col-md-3 text-center">휴대폰 번호</th>
			<th class="col-md-2 text-center">승인 상태</th>		
		</tr>
		<c:if test="${empty requestList }">
				<tr class="nonelist">
					<th colspan="6" class="text-center">호스트 신청이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty requestList }">
				<c:forEach var="member" items="${requestList }">
					<c:if test="${member.mhost == 'p'}">
					<tr>
						<td class="col-md-2 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
							<td class="col-md-3 text-center">${member.memail }</td>
							<td class="col-md-1 text-center">${member.mlastname }</td>
							<td class="col-md-2 text-center">${member.mfstname }</td>
							<td class="col-md-3 text-center">${member.mphone }</td>

							<c:if test="${member.mhost == 'p' }">
								<td class="col-md-2 text-center">
									<a href="adminHostApproval.do?memail=${member.memail }&pageNum=${pageNum }">
										<img alt="" src="${path }/resources/img/emptychk.svg" width="25px" height="25px">
									</a>
								</td>
							</c:if>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
		<ul class="pagination_bottom">
			<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
			<c:if test="${pb.startPage > pb.pagePerBlock }">
				<li>
					<a href="adminRequestList.do?pageNum=1">
						<img alt="" src="${path }/resources/img/left2.png">
					</a>
				</li>
				<li>
					<a href="adminRequestList.do?pageNum=${pb.startPage - 1 }">
						<img alt="" src="${path }/resources/img/left.png">
					</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
			<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
				<c:if test="${pb.currentPage == i }">
					<li class="currentPage">
						<a href="adminRequestList.do?pageNum=${i }">${i }</a>
					</li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li>
						<a href="adminRequestList.do?pageNum=${i }">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			
			<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
			<c:if test="${pb.endPage < pb.totalPage }">
				<li>
					<a href="adminRequestList.do?pageNum=${pb.endPage + 1 }">
						<img alt="" src="${path }/resources/img/right.png">
					</a>
				</li>
				<li>
					<a href="adminRequestList.do?pageNum=${pb.totalPage}">
						<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<img alt="" src="${path }/resources/img/right2.png">
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>
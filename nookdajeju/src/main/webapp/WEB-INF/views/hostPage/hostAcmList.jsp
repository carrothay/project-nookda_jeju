<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/hostyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/common_my.css">
<script type="text/javascript">
</script>
</head>
<body>
<div class="container_wide">
<div class="includes">
	<jsp:include page="hostMainMenu.jsp"></jsp:include>
</div>
<!-- 해당 host가 등록한 숙소 리스트 -->
<h2 class="title">숙소 리스트</h2>
<div class="a-btn"><button type="button" onclick="location.href='hostAcmRegForm.do'"> &nbsp; 숙소 등록하기 &nbsp; </button></div>
	<div class="content1">
	<c:if test="${empty acmList }">
			등록된 숙소가 없습니다.</th>
	</c:if>
	<c:if test="${not empty acmList }">
		<table>
			<tr><th>숙소번호</th><th>이름</th><th>주소</th><th>전화</th><th>등록일</th><th>이동</th><th>수정</th><th>삭제</th></tr>
			<c:forEach var="acm" items="${acmList }">
				<tr><td>${acm.acmno}</td>
					<td>${acm.acm_name}</td>
					<td>${acm.acm_addr}</td>
					<td>${acm.acm_phone}</td> 
					<td>${acm.acm_regdate}</td>
					<%-- <td>${acm.acm_view}</td> --%>
					<td><a href="acmView.do?acmno=${acm.acmno}"><img src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EPoint Hand%3C/title%3E%3Cdesc%3EA line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer1' d='M22 41.4V6a4 4 0 0 1 4-4 4 4 0 0 1 4 4v22m-7.8 29.2L10.4 37.8a4 4 0 0 1 1.8-5.4 4 4 0 0 1 5.4 1.8l4.4 7.2M30 22a4 4 0 0 1 4-4 4 4 0 0 1 4 4v8m0-6a4 4 0 0 1 4-4 4 4 0 0 1 4 4v8' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3Cpath data-name='layer1' d='M22.2 57.2a10.1 10.1 0 0 0 8.6 4.8H44a10 10 0 0 0 10-10V28a4 4 0 0 0-4-4 4 4 0 0 0-4 4' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="Point Hand" style="width:18px;"></a></td>
					<td><a href="hostAcmUpdateForm.do?acmno=${acm.acmno}"><img src="data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 64 64' xmlns='http://www.w3.org/2000/svg' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EEdit%3C/title%3E%3Cdesc%3EA line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath stroke-width='2' stroke-miterlimit='10' stroke='%23202020' fill='none' d='M58.4 18.77l.941-.941c3.637-3.638 2.7-8.595-.941-12.233s-8.6-4.58-12.234-.94l-.941.941' data-name='layer2' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3Cpath d='M52.639 24.535l5.766-5.765L45.229 5.596l-5.764 5.764' stroke-width='2' stroke-miterlimit='10' stroke='%23202020' fill='none' data-name='layer1' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3Cpath d='M19.582 57.59l33.057-33.055L39.465 11.36 6.409 44.416 2.352 61.649l17.23-4.059zM6.409 44.416L19.582 57.59' stroke-width='2' stroke-miterlimit='10' stroke='%23202020' fill='none' data-name='layer1' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="Edit" style="width:18px;"></a></td>
					<td><a href="hostAcmDelete.do?acmno=${acm.acmno}"><img src="resources/img/delete.svg" style="width:18px;"></a></td></tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	
	<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="hostAcmList.do?pageNum=1">
							<img alt="" src="${path }/resources/img/left2.png">
						</a>
					</li>
					<li>
						<a href="hostAcmList.do?pageNum=${pb.startPage - 1 }">
							<img alt="" src="${path }/resources/img/left.png">
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="currentPage"><!-- <li class="active"> --><a href="hostAcmList.do?pageNum=${i }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li>
							<a href="hostAcmList.do?pageNum=${i }">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li>
						<a href="hostAcmList.do?pageNum=${pb.endPage + 1 }">
						<img alt="" src="${path }/resources/img/right.png">
						</a>
					</li>
					<li>
						<a href="hostAcmList.do?pageNum=${pb.totalPage}">
							<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
							<img alt="" src="${path }/resources/img/right2.png">
						</a>
					</li>
				</c:if>
			</ul>
		</div>
</div>
<div style=”clear:both;”></div>

</body>
</html>

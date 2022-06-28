<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/mystyle.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
</head>
<body>
<div class="container_wide">
		<jsp:include page="myMainMenu.jsp"/>
		<!-- 내용 -->
		<div class="content">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">작성한 리뷰가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
			<div class="my_title">내가 쓴 리뷰</div>
				<ul>
					<c:forEach var="myReview" items="${list}">
						<li class="rvlist">
							<c:if test="${myReview.rvpic != null }">
								<div class="rvpic">
								<img class="rvpic" alt="리뷰사진" src="resources/rvpic/${myReview.rvpic}">
								</div>
							</c:if>
							<c:if test="${myReview.rvpic == null }">
								<div class="rvpic" id="norv">
								리뷰사진이 없습니다.</div>
							</c:if>
							<div class="txt_rv">
								<p class="txt_rv2">작성일 ${myReview.rv_regdate }</p>
								<a href="acmView.do?acmno=${myReview.acmno}" class="cursor">
									<span class="txt_title2">${myReview.acm_name}</span>
									<span class="txt2">${myReview.rv_content}</span>
								</a>
								<!-- 별점 -->
								<span class="txt_star">
									<c:choose>
								  	<c:when test="${myReview.star_rate eq 5 }">★★★★★  	${myReview.star_rate }</c:when>
								  	<c:when test="${myReview.star_rate eq 4 }">★★★★☆ 	${myReview.star_rate }</c:when>
								  	<c:when test="${myReview.star_rate eq 3 }">★★★☆☆ 	${myReview.star_rate }</c:when>
								  	<c:when test="${myReview.star_rate eq 2 }">★★☆☆☆ 	${myReview.star_rate }</c:when>
								  	<c:when test="${myReview.star_rate eq 1 }">★☆☆☆☆ 	${myReview.star_rate }</c:when>
								  	<c:when test="${myReview.star_rate eq 0 }">☆☆☆☆☆ 	${myReview.star_rate }</c:when>
								  	</c:choose>   
								</span>
							<c:if test="${myReview.del eq 'y'}">
								<span class="txt2">이 리뷰는 삭제되었습니다.</span>
							</c:if>
							<c:if test="${myReview.del eq 'n'}">
								<div class="txt_rvbottom">		
										<a href="myReviewUpdateForm.do?rvno=${myReview.rvno}" class="mybtn">수정</a><p>
										<a href="myReviewDelete.do?rvno=${myReview.rvno }" class="mybtn"
										onclick="return confirm('정말 리뷰를 삭제 하실래요?ㅠㅠ');">삭제</a>
								</div>
							</c:if>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	<p>
	<div align="center">
	<ul class="pagination_bottom">
		<!-- 시작페이지가 pagePerBlock 보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="myReviewList.do?pageNum=1">
				<img alt="이전" src="${path }/resources/img/left2.png"></a></li>
			<li><a href="myReviewList.do?pageNum=${pb.startPage - 1 }">
				<img alt="이전" src="${path }/resources/img/left.png"></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li class="currentPage"><a href="myReviewList.do?pageNum=${i }">${i }</a></li>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="myReviewList.do?pageNum=${i }">${i }</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="myReviewList.do?pageNum=${pb.endPage + 1 }">
				<img alt="다음" src="${path }/resources/img/right.png"></a></li>
			<li><a href="myReviewList.do?pageNum=${pb.totalPage}">
				<img alt="다음" src="${path }/resources/img/right2.png"></a></li>
		</c:if>
		</ul>
	</div>
</div>		
</body>
</html>
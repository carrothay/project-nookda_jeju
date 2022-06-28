<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/acmrv.css">

<style>

.acmtext {
	color: var(--point-color);
	padding-right: 5px;
}

.rv_cnt_num {
	margin-left: 10px;
}

</style>
</head>
<body>
<div class="container_semiwide">
	<div class="rv_title">
		<b class="acmtext">${acm.acm_name}</b><b>의 전체 후기</b><b class="rv_cnt_num">${total} 건</b>
		<div class="star_avg_top">★★★★★ &nbsp;<span class="text">	${star_rate }</span> </div>
		<div class = "line"></div>
	</div>		
		<div class="rv_content">
		<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">작성된 리뷰가 없습니다.</span></li>
				</ul>
		</c:if>
			<div class="rv_list">
			<c:if test="${list.size() != 0}">
				<ul>
					<c:forEach var="acmReview" items="${list}">
						<li>
							<div class="first">
								<div class="info">
			                    	<span class="nickname">${acmReview.nickname }</span>
				                    <span class="star_avg">★★★★★ 	${acmReview.star_rate }</span>
				                    <span class="rv_date">${acmReview.rv_regdate }</span>
			                    </div>
		                    </div>
		                    <div class="rv_contents">
		                    <c:if test="${acmReview.rvpic != null }">
			                	<div class="rv_photo">
			                		<span class="rv_pic"><img alt="리뷰사진" src="resources/rvpic/${acmReview.rvpic}" width="200"></span>
			                	</div>	
			                	 <div class="rv_text">
			                		<span class="detail_txt review">${acmReview.rv_content }</span>	
			                	</div>
			                </c:if>
			                <c:if test="${acmReview.rvpic == null }">
			                	 <div class="rv_text">
			                		<span class="detail_txt review">${acmReview.rv_content }</span>	
			                	</div>
			                </c:if>
		                	</div>
		                	<div class = "line"></div>		
						</li>
					</c:forEach>
				</ul>
			</c:if>
			</div>
		</div>
	</div>
</body>
</html>
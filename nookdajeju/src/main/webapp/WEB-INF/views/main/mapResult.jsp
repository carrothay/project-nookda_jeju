<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/mainresult.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="container_wide">
<!-- content -->
		<div class="content">
			<div class="content_list">
				<c:if test="${mapSearchList.size() == 0}">
					<ul class="noItems">
						<li><span class="txt_title">검색 결과가 없습니다.</span></li>
					</ul>
				</c:if>
				<c:if test="${mapSearchList.size() != 0}">
					<div class="result_title">
						<span>NOW IN JEJU</span> <p><p> ${acm_loc} 숙소 목록</div>
					<div class="line"></div>
					<ul>
						<c:forEach var="mapList" items="${mapSearchList}">
							<li class = "maplist">
									<a href="acmView.do?acmno=${mapList.acmno}">
										<img src="resources/acmpic/${mapList.acmno}/1.jpg">
									</a>
										<div class="txt_maplist1"> 
											<span class = "txt_acmname" >${mapList.acm_name}</span>
											<span class = "txt_detail">${mapList.acm_type}</span>
											<span class = "txt_detail2">제주/${mapList.acm_loc}</span>
											<span class = "txt_detail2">₩
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${mapList.acm_price}"/>원</span>
											<span class = "txt_detail2">최대 ${mapList.acm_capa}명</span>
											<span class = "txt_detail3"><a href="acmView.do?acmno=${mapList.acmno}" class="ckbtn">지금 떠나기</a></span>
										</div>
							</li>	
						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div> <!-- container_inner -->
	</div>
</body>
</html>
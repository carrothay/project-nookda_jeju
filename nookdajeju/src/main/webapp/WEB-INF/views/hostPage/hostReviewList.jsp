<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/common_my.css">
<script type = "text/javascript">
	
	$(document).ready(function(){
		$(".none2").hide();
		$(".none").hide();
	});
	
	$(document).on("change","#accomodation",function(){
		var target = $('#accomodation option:selected').val();
			
		$(".none2").hide();
		$(".none").hide();
		$(".sel-acm").hide();
		$("#"+target).show();
		
		if($("#"+target).length == 0){
			$(".sel-acm").hide();
			$(".none").hide();
			$(".none2").show();
		}
		
		if(target == "none"){
			$(".sel-acm").hide();
			$(".none2").hide();
			$(".none").show();
		}
		
		if(target == "all"){
			$(".none2").hide();
			$(".none").hide();
			$(".sel-acm").show();	
		}
	});
</script>
</head>
<body>
<div class="container_wide">
	<div class="includes">
		<jsp:include page="hostMainMenu.jsp"></jsp:include>
	</div>
	<h2 class="title">리뷰 리스트</h2>
		<div class="searchDIV1">
			<!-- 숙소선택 -->
			<div class="bookingList_sort1">
				<select id="accomodation">
					<c:forEach var="acm1" items="${acmList }">
		       			<option value="${acm1.acm_name}">${acm1.acm_name}</option>
		       		</c:forEach>
		       		<option value="all" selected>모든 숙소</option>
				</select>
			</div>
		</div>
		
		<div class="content3">
			<c:if test="${empty acmList }">
				<div class="none1">
					등록된 숙소가 없습니다.
				</div>
			</c:if>
			<c:if test="${not empty acmList }">
				<!-- select 선택 전 -->
					<div class="none">
						<table><tr><td>
						확인을 원하는 숙소를 선택해 주세요.
						</td></tr></table>
					</div>
				<!-- 해당 숙소에 대한 리뷰가 없을 때 -->
				<div class="rv-none">
					<div class="none2">
						해당 숙소에 대한 리뷰가 없습니다.
					</div>
				</div>
				<!-- 해당 숙소에 대한 리뷰가 있을 때 -->
				<div class= "rv-con-div">
					<c:if test="${empty reviewList }">
						<div class="none3">
							작성된 리뷰가 없습니다.
						</div>
					</c:if>
					<c:if test="${not empty reviewList }">
						<c:forEach var="review" items="${reviewList }">
								<div id="${review.acm_name}" class="sel-acm" >
								<c:if test="${review.rvpic != null }">
										<div class="rvpic"><img src="resources/rvpic/${review.rvpic}"></div>
								</c:if>
								<c:if test="${review.rvpic == null }">
										<div class="rvpic">리뷰사진이 없습니다.</div>
								</c:if>
										<div class="rvcon">
											예약번호 : ${review.bookno} <div class="star">${review.rv_regdate}</div> <br>
											✔ ${review.acm_name}<div class="star"><span style="color:var(--point-color);">★★★★★</span>  ${review.star_rate}</div>
											<div class ="rvcon_con"><div class ="rvcon_con_txt">" ${review.rv_content} "</div></div><div class="star"><img style="width:12px;" src="data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 64 64' xmlns='http://www.w3.org/2000/svg' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EPencil%3C/title%3E%3Cdesc%3EA solid styled icon from Orion Icon Library.%3C/desc%3E%3Cpath d='M10.239 42.86L45.812 7.328l10.848 10.86L21.086 53.72z' fill='%23202020' data-name='layer1'%3E%3C/path%3E%3Cpath fill='%23202020' d='M59.492 15.358l2.259-2.258A7.674 7.674 0 1 0 50.9 2.248L48.639 4.5z' data-name='layer2'%3E%3C/path%3E%3Cpath d='M7.851 46.135L-.073 64.024 17.816 56.1l-9.965-9.965z' fill='%23202020' data-name='layer1'%3E%3C/path%3E%3C/svg%3E" alt="Pencil" />
											 By_${review.nickname}</div>
										</div>
								</div>
						</c:forEach>
					</c:if>
				</div>
			</c:if>
		</div>
</div>
	
</body>
</html>
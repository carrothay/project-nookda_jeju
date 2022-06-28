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
	href="${path }/resources/bootstrap/css/faq.css">
<style> 

.nonelist {
	margin-top: 150px;
	margin-bottom: 100px;
    width: 100%;
	text-align: center;
	font-family: 'nookda';
	
}

.none_text {
	color: #000;
	font-size: 16px; 
	padding: 50px;
}

.submit_box .faqbtn {
	width: 15%;
    background-color: var(--point-color);
    border: 1px solid var(--point-color);
    font-size: 14px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    text-align: center;
    position : relative;
    margin-bottom: 30px;
    float: left;
}

.submit_box .faqbtn:hover {
	width: 15%;
    background-color: #fff;
    border: 1px solid var(--point-color);
    color: var(--point-color);
    position : relative;
    float: left;
}

ul, li {
	list-style: none;
	padding: 0;
	margin: 0;
}

</style>
<script>    
	// html dom이 다 로딩된 후 실행된다.    
	$(document).ready(function(){
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	        $(".textmenu>a").click(function(){
	            // 현재 클릭한 태그가 a 이기 때문에
	            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
	            $(this).next("ul").toggleClass("hide");
	        });
	    });
</script>
</head>

<body>

<div class="container_semiwide">
<h2 class="title">FAQ</h2>
	<div class="searchDIV">
		<form action="faqList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="searchkey">
				<c:forTokens var="sh" items="fname,faq_content" delims="," varStatus="i">
					<c:if test="${sh == faq.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != faq.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			
			<input class="searchvalue" type="text" name="keyword" value="${faq.keyword }" class="inputUnderLine">
			<button type="submit" value="확인">
				<img alt="" src="${path }/resources/img/search2.svg" width="30px" height="30px">
			</button>
		</form>
	</div>  
	<!-- FAQ 리스트  -->
	<div class="faqList">
		<div class="nonelist" align="center">
			<c:if test="${empty faqList }">
				<b class="none_text">등록된 질문이 없습니다.</b>
			</c:if>
		</div>
		<c:if test="${not empty faqList }">
			<c:forEach var="faq" items="${faqList }">
				<ul>
					<li class="textmenu">
						 <c:if test="${memail == 'admin' }">
							<a href="faqDelete.do?fno=${faq.fno }" class="smbtn">삭제</a>
							<a href="faqUpdateForm.do?fno=${faq.fno }" class="smbtn">수정</a>
						 </c:if>
					<a class="faqname">${faq.fname }</a>
						<ul class="hide">
							 <li class="faq_text">${faq.faq_content }</li>
						</ul>
					</li>
				</ul>
			</c:forEach>
		</c:if>
	</div>
	<div align="center">
		<ul class="pagination_bottom">
			<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
			<c:if test="${pb.startPage > pb.pagePerBlock }">
				<li>
					<a href="faqList.do?pageNum=1&search=${faq.search }&keyword=${faq.keyword }">
						<img alt="" src="${path }/resources/img/left2.png">
					</a>
				</li>
				<li>
					<a href="faqList.do?pageNum=${pb.startPage - 1 }&search=${faq.search }&keyword=${faq.keyword }">
						<img alt="" src="${path }/resources/img/left.png">
					</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
			<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
				<c:if test="${pb.currentPage == i }">
					<li class="currentPage">
						<a href="faqList.do?pageNum=${i }&search=${faq.search }&keyword=${faq.keyword }">${i }</a>
					</li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li>
						<a href="faqList.do?pageNum=${i }&search=${faq.search }&keyword=${faq.keyword }">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			
			<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
			<c:if test="${pb.endPage < pb.totalPage }">
				<li>
					<a href="faqList.do?pageNum=${pb.endPage + 1 }&search=${faq.search }&keyword=${faq.keyword }">
						<img alt="" src="${path }/resources/img/right.png">
					</a>
				</li>
				<li>
					<a href="faqList.do?pageNum=${pb.totalPage}&search=${faq.search }&keyword=${faq.keyword }">
						<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<img alt="" src="${path }/resources/img/right2.png">
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 등록 버튼 -->
	<div class="submit_box">
		<c:if test="${memail == 'admin' }">
			<a href="faqWriteForm.do?fno=0" class="faqbtn">등록하기</a>
		</c:if>
	</div>
</div>
</body>
</html>
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

.searchDIV {
	padding-top: 20px;
	display: inline;
	text-align: center;
	padding: 10px;
	 margin-bottom: 30px;
}

.searchDIV button {
	border: none; 
	background-color: transparent;
	cursor: pointer;
	background: none;
}

.searchkey {
    border: none;
    width: 100px;
    height: 35px;
    font-size: 14px;
    color: var(--point-color);
    border-bottom: 1px solid var(--point-color);
    margin-bottom: 16px;
    outline: 0;
    text-align: center;
}

.searchvalue {
    border: none;
    width: 400px;
    height: 35px;
    font-size: 14px;
    color : var(--point-color);
    border-bottom: 1px solid var(--point-color);
    margin-bottom: 12px;
    outline: 0;
}

.container_wide {
	width: 85%;
}

.adtable {
	width: 85%;
}

.adtable td {
	white-space: inherit;
	overflow: visible;
}

.acmmove {
	cursor: pointer;
}

.acmmove:hover {
	cursor: pointer;
	color: var(--point-color);
}

</style>
</head>

<body>
<div class="container_wide">
<!-- Menu -->
<jsp:include page="adminMainMenu.jsp"></jsp:include>
<h2 class="title">숙소 목록</h2>
	<div class="searchDIV">
		<form action="adminAcmList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="searchkey">
				<c:forTokens var="sh" items="acm_name,acm_addr,acm_phone,acm_email,acm_type" delims="," varStatus="i">
					<c:if test="${sh == acm.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != acm.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			
			<input class="searchvalue" type="text" name="keyword" value="${acm.keyword }" class="inputUnderLine">
			<button type="submit"  >
				<img alt="" src="${path }/resources/img/search2.svg" width="30px" height="30px">
			</button>
		</form>
		</div>  
	<div class="tableDIV">
	<table class="adtable">
		<tr>
			<th class="col-md-3 text-center">숙소 번호</th>
			<th class="col-md-4 text-center">숙소명</th>
			<th class="col-md-6 text-center">주소</th>
			<th class="col-md-5 text-center">대표 번호</th>
			<th class="col-md-4 text-center">대표 이메일</th>
			<th class="col-md-3 text-center">숙소 타입</th>
			<th class="col-md-4 text-center">등록일</th>
			<th class="col-md-3 text-center">회원 번호</th>
			<th class="col-md-2 text-center">삭제</th>
		</tr>
			<c:if test="${empty adminAcmList }">
				<tr class="nonelist">
					<th colspan="9" class="text-center">숙소 정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty adminAcmList }">
				<c:forEach var="acm" items="${adminAcmList }">
				<tr>
					<td class="col-md-1 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
						<td class="col-md-4 text-center acmmove" onclick="location.href='acmView.do?acmno=${acm.acmno}'">${acm.acm_name }</td>
						<td class="col-md-6 text-center">${acm.acm_addr }</td>
						<td class="col-md-5 text-center">${acm.acm_phone }</td>
						<td class="col-md-4 text-center">${acm.acm_email }</td>
						<td class="col-md-3 text-center">${acm.acm_type }</td>
						<td class="col-md-4 text-center">${acm.acm_regdate }</td>
						<td class="col-md-2 text-center">${acm.mno }</td>
						<c:if test="${acm.del == 'n' }">
							<td class="text-center">
								<a href="adminAcmDel.do?acmno=${acm.acmno }&pageNum=${pageNum }">
									<img alt="" src="${path }/resources/img/delete.svg" width="25px" height="25px">
								</a>
							</td>
						</c:if>
						<c:if test="${acm.del == 'y' }">
							<td class="text-center">
								<a href="adminAcmDelBack.do?acmno=${acm.acmno }&pageNum=${pageNum }">
									<img alt="" src="${path }/resources/img/undo.svg" width="25px" height="25px">
								</a>
							</td>
						</c:if>
					</tr>  
				</c:forEach>
				<!-- <tr><td colspan="7"></td></tr> -->
			</c:if>
		</table>
		</div>
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="adminAcmList.do?pageNum=1&search=${acm.search }&keyword=${acm.keyword }">
							<img alt="" src="${path }/resources/img/left2.png">
						</a>
					</li>
					<li>
						<a href="adminAcmList.do?pageNum=${pb.startPage - 1 }&search=${acm.search }&keyword=${acm.keyword }">
							<img alt="" src="${path }/resources/img/left.png">
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="currentPage"><a href="adminAcmList.do?pageNum=${i }&search=${acm.search }&keyword=${acm.keyword }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li>
							<a href="adminAcmList.do?pageNum=${i }&search=${acm.search }&keyword=${acm.keyword }">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li>
						<a href="adminAcmList.do?pageNum=${pb.endPage + 1 }&search=${acm.search }&keyword=${acm.keyword }">
							<img alt="" src="${path }/resources/img/right.png">
						</a>
					</li>
					<li>
						<a href="adminAcmList.do?pageNum=${pb.totalPage }&search=${acm.search }&keyword=${acm.keyword }">
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
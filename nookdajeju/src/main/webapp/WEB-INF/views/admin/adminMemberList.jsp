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

</style>
</head>

<body>
<div class="container_wide">
<!-- Menu -->
<jsp:include page="adminMainMenu.jsp"></jsp:include>
<h2 class="title">회원 목록</h2>
	<div class="searchDIV">
		<form action="adminMemberList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="searchkey">
				<c:forTokens var="sh" items="memail,mlastname,mfstname,nickname,mphone" delims="," varStatus="i">
					<c:if test="${sh == member.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != member.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			
			<input class="searchvalue" type="text" name="keyword" value="${member.keyword }" class="inputUnderLine">
			<button type="submit" value="확인">
				<img alt="" src="${path }/resources/img/search2.svg" width="30px" height="30px">
			</button>
		</form>
		</div>  
	<div class="tableDIV">
	<table class="adtable">
		<tr>   
			<th class="col-md-3 text-center">회원 번호</th>
			<th class="col-md-5 text-center">이메일</th>
			<th class="col-md-2 text-center">성</th>
			<th class="col-md-3 text-center">이름</th>
			<th class="col-md-3 text-center">닉네임</th>
			<th class="col-md-5 text-center">휴대폰 번호</th>
			<th class="col-md-4 text-center">가입일</th>
			<th class="col-md-3 text-center">호스트</th>
			<th class="col-md-3 text-center">탈퇴</th>
		</tr>
			<c:if test="${empty mbList }">
				<tr class="nonelist">
					<th colspan="9" class="text-center">회원 정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty mbList }">
				<c:forEach var="member" items="${mbList }">
				<tr>
					<td class="col-md-1 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
						<td class="col-md-5 text-center">${member.memail }</td>
						<td class="col-md-2 text-center">${member.mlastname }</td>
						<td class="col-md-3 text-center">${member.mfstname }</td>
						<td class="col-md-3 text-center">${member.nickname }</td>
						<td class="col-md-5 text-center">${member.mphone }</td>
						<td class="col-md-4 text-center">${member.mregdate }</td>
						<td class="col-md-2 text-center">${member.mhost }</td>
						<c:if test="${member.del == 'n' }">
							<c:if test="${member.memail == 'admin' }">
								<td class="col-md-2 text-center">관리자</td>
							</c:if>
							<c:if test="${member.memail != 'admin' }">
								<td class="text-center">
									<a href="adminMemberDel.do?memail=${member.memail }&pageNum=${pageNum }">
										<img alt="" src="${path }/resources/img/delete.svg" width="25px" height="25px">
									</a>
								</td>
							</c:if>
						</c:if>
						<c:if test="${member.del == 'y' }">
							<td class="text-center">
								<a href="adminMemDelBack.do?memail=${member.memail }&pageNum=${pageNum }">
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
						<a href="adminMemberList.do?pageNum=1&search=${member.search }&keyword=${member.keyword }">
							<img alt="" src="${path }/resources/img/left2.png">
						</a>
					</li>
					<li>
						<a href="adminMemberList.do?pageNum=${pb.startPage - 1 }&search=${member.search }&keyword=${member.keyword }">
							<img alt="" src="${path }/resources/img/left.png">
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="currentPage"><a href="adminMemberList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li>
							<a href="adminMemberList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li>
						<a href="adminMemberList.do?pageNum=${pb.endPage + 1 }&search=${member.search }&keyword=${member.keyword }">
							<img alt="" src="${path }/resources/img/right.png">
						</a>
					</li>
					<li>
						<a href="adminMemberList.do?pageNum=${pb.totalPage }&search=${member.search }&keyword=${member.keyword }">
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
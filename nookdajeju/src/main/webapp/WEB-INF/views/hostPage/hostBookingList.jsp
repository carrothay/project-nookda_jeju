<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/common_my.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/hostyle.css">
<script type = "text/javascript">

	//(나중에 지울것) 제이쿼리 잘 
	/* if (typeof jQuery == 'undefined') {
	alert("제이쿼리 잘 안됨");
	}else{
	alert("제이쿼리 잘 됨1");
	} */
	
	// 선택전 list default
	$(document).ready(function(){
        $(".none2").hide(); // 예약없음
        $(".none").hide(); // 선택전
     });
  
	// 예약중,취소,완료,전체 토글 default - 예약중(토글버튼에 highlight 필요함)
	$(document).ready(function(){
		 $("#btn1").css("background-color","#F5D0A9");
	     $('.t1').show(); 
	     $('.t2').hide(); 
	     $('.t3').hide();
	     $('.t4').hide(); 
	   });
	
	$(document).on("change","#accomodation",function(){
        var target = $('#accomodation option:selected').val();
        $(".none2").hide();
        $(".none").hide();
        $(".sel-acm1").hide();
        $("#"+target).show();
         
       if($("#"+target).length == 0){
           $(".sel-acm1").hide();
           $(".none").hide();
           $(".none2").show();
        }
        
        if(target == "all"){
           $(".none2").hide();
           $(".none").hide();
           $(".sel-acm1").show();   
        }
        
      });
  
    
     // 예약중 리스트 토글
     $(document).on("click","#btn1",function(){
       $("#btn1").css("background-color","#F5D0A9");
       $("#btn2").css("background-color","white");
       $("#btn3").css("background-color","white");
       $("#btn4").css("background-color","white");
      	$('.t1').show(); 
        $('.t2').hide(); 
        $('.t3').hide(); 
        $('.t4').hide();
     });
     
     // 예약취소 리스트 토글
     $(document).on("click","#btn2",function(){
       $("#btn1").css("background-color","white");
       $("#btn2").css("background-color","#F5D0A9");
       $("#btn3").css("background-color","white");
       $("#btn4").css("background-color","white");
       $('.t1').hide(); 
       $('.t2').show(); 
       $('.t3').hide(); 
       $('.t4').hide(); 
     });
     
     // 사용완료 리스트 토글
     $(document).on("click","#btn3",function(){
       $("#btn1").css("background-color","white");
       $("#btn2").css("background-color","white");
       $("#btn3").css("background-color","#F5D0A9");
       $("#btn4").css("background-color","white");
       $('.t1').hide(); 
       $('.t2').hide(); 
       $('.t3').show(); 
       $('.t4').hide(); 
     });
     
     // 전체 리스트 토글
     $(document).on("click","#btn4",function(){
       $("#btn1").css("background-color","white");
       $("#btn2").css("background-color","white");
       $("#btn3").css("background-color","white");
       $("#btn4").css("background-color","#F5D0A9");
        $('.t1').hide(); 
        $('.t2').hide(); 
        $('.t3').hide(); 
        $('.t4').show(); 
     });
    
</script>
</head>
<body>
<div class="container_wide">
	<div class="includes">
		<jsp:include page="hostMainMenu.jsp"></jsp:include>
	</div>
	<h2 class="title">예약 리스트</h2>
			<div class="tableDIV">
		<c:if test="${empty acmList1 }">
			<div class="before">
				<div class="none1" style="font-size:14px;">
						등록된 숙소가 없습니다.
				</div>
			</div>
		</c:if>
		<c:if test="${not empty acmList1 }">
		
			<div class="searchDIV1">
			<!-- 숙소 선택 -->
			<div class="bookingList_sort1">
				<select id="accomodation">
					<c:forEach var="acm1" items="${acmList1 }">
	        			<option value="${acm1.acmno}">${acm1.acm_name}</option>
	        		</c:forEach>
	        		<option value="all" selected>모든 숙소</option>
				</select><br><br>
			</div>
		
			<!-- 예약상태 선택 -->
			<div class="bookingList_sort2">
				<span class="#btn_toggle" id="btn1" style="cursor:pointer;">&nbsp;예약중&nbsp;</span>&nbsp;&nbsp;|&nbsp;&nbsp;
				<span class="#btn_toggle" id="btn2" style="cursor:pointer;">&nbsp;예약취소&nbsp;</span>&nbsp;&nbsp;|&nbsp;&nbsp;
				<span class="#btn_toggle" id="btn3" style="cursor:pointer;">&nbsp;사용완료&nbsp;</span>&nbsp;&nbsp;|&nbsp;&nbsp; 
				<span class="#btn_toggle" id="btn4" style="cursor:pointer;">&nbsp;전체예약&nbsp;</span>
			</div>
			<div style="clear:both;"></div>
			</div>
				
			<!-- <div class="tableDIV"> -->
			<!-- 숙소 선택 전 -->
			<div class="none">
				<table>
					<tr><th class="th1">예약번호</th>
										<th class="th2">이름</th>
										<th class="th3">연락처</th>
										<th class="th4">예약일</th>
										<th class="th5">체크인</th>
										<th class="th6">체크아웃</th>
										<th class="th7">인원수</th>
										<th class="th8">총가격</th>
										<th class="th9">결제수단</th>
										<th class="th10">요청사항</th>
										<th class="th11">예약현황</th>
										<th class="th12">취소</th></tr>
					<tr><td colspan="12">확인을 원하는 숙소를 선택해 주세요.</td></tr>
				</table>
			</div>
			
			<!-- 해당 숙소에 대한 예약이 없을 때 -->
			<div class="none2">
				<table>
					<tr><th class="th1">예약번호</th>
										<th class="th2">이름</th>
										<th class="th3">연락처</th>
										<th class="th4">예약일</th>
										<th class="th5">체크인</th>
										<th class="th6">체크아웃</th>
										<th class="th7">인원수</th>
										<th class="th8">총가격</th>
										<th class="th9">결제수단</th>
										<th class="th10">요청사항</th>
										<th class="th11">예약현황</th>
										<th class="th12">취소</th></tr>
					<tr><td colspan="12">해당 숙소에 대한 예약이 없습니다.</td></tr>
				</table>
			</div>
		
			<!-- 해당 숙소에 대한 예약이 있을 때 -->
			<div class= "content2">
				<c:if test="${empty bookingList4 }">
					<table>
						<tr><th class="th1">예약번호</th>
										<th class="th2">이름</th>
										<th class="th3">연락처</th>
										<th class="th4">예약일</th>
										<th class="th5">체크인</th>
										<th class="th6">체크아웃</th>
										<th class="th7">인원수</th>
										<th class="th8">총가격</th>
										<th class="th9">결제수단</th>
										<th class="th10">요청사항</th>
										<th class="th11">예약현황</th>
										<th class="th12">취소</th></tr>
						<tr><td colspan="12">예약이 없습니다.</td></tr>
					</table>
				</c:if>
			
				<c:if test="${not empty bookingList4 }">
					<c:forEach var="acm" items="${acmList1 }">
					<div class="sel-acm1" id="${acm.acmno}">
							<h3 class="title2"><img src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EPin%3C/title%3E%3Cdesc%3EA color styled icon from Orion Icon Library.%3C/desc%3E%3Ccircle data-name='layer1' cx='32' cy='22' r='12' fill='%23f26161'%3E%3C/circle%3E%3Cpath data-name='opacity' d='M35.3 31.8A12 12 0 0 1 27.1 11a12 12 0 1 0 13.1 19.7 11.9 11.9 0 0 1-4.9 1.1z' fill='%23000032' opacity='.2'%3E%3C/path%3E%3Ccircle data-name='stroke' cx='32' cy='22' r='12' fill='none' stroke='%232e4369' stroke-linecap='round' stroke-linejoin='round' stroke-width='2'%3E%3C/circle%3E%3Cpath data-name='stroke' fill='none' stroke='%232e4369' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M32 34v20'%3E%3C/path%3E%3C/svg%3E" alt="Pin" style="width:23px;"/>&nbsp;${acm.acm_name}</h3>
							<!-- 예약중 -->
							<div class="t1">
								<c:set var="i" value="0"/>
									<table>
									<tr><th class="th1">예약번호</th>
										<th class="th2">이름</th>
										<th class="th3">연락처</th>
										<th class="th4">예약일</th>
										<th class="th5">체크인</th>
										<th class="th6">체크아웃</th>
										<th class="th7">인원수</th>
										<th class="th8">총가격</th>
										<th class="th9">결제수단</th>
										<th class="th10">요청사항</th>
										<th class="th11">예약현황</th>
										<th class="th12">취소</th></tr>
										<c:forEach var="b1" items="${bookingList1}">
										<c:set var="a" value="${acm.acmno}"/>
										<c:set var="b1n" value="${b1.acmno}"/>
											<c:if test="${a==b1n}">
												<tr><td>${b1.bookno}</td>
													<td>${b1.mlastname} ${b1.mfstname}</td>
													<td>${b1.mphone}</td>
													<td>${b1.bookdate}</td>
													<td>${b1.checkin}</td>
													<td>${b1.checkout}</td>
													<td>${b1.guestcnt}인</td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${b1.bookprice}"/>원</td>
													<td>${b1.payby}</td>
													<td class="tdR" title="${b1.request}">${b1.request}</td>
													<td>예약중</td>
													<td><a href="hostBookingDelete.do?bookno=${b1.bookno}" ><img src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EClose%3C/title%3E%3Cdesc%3EA line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer1' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' d='M41.999 20.002l-22 22m22 0L20 20' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="Close" style="width:30px;"/></a></td></tr>
													<c:set var="i" value="${i+1}"/>
											</c:if>
										</c:forEach>
											<c:if test="${i<1}">
												<tr><td colspan="12">예약이 없습니다.</td></tr>
											</c:if>
									</table>
							</div>
							
							
							<!-- 취소예약 -->
							<div class="t2">
								<c:set var="i" value="0"/>
									<table>
									<tr><th class="th1">예약번호</th>
										<th class="th2">이름</th>
										<th class="th3">연락처</th>
										<th class="th4">예약일</th>
										<th class="th5">체크인</th>
										<th class="th6">체크아웃</th>
										<th class="th7">인원수</th>
										<th class="th8">총가격</th>
										<th class="th9">결제수단</th>
										<th class="th10">요청사항</th>
										<th class="th11">예약현황</th>
										<th class="th12">취소</th></tr>
										<c:forEach var="b2" items="${bookingList2}">
										<c:set var="a" value="${acm.acmno}"/>
										<c:set var="b2n" value="${b2.acmno}"/>
											<c:if test="${a==b2n}">
												<tr><td>${b2.bookno}</td>
													<td>${b2.mlastname} ${b2.mfstname}</td>
													<td>${b2.mphone}</td>
													<td>${b2.bookdate}</td>
													<td>${b2.checkin}</td>
													<td>${b2.checkout}</td>
													<td>${b2.guestcnt}인</td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${b2.bookprice}"/>원</td>
													<td>${b2.payby}</td>
													<td class="tdR" title="${b2.request}">${b2.request}</td>
													<td>취소</td>
													<td><a href="hostBookingDelete.do?bookno=${b2.bookno}" ><img src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EClose%3C/title%3E%3Cdesc%3EA line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer1' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' d='M41.999 20.002l-22 22m22 0L20 20' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="Close" style="width:30px;"/></a></td></tr>
													<c:set var="i" value="${i+1}"/>
											</c:if>
										</c:forEach>
											<c:if test="${i<1}">
												<tr><td colspan="12">예약이 없습니다.</td></tr>
											</c:if>
									</table>
							</div>
							
							<!-- 예약취소 -->
							<div class="t3">
								<c:set var="i" value="0"/>
									<table>
									<tr><th class="th1">예약번호</th>
										<th class="th2">이름</th>
										<th class="th3">연락처</th>
										<th class="th4">예약일</th>
										<th class="th5">체크인</th>
										<th class="th6">체크아웃</th>
										<th class="th7">인원수</th>
										<th class="th8">총가격</th>
										<th class="th9">결제수단</th>
										<th class="th10">요청사항</th>
										<th class="th11">예약현황</th>
										<th class="th12">취소</th></tr>
										<c:forEach var="b3" items="${bookingList3}">
										<c:set var="a" value="${acm.acmno}"/>
										<c:set var="b3n" value="${b3.acmno}"/>
											<c:if test="${a==b3n}">
												<tr><td>${b3.bookno}</td>
													<td>${b3.mlastname} ${b3.mfstname}</td>
													<td>${b3.mphone}</td>
													<td>${b3.bookdate}</td>
													<td>${b3.checkin}</td>
													<td>${b3.checkout}</td>
													<td>${b3.guestcnt}인</td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${b3.bookprice}"/>원</td>
													<td>${b3.payby}</td>
													<td class="tdR" title="${b3.request}">${b3.request}</td>
													<td>완료</td>
													<td><a href="hostBookingDelete.do?bookno=${b3.bookno}" ><img src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EClose%3C/title%3E%3Cdesc%3EA line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer1' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' d='M41.999 20.002l-22 22m22 0L20 20' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="Close" style="width:30px;"/></a></td></tr>
													<c:set var="i" value="${i+1}"/>
											</c:if>
										</c:forEach>
											<c:if test="${i<1}">
												<tr><td colspan="12">예약이 없습니다.</td></tr>
											</c:if>
									</table>
							</div>
							
							<!-- 전체예약 -->
							<div class="t4">
								<c:set var="i" value="0"/>
									<table>
									<tr><th class="th1">예약번호</th>
										<th class="th2">이름</th>
										<th class="th3">연락처</th>
										<th class="th4">예약일</th>
										<th class="th5">체크인</th>
										<th class="th6">체크아웃</th>
										<th class="th7">인원수</th>
										<th class="th8">총가격</th>
										<th class="th9">결제수단</th>
										<th class="th10">요청사항</th>
										<th class="th11">예약현황</th>
										<th class="th12">취소</th></tr>
										<c:forEach var="b4" items="${bookingList4}">
										<c:set var="a" value="${acm.acmno}"/>
										<c:set var="b4n" value="${b4.acmno}"/>
											<c:if test="${a==b4n}">
												<tr><td>${b4.bookno}</td>
													<td>${b4.mlastname} ${b4.mfstname}</td>
													<td>${b4.mphone}</td>
													<td>${b4.bookdate}</td>
													<td>${b4.checkin}</td>
													<td>${b4.checkout}</td>
													<td>${b4.guestcnt}인</td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${b4.bookprice}"/>원</td>
													<td>${b4.payby}</td>
													<td class="tdR" title="${b4.request}">${b4.request}</td>
													<td><c:set var="bbs4" value="${b4.bs}"/>
													<c:if test="${bbs4=='y'}">
														예약중
													</c:if>
													<c:if test="${bbs4=='n'}">
														취소
													</c:if>
													<c:if test="${bbs4=='z'}">
														완료
													</c:if></td>
													<td><a href="hostBookingDelete.do?bookno=${b4.bookno}" ><img src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EClose%3C/title%3E%3Cdesc%3EA line styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer1' fill='none' stroke='%23202020' stroke-miterlimit='10' stroke-width='2' d='M41.999 20.002l-22 22m22 0L20 20' stroke-linejoin='round' stroke-linecap='round'%3E%3C/path%3E%3C/svg%3E" alt="Close" style="width:30px;"/></a></td></tr>
													<c:set var="i" value="${i+1}"/>
											</c:if>
										</c:forEach>
											<c:if test="${i<1}">
												<tr><td colspan="12">예약이 없습니다.</td></tr>
											</c:if>
									</table>
							</div>
						</div>
					</c:forEach>
				
				</c:if>	
			</div>
		</c:if>
	</div>
</div>
<div style="clear:both;"></div>
</body>
</html>
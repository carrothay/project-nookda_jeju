<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<c:set var="memail" value='${sessionScope.memail}'></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/acm.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/acmrv.css">
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.number.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId="></script>
<script type="text/javascript">
/* 천단위 콤마 & 지도 API*/
$(document).ready(function(){
	var nData = addComma(${acm2.acm_price});
	$(".price").text(nData+"원 / 1박");
	
	var map =  new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(${acm2.latitude},${acm2.longtitude}),
	    zoom: 13
	});
	var marker = new naver.maps.Marker({
		map: map,
		position: new naver.maps.LatLng(${acm2.latitude},${acm2.longtitude})
	});

// 	document.getElementById("defaultOpen").click();
});
function addComma(num){
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp,',');
}

/* 이미지 슬라이드 */
$(function() {
	  var slideWidth =  480;
	  var slideHeight =  360;
	  
	  function moveLeft() {
	    $(".slider ul").stop().animate({
	      left: + slideWidth
	    }, function() {
	      $(".slider ul li:last-child").prependTo($(".slider ul"));
	      $(".slider ul").css("left","");
	    });
	  }
	  function moveRight() {
	    $(".slider ul").stop().animate({
	      left: - slideWidth
	    }, function() {
	      $(".slider ul li:first-child").appendTo($(".slider ul"));
	      $(".slider ul").css("left","");
	    });
	  }

	  $(".next").on("click",function(){ moveRight(); });
	  $(".prev").on("click",function(){ moveLeft(); });
	  
/*  	  $('.slider').hover(
		function(){ $(this).addClass('active');}, 
		function(){ $(this).removeClass('active'); }
	  ); */
			
	});

/* 리뷰 평균 별점 */
$(document).ready(function(){
	var score = ratingToPercent(${star_rate});
	$(".avg-star").text(score);
	
	var calwidth = score + '%';
	$(".star-ratings-fill").css('width',calwidth);
});
function ratingToPercent(num) {
    var score = (num * 20 + 1.5);
    return score;
}

/* 탭 수정 후 */
$(document).ready(function(){
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		localStorage.setItem('tab_id', tab_id);
	});
	  var last_id = localStorage.getItem('tab_id');
	  if (last_id) {
	    $('ul.tab li').removeClass('current');
	    $('.tab-content').removeClass('current');
// 			$(".tab li").eq(Number(last_id.match(/\d+/)[0])-1).addClass('current');
			$(".tab li").eq(1).addClass('current');
	    $("#" + last_id).addClass('current');
	  };
});
/* 탭 수정 전 */
// function openP(evt, pageName) {
// 	  // Declare all variables
// 	  var i, tabcontent, tablinks;

// 	  // Get all elements with class="tabcontent" and hide them
// 	  tabcontent = document.getElementsByClassName("tabcontent");
// 	  for (i = 0; i < tabcontent.length; i++) {
// 	    tabcontent[i].style.display = "none";
// 	  }

// 	  // Get all elements with class="tablinks" and remove the class "active"
// 	  tablinks = document.getElementsByClassName("tablinks");
// 	  for (i = 0; i < tablinks.length; i++) {
// 	    tablinks[i].className = tablinks[i].className.replace(" active", "");
// 	  }

// 	  // Show the current tab, and add an "active" class to the button that opened the tab
// 	  document.getElementById(pageName).style.display = "block";
// 	  evt.currentTarget.className += " active";
// };

		function likeUnlike(name) {
			$.post('acmLikeUnlike.do', {acmno:${acm2.acmno}, name: name }, function(data) {
				if (data == "1"){
					$('#unlikesimg').attr('src', '${path}/resources/img/orange2.svg');
					location.reload();
				} else {
					$('#likesimg').attr('src', '${path}/resources/img/orange.svg');
					location.reload();
				}		
			});		
		};
		
		//session check
		function sessionChk(name) {
			var chk = "${empty memail}";
			if (chk == "true") {
				var con = confirm("로그인이 필요합니다.");
				if (con) {				
					location.href="loginForm.do";
				}
			} else {
				if(name == 'booking'){
				location.href="bookingForm.do?acmno=${acm2.acmno}&mno=${member.mno}";
				}
			}
		}

</script>
</head>
<body>
<div class="container_acmwide" >
	<div class="top">
		<div class="top-right">
			<span class="price" ></span>
				<c:if test="${guestcnt == null or checkin == null or checkout == null }">
					<a href="bookingForm.do?acmno=${acm2.acmno }" class="btn" id="goBbtn" onclick="sessionChk('booking')">예약하기</a>
				</c:if>
				<c:if test="${guestcnt != null or checkin != null or checkout != null }">
					<a href="bookingForm.do?acmno=${acm2.acmno }&guestcnt=${guestcnt}&checkin=${checkin}&checkout=${checkout}" class="btn" id="goBbtn" onclick="sessionChk('booking')">예약하기</a>
				</c:if>
		</div>
	</div>
	<div class="line"></div>
	<div class="left">
		<div class="acm_name">${acm2.acm_name }</div>
		<!-- 좋아요 -->
		<div class="like_box">
			<c:if test="${empty memail }">
				<img alt="안좋아요" src="${path }/resources/img/orange.svg" onclick="sessionChk()">
			</c:if>
			<c:if test="${!empty memail }">
				<c:choose>
					<c:when test="${result eq 'y' }"><img id="likesimg" alt="좋아요" src="${path }/resources/img/orange2.svg" onclick="likeUnlike('unlike')"> </c:when>
					<c:otherwise><img id="unlikesimg" alt="안좋아요" src="${path }/resources/img/orange.svg" onclick="likeUnlike('like')"></c:otherwise>
				</c:choose>
			</c:if>
		</div>
		<!-- 호스트프로필 -->
		<div class="host_box">by 호스트: ${acm2.nickname }
			<c:if test="${hostchk == -1 }">
		  		<a href="#" onclick="window.open('hostProfile.do?nickname=${acm2.nickname}' ,'width=400, height=430')">연락하기</a>
			</c:if>
		</div>
		<div class="letter_box">
			<div class="acm_loc">${acm2.acm_loc }</div>
			<div class="acmtype">${acm2.acm_type }	 / ${acm2.acm_bedtype }</div>
			<div class="size">면적 : ${acm2.acm_size }</div>
			<div class="view_checkin">체크인 : ${acm2.acm_checkin }</div>
			<div class="view_checkout">체크아웃 : ${acm2.acm_checkout }</div>
			<div class="acmcapa">수용 인원 : ${acm2.acm_capa } 명</div>
		</div>
	</div>
	<!-- 이미지 슬라이드 -->
	<div class="right">	
		<div class="slider">
			  <a href="#0" class="next control">></a>
			  <a href="#0" class="prev control"><</a>
			 <ul>
			 	<c:forEach var="aplist" items="${aplist }">
				    <li>
				    	<img alt="acm_img" src="${path }/resources/${aplist.acm_picurl}/${aplist.acm_picname }">
				    </li>
			    </c:forEach>
			  </ul>
		</div>
	</div>
 </div>
 
 <!-- tab -->
 <div class="tab_box">
 	<!-- tab button -->
 	<div class="tab">
		<ul class="tabs">
			<li class="tablinks current" data-tab="Content">상세정보</li>
			<li class="tablinks" data-tab="Review">리뷰</li>
		</ul>
	</div>

<!-- 탭 수정 전 -->
<!--  	<div class="tab"> -->
<!--  		<button class="tablinks" onclick="openP(event, 'Content')" id="defaultOpen">상세정보</button> -->
<!--  		<button class="tablinks" onclick="openP(event, 'Review')">리뷰</button> -->
<!--  	</div> -->
 	
 	<!-- tab content -->
<!--  수정 전 <div id="Content" class="tabcontent contab"> -->
 	<div id="Content" class="tab-content current">
 		<div id="con1">
			<!-- 숙소 소개글 -->
			<div class="name_box">
				<div class="name">${acm2.acm_name }</div><br><br>
				<img id="slash" alt="" src="${path }/resources/img/slash.png" width='60px'><br><br><br>
			</div>
			<div class="content">${acm2.acm_content }</div>
		
			<!-- 지도API -->
			<div class="map_box">
				<div id="map"></div>
			</div>
		
			<!-- 숙소 기본정보 -->
			<table class="info_box">
				<tr>
					<th><img alt="info" src="${path }/resources/img/location2.svg" class="address"> 주소</th>
					<td>${acm2.acm_addr }</td>
				</tr>
				<tr>
					<th><img alt="info" src="${path }/resources/img/call.svg">&nbsp; 전화번호</th>
					<td>${acm2.acm_phone }</td>
				</tr>
				<tr>
					<th><img alt="info" src="${path }/resources/img/email.svg">&nbsp; 대표 메일</th>
					<td> ${acm2.acm_email }</td>
				</tr>
			</table>
		</div>
 	</div>
 
<!-- 하영 code -->	
<!--  수정 전 <div id="Review" class="tabcontent rvtab"> -->
 	<div id="Review" class="tab-content">
 		<div id="con2">
	 	<div class="container_rvwide">	
			<div class="rv_title">
				<b class="acmtext">${acm.acm_name}</b><b>의 전체 후기</b><b class="rv_cnt_num">${total} 건</b>
						<!-- 평균 별점 -->
						<div class="star_avg_top">
						<div class="star-ratings">
							<div  class="star-ratings-fill space-x-2 text-lg"  >
						<!-- <div  class="star-ratings-fill space-x-2 text-lg"  style="width: score;" > -->
						<!-- <div  class="star-ratings-fill space-x-2 text-lg"  style="width: (${star_rate }*20+1.5) +'%';"> -->
						 		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						 	</div>
						 	<div class="star-ratings-base space-x-2 text-lg">
						 		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						 	</div> 
						 </div>
						 <span class="text">${star_rate }</span>
						</div>
				<div class = "line"></div>
			</div>		
			<div class="rv_content">
				<c:if test="${list.size() == 0}">
					<ul class="noItems">
						<li><span class="txt_title">작성된 리뷰가 없습니다.</span></li>
					</ul>
				</c:if>
				<c:if test="${list.size() != 0}">				
					<div class="rv_list">
						<ul>
							<c:forEach var="acmReview" items="${list}">
								<li>
									<div class="first">
										<div class="info">
						           			<span class="nickname">${acmReview.nickname }</span>
						  					<span class="star_avg">
											  <c:choose>
											  	<c:when test="${acmReview.star_rate eq 5 }">★★★★★  	${acmReview.star_rate }</c:when>
											  	<c:when test="${acmReview.star_rate eq 4 }">★★★★☆ 	${acmReview.star_rate }</c:when>
											  	<c:when test="${acmReview.star_rate eq 3 }">★★★☆☆ 	${acmReview.star_rate }</c:when>
											  	<c:when test="${acmReview.star_rate eq 2 }">★★☆☆☆ 	${acmReview.star_rate }</c:when>
											  	<c:when test="${acmReview.star_rate eq 1 }">★☆☆☆☆ 	${acmReview.star_rate }</c:when>
											  	<c:when test="${acmReview.star_rate eq 0 }">☆☆☆☆☆ 	${acmReview.star_rate }</c:when>
											  </c:choose>         			
						  					</span>
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
					</div>
				</c:if>
			</div>
			<!-- 페이징 -->
		<div align="center">
		<ul class="pagination_bottom">
		<!-- 시작페이지가 pagePerBlock 보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="acmView.do?pageNum=1&acmno=${acm.acmno}"
			onclick="localStorage.setItem('tab_id', 'Review');"
			 >
				<img alt="이전" src="${path }/resources/img/left2.png"></a></li>
			<li><a href="acmView.do?pageNum=${pb.startPage - 1 }&acmno=${acm.acmno}"
			onclick="localStorage.setItem('tab_id', 'Review');">
				<img alt="이전" src="${path }/resources/img/left.png"></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li class="currentPage"><a href="acmView.do?pageNum=${i }&acmno=${acm.acmno}"
				onclick="localStorage.setItem('tab_id', 'Review');">${i }</a></li>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="acmView.do?pageNum=${i }&acmno=${acm.acmno}"
				onclick="localStorage.setItem('tab_id', 'Review');">${i }</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="acmView.do?pageNum=${pb.endPage + 1 }&acmno=${acm.acmno}"
			onclick="localStorage.setItem('tab_id', 'Review');">
				<img alt="다음" src="${path }/resources/img/right.png"></a></li>
			<li><a href="acmView.do?pageNum=${pb.totalPage}&acmno=${acm.acmno}"
			onclick="localStorage.setItem('tab_id', 'Review');"
			>
				<img alt="다음" src="${path }/resources/img/right2.png"></a></li>
		</c:if>
		</ul>
		</div>
		</div>
	</div>
    </div>
	<!-- 하영 끝 -->
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title></title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript" src="resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Abel&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/main.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head><body class="body">
	
<!-- main container -->
<div class="main-container sol">

  <!-- 메인비디오 -->
  <div class="main-video-container">
     <video src="resources/mainVideo/nkdjj.mp4" muted autoplay loop></video>
  </div>
  <!-- 인기숙소리스트 -->
  <div class = "main-acmList">
  		<div class="sec_title">Our top six accomodations</div>
  		<c:if test="${empty acmList }">
				등록된 숙소가 없습니다.</th>
		</c:if>
		<c:if test="${not empty acmList }">
				<div class = "main-top6">
				<div class = "swiper-container">
					<div class = "swiper-wrapper">
						<c:forEach var="acm" items="${acmList }">
							<div class = "swiper-slide">
								<ul>
								<li>
								<div class = "aImg">
									<a href="acmView.do?acmno=${acm.acmno}">
										<img src="resources/acmpic/${acm.acmno}/0.jpg">
									</a>
								</div>
								</li>
								<li>
								<div class = "aName">
									${acm.acm_name} <!-- <ul id="main_acmList_title"></ul> -->
								</div>
								</li>
								</ul>
							</div>
	 					</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
				</div>
 		</c:if>
  </div>
 
  <!-- 일러스트 삽입 -->
  <div class="jejuareamap">
  	<h2 class="areatext"><b>어디로 떠날까요?</b></h2>
  	<p class="areatext">지도의 영역을 선택해 주세요.</p>
  	<img alt="제주 영역별 지도" src="${path}/resources/img/main_img/jejuareamap.png"
  	usemap="#searchby_area_map">
  	<map id="searchby_area_map" name="searchby_area_map">
		<area shape="rect" alt="애월읍" coords="290,152,371,178" href="mapResult.do?acm_loc=애월읍" />
		<area shape="rect" alt="한림읍" coords="206,214,283,242" href="mapResult.do?acm_loc=한림읍" />
		<area shape="rect" alt="한경면" coords="62,291,183,318" href="mapResult.do?acm_loc=한경면" />
		<area shape="rect" alt="대정읍" coords="116,392,220,421" href="mapResult.do?acm_loc=대정읍" />
		<area shape="rect" alt="안덕면" coords="263,322,366,353" href="mapResult.do?acm_loc=안덕면" />
		<area shape="rect" alt="서귀포시" coords="447,361,546,392" href="mapResult.do?acm_loc=서귀포시" />
		<area shape="rect" alt="남원읍" coords="551,313,649,340" href="mapResult.do?acm_loc=남원읍" />
		<area shape="rect" alt="표선면" coords="676,206,784,234" href="mapResult.do?acm_loc=표선면" />
		<area shape="rect" alt="성산읍" coords="761,155,859,185" href="mapResult.do?acm_loc=성산읍" />
		<area shape="rect" alt="구좌읍" coords="709,42,793,69" href="mapResult.do?acm_loc=구좌읍" />
		<area shape="rect" alt="조천읍" coords="619,71,706,98" href="mapResult.do?acm_loc=조천읍" />
		<area shape="rect" alt="제주시" coords="465,134,527,163" href="mapResult.do?acm_loc=제주시"/>
		<!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) --></map>
  </div>
</div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>   

  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      spaceBetween: 30,
      slidesPerGroup: 3,
      loop: true,
      loopFillGroupWithBlank: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      
      autoplay: { delay: 2500, disableOnInteraction: false,
      },
      
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });

</script>
</body>
</html>
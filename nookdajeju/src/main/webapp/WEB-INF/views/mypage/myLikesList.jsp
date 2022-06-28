<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/mystyle.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
</head><body>
<div class="container_wide">
		<!-- myMainMenu -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		
		<!-- 내용 -->
		<div class="content">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">좋아요 한 숙소가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<h3 class="my_title">위시리스트 </h3>
				
				<!-- 좋아요 한 스테이 지도 마커 -->
				<div id="map" style="width:90%; height:400px; margin-left:5%; margin-bottom:7%; margin-bottom:7%;"></div>
				
				<ul class="likeslist">
					<c:forEach var="likes" items="${list}">
						<li id="likeslist">
							<a href="acmView.do?acmno=${likes.acmno}" class="cursor">
								<img src ="resources/acmpic/${likes.acmno }/0.jpg" style =" no-repeat center; background-size: cover;">
								<div class="txt_likes">${likes.acm_name }</div>
								<hr>
								<div class="txt_sm">${likes.acm_loc }</div>
							</a>
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
			<li><a href="myLikesList.do?pageNum=1">
				<img alt="이전" src="${path }/resources/img/left2.png"></a></li>
			<li><a href="myLikesList.do?pageNum=${pb.startPage - 1 }">
				<img alt="이전" src="${path }/resources/img/left.png"></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li class="currentPage"><a href="myLikesList.do?pageNum=${i }">${i }</a></li>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="myLikesList.do?pageNum=${i }">${i }</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아 있으면 endPage보다 totalpage가 크다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="myLikesList.do?pageNum=${pb.endPage + 1 }">
				<img alt="다음" src="${path }/resources/img/right.png"></a></li>
			<li><a href="myLikesList.do?pageNum=${pb.totalPage}">
				<img alt="다음" src="${path }/resources/img/right2.png"></a></li>
		</c:if>
		</ul>
	</div>
	
</div>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey="></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.3793694, 126.5313539), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	
	let total = document.getElementsByClassName("txt_likes").length;
	console.log(total);
  	 
   	var positions = [
      <c:forEach items="${list}" var="likes">
          { content: "<div>${likes.acm_name}</div>", 
              latlng: new kakao.maps.LatLng( "${likes.latitude}", "${likes.longtitude}" ) } ,
       </c:forEach>
   	];
	
 // 마커 이미지의 이미지 주소입니다
	var imageSrc = "data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 64 64' xmlns='http://www.w3.org/2000/svg' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3ELove Marker%3C/title%3E%3Cdesc%3EA color styled icon from Orion Icon Library.%3C/desc%3E%3Cpath fill='%23fff' d='M55.9 28.3c.1-.8.1-1.5.1-2.3a24 24 0 0 0-48 0c0 .8 0 1.6.1 2.3v.3C10.1 47.6 32 62 32 62s21.9-14.6 23.8-33.3z' data-name='layer2'%3E%3C/path%3E%3Cpath opacity='.2' fill='%23000032' d='M11.1 26.6v-.3c-.1-.8-.1-1.5-.1-2.3a24 24 0 0 1 9.3-18.9A24 24 0 0 0 8 26c0 .8 0 1.6.1 2.3v.3C10.1 47.6 32 62 32 62l2.8-2.1C33 58.6 13 44.7 11.1 26.6z' data-name='opacity'%3E%3C/path%3E%3Cpath stroke-width='2' stroke-miterlimit='10' stroke-linecap='round' stroke='%232e4369' fill='none' d='M55.9 28.3c.1-.8.1-1.5.1-2.3a24 24 0 0 0-48 0c0 .8 0 1.6.1 2.3v.3C10.1 47.6 32 62 32 62s21.9-14.6 23.8-33.3z' data-name='stroke' stroke-linejoin='round'%3E%3C/path%3E%3Cpath fill='%23ed4c49' d='M44 24.7a6.7 6.7 0 0 0-6.6-6.7 6.6 6.6 0 0 0-5.4 2.9 6.6 6.6 0 0 0-5.4-2.9 6.7 6.7 0 0 0-6.6 6.7 6.9 6.9 0 0 0 0 .7C20.8 32.6 32 40 32 40s9.9-6.8 11.7-13.4a6.8 6.8 0 0 0 .3-1.9z' data-name='layer1'%3E%3C/path%3E%3Cpath stroke-width='2' stroke-miterlimit='10' stroke-linecap='round' stroke='%232e4369' fill='none' d='M44 24.7a6.7 6.7 0 0 0-6.6-6.7 6.6 6.6 0 0 0-5.4 2.9 6.6 6.6 0 0 0-5.4-2.9 6.7 6.7 0 0 0-6.6 6.7 6.9 6.9 0 0 0 0 .7C20.8 32.6 32 40 32 40s9.9-6.8 11.7-13.4a6.8 6.8 0 0 0 .3-1.9z' data-name='stroke' stroke-linejoin='round'%3E%3C/path%3E%3C/svg%3E"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(45, 32); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    
	 // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}

	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/acmrv.css">
<script type="text/javascript">
$(function() {
	// input range rate 조절
	$('input[type="range"]').on('change mousemove', function() {
		var val = ($(this).val() - $(this).attr('min')) / ($(this).attr('max') - $(this).attr('min'));

	    $(this).css('background-image',
	                '-webkit-gradient(linear, left top, right top, '
	                + 'color-stop(' + val + ', #6799FF), '
	                + 'color-stop(' + val + ', #e4e4e4)'
	                + ')'
       	);
	    // span에 등록한 별점(range value) 넣기
	    $('#input_span').text($(this).val());
	});
	
	// scroll top
	$('.scroll_top').on('click', function(e) {
		e.preventDefault();
		$('html, body').animate({scrollTop: 0}, 200);
	});
	
	// scroll top button show/hide
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.scroll_top').fadeIn(500);
		} else {
			$('.scroll_top').fadeOut('slow');
		}
	});
	
});
// $(document).ready(function() {
// 	// input type file 파일명 변경 설정
// 	$("#f1").on('change', function() {
// 		var fileName = $(this).val();
// 		var realFileName = fileName.split("\\");
// 		$(".file_label").text(realFileName[2]);
// 	});
// });
</script></head><body>
<div class="container_wide">
<jsp:include page="myMainMenu.jsp"/>
</div>
<div class="container_middle">
 	 <form action="myReviewUpdateResult.do?rvno=${review.rvno}" method="post" name="frm" enctype="multipart/form-data">
			 <div class="rv_star_title">리뷰 수정하기</div>
			 		<c:if test="${review.rvpic != null }">
			 			<div class = "picarea">
						<img alt="리뷰사진" src ="resources/rvpic/${review.rvpic}" style =" no-repeat center; background-size: cover;">
						</div>
					</c:if>
					<c:if test="${review.rvpic == null }">
						<div class="picarea" id="norv">
						리뷰사진이 없습니다.</div>
					</c:if>
			
			<!-- 엔터키 전송 막기 -->
			<div style="display:none">
				<input type="submit" onclick="return false"/>
				<input type="text"/>
			</div>
	      	
	      	<!-- 리뷰 수정 -->
        	<input type="hidden" name="rv_regdate" value="${review.rv_regdate }">
        		<!-- 리뷰 사진 -->
	        	<div class="filebox"> <span class=""></span>
					<label for="f1" class="file_label">${review.rvpic}</label>
					<input type="file" id="f1" name="file">
				</div>
            <h4 class="sub_title">리뷰를 수정해 주세요.</h4>
            <div class = rvup_content>
            	<textarea name="rv_content" placeholder="클릭 후 새로운 내용을 작성해주세요. (이전 감상평 : ${review.rv_content})" style="color:gray;"  required="required"></textarea>
            </div>
            <p class="star_text">별점을 선택해 주세요.</p>
            	<!-- 별점 등록 -->
	            <div class="star_avg rate">
	                <input type="range" name="star_rate" min="0" max="5" step="1"  required="required" value="${review.star_rate}">
	                <span class="text" id="input_span">${review.star_rate}</span>
	            </div>
	        <!-- 하단버튼 -->    
            <div class="submit_box">
                 <input type="submit" class="rvbtn" value="수정하기">
            	 <input type="button" onclick="history.go(-1)" class="rvbtn" value="취소">
            </div>
      	   </form>
 </div>
 </div>
</body>
</html>
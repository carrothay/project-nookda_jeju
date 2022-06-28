<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/acmrv.css">

<style>

</style>
<script type="text/javascript">
// $(document).on("drop", function(e) {
// 	// 태그에 파일 넣기
// 	$('input[type="file"]').prop("files", e.originalEvent.dataTransfer.files); 
// });
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
//session check
function sChk(name) {
	var chk = "${empty memail}";
	if (chk=="true") {
		var con = confirm("로그인이 필요합니다.");
		if (con) {				
			location.href="views/member/loginForm.do";
		}
	}
}
</script>
</head>
<body>
<div class="container_middle">
<!-- 엔터키 전송 막기 -->
<div style="display:none">
	<input type="submit" onclick="return false"/>
	<input type="text"/>
</div>
			
<!-- 리뷰 등록 -->
	<form action="reviewWriteResult.do?bookno=${bookno}&acmno=${acmno}" method="post"
		enctype="multipart/form-data" name="frm">
		<input type="hidden" name="rv_regdate" value="${review.rv_regdate }">
		<div class="rv_star_title">리뷰와 별점 등록</div>
			<textarea name="rv_content" placeholder="숙박 후기를 남겨 주세요."
				class="text_area"
				required="required" onclick="sChk()"></textarea>
		
		<div class="star_input">
			<div class="star_text">별점을 선택해 주세요.</div>
			<!-- 별점 등록 -->
			<div class="star_avg rate">
				<input type="range" name="star_rate" min="0" max="5" step="1"
					value="0" required="required">
				<span class="text" id="input_span">0</span>
			</div>
		</div>
		
		<!-- 사진 등록 -->
		<div class="filebox">
			<div class="file_title">후기 사진을 첨부해 주세요.</div>
			<input type="file" name="file">
		</div>
		<div class="submit_box">
			<input type="submit" class="rvbtn" value="등록하기">
		</div>
	</form>
</div>
</body>
</html>
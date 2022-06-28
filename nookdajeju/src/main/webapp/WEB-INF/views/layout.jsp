<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initialscale=1">
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- ${path }를 사용하면 패키지 내의 정보가 절대 경로로 변경됨 --%>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
		<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/floatbox.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/font.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Nookda, Jeju</title>
<script type="text/javascript">

	// scroll top button show/hide
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.scroll_top').fadeIn(500);
		} else {
			$('.scroll_top').fadeOut('slow');
		}
	});	
	
	// scroll top	
	$(function(){
		$('.scroll_top').on('click',function(e){
			e.preventDefault();
			$('html,body').animate({scrollTop:0},500);
		});	
	});
	
	$(document).ready(function(){
		  var currentPosition = parseInt($(".quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
		});
	
</script>
<link rel="icon" href="${path }/resources/img/favicon2.png">
</head> 
<body>
	<div>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<div class="container_laywide">
			<tiles:insertAttribute name="body"></tiles:insertAttribute>	
			<div class="quickmenu">
			  <ul>
			    <li><a href="faqList.do" class="faqbtn">FAQ</a></li>
				<li><a href="askList.do?pageNum=1" class="faqbtn">1:1 문의게시판</a></li>
			  </ul>
			</div>
			<div class="scroll_top"><a href="#"><div class="arrow"></div></a></div>
		</div>
		
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>  
</html>
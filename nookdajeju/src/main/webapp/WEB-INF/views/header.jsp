<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="memail" value='${sessionScope.memail}'></c:set>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<title>Insert title here</title>
<style type="text/css">
	header{
		font-family: 'nookda';
	}
	.orange{
		 width:20px;
	}
	.welcome {
		margin-right: 5px;
	}
	.welcome .nname{
		margin-left: 5px;
		color: var(--point-color);
		font-weight: 600;
		font-size: 15px;
	}
	.welcome .wel{
		margin-left: 5px;
		font-size: 14px;
	}
	
	/* 모달 css */
	* {
	/* font-family: 'Noto Sans KR', sans-serif; */
	  margin: 0;
	  padding: 0;
	  font-color:black;
	}
	
	.modal_title{
	margin-top: -10px;
    font-size: 23px;
    font-weight: 700;
    font-style: italic;
	}
	
	#minus1 {
	border: white;
    font-size: 25px;
    margin: 0;
    padding: 0;
    /* margin-top: -3px; */
    background: white;
   	width: 35px;
   	color: black;
	}
	
	#plus1 {border: white;
    font-size: 25px;
    margin: 0;
    padding: 0;
    /* margin-top: -3px; */
    background: white;
    width: 35px;
    color: black;
	}
	
	.numberRange {
	 margin-top: -5px;
	 display:inline-block;
	}
	
	.body {
	 /*  margin: 100px; */
	}
	
	.pop-layer .pop-container {
	  padding: 13px 10px 20px 29px;
	}
	
	.pop-layer p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer .btn-r {
	  width: 100%;
	  /* margin: 10px 0 20px; */
	  /*  padding-top: 10px; */
	  /* border-top: 1px solid #DDD; */
	  text-align: right;
	}
	
	.pop-layer {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 410px;
	  height: auto;
	  background-color: #fff;
	  /* border: 5px solid #3571B5; */
	  z-index: 10;
	  border-radius: 17px;
	  width: 624px;
	  height: 400px;
	}
	
	.dim-layer {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer .dimBg {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .5;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer .pop-layer {
	  display: block;
	}
	
	a.btn-layerClose {
	  display: inline-block;
	  height: 25px;
	  padding: 0 5px 0;
	  font-size: 13px;
	  color: #fff;
	  line-height: 25px;
	}
	
	.button_box{
	margin-top: -25px;
	margin-left: 502px;
	position: absolute;
	}
	
	/* loc_box */

	.loc_box{
		padding-top: 13px;
		padding-bottom: 25px;
		margin-top: 113px;
	}
	
	.loc_box_title{
	    margin-bottom: 10px;
	    font-size: 15px;
	    font-weight: 600;
	}

	.loc_box .label_box {
		position: relative;
		display: inline-block;
		margin: 0 8px 7px 0;
		/* padding-bottom: 12px; */
	}

	.loc_box input {
		position: absolute;
		top: 40%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: inherit;
		height: inherit;
		margin-bottom: 0;
		z-index: -1;
	}

	.cnt_box{
	    margin-top: 3px;
	    margin-left: 25px;
	}

	.space{
		display: inline-block;
		width: 10px;
	}
	
	.option_title1{
		float:left;
		width: 35%;
	}
	
	.option_title2{
		float:left;
		width: 35%;
	}

	.option_title{
		float:left;
		width: 30%;
	}

	.period {
	    margin-top: 25px;
	}

	.cnt_box_title{
	    margin-bottom: 10px;
	    font-size: 15px;
	    font-weight: 600;
	    padding-left: 11px;
	}

	.filter_modal .btn_box .btn {
	   /*  margin-top: 4%; */
	    background: #424242;
	    font-color: white;
	    letter-spacing: 2px;
	    font-size: 16px;
	    width: 566px;
	    font-weight: 500;
	    color: white;
	    height: 40px;
        margin-top: 0;
    border-color: #424242
	}

	.loc_box .acm_loc {
		background: #FAFAFA;
	    display: inline-block;
	    padding: 5px 10px 6px;
	    color: black;
	    text-decoration: none;
	    -moz-border-radius: 5px;
	    -webkit-border-radius: 5px;
	    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	    -webkit-box-shadow: 0 1px 3px rgb(0 0 0 / 50%);
	    text-shadow: 0 -1px 1px rgb(0 0 0 / 25%);
	    border-bottom: 1px solid rgba(0,0,0,0.25);
	    position: relative;
	    cursor: pointer;
	    letter-spacing: 2px;
	    text-align: center;
	    width: 85px;
	    font-weight: 500;
	    border-radius: 28px;
	}

	.loc_box .acm_loc.active {
		background: #424242;
	    display: inline-block;
	    padding: 5px 10px 6px;
	    color: white;
	    text-decoration: none;
	    -moz-border-radius: 5px;
	    -webkit-border-radius: 5px;
	    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	    -webkit-box-shadow: 0 1px 3px rgb(0 0 0 / 50%);
	    text-shadow: 0 -1px 1px rgb(0 0 0 / 25%);
	    border-bottom: 1px solid rgba(0,0,0,0.25);
	    position: relative;
	    cursor: pointer;
	    letter-spacing: 2px;
	    text-align: center;
	    width: 85px;
	    font-weight: 500;
	    border-radius: 28px;
	}
	
@import url('https://fonts.googleapis.com/css2?family=Abel&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>
<link rel="stylesheet" href="${path }/resources/datepicker/public/theme/css/t-datepicker.min.css">
<link rel="stylesheet" href="${path }/resources/datepicker/public/theme/css/themes/t-datepicker-orange.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<body>
<header>
	<div class='header_inner'>
		<div class="header_logo">
			<a href="main.do"><img alt="로고" src='${path }/resources/img/logo.svg' class="logo"></a>
		</div>
		
		<div class="button_box"><a href="#layer2" class="btn-example" style="text-decoration: none;">
		<img alt="지도좌표흑" style="width:19px; margin-top:-4px" src="data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' aria-labelledby='title' aria-describedby='desc' role='img' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3EMap Marker%3C/title%3E%3Cdesc%3EA solid styled icon from Orion Icon Library.%3C/desc%3E%3Cpath data-name='layer2' d='M32 2a18.1 18.1 0 0 0-18.1 18.1C13.9 36.4 32 52.4 32 52.4s18.1-16 18.1-32.3A18.1 18.1 0 0 0 32 2zm0 24a6 6 0 1 1 6-6 6 6 0 0 1-6 6z' fill='%23202020'%3E%3C/path%3E%3Cpath data-name='layer1' d='M52 46h-8.7a75.5 75.5 0 0 1-8.6 9.4L32 57.7l-2.6-2.3a75.5 75.5 0 0 1-8.7-9.4H12L4 62h56z' fill='%23202020'%3E%3C/path%3E%3C/svg%3E" alt="Map Marker" />
		<p style="color:black; font-size:14px; display: inline-block; margin-left:-4px; margin-right:-2px; color:#666; font-family: 'nookda';  font-weight: 600; ">&nbsp; 제주도로 떠나 볼까요? &nbsp;</p>
		
		</a></div>
		
	<form class="filter_modal" action="mainResult.do" method="post">
		<div class="dim-layer">
	    <div class="dimBg"></div>
	    <div id="layer2" class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <!--content //-->
	                <div class="btn-r">
                    	<a href="#" class="btn-layerClose"><img class="close" src="resources/img/main_img/close.png" style="width:4%; opacity: 0.8;"></img></a>
               		</div>
                        <div class="block"> 
						<p class="modal_title"> F I N D &nbsp; Y O U R &nbsp; S T A Y !&nbsp;</p>
						
						<div class= "period">
							<div class="t-datepicker check-validator">
								<p class="loc_box_title">* 기간</p>
								<div class="t-check-in"></div>
								<div class="t-check-out"></div>
							</div>
						</div>
						
						<div class="option_title"><p class="cnt_box_title">* 인원</p>
							<div class="cnt_box">
								<button class="button" type="button" id="minus1"> - </button>
								<div class="space"></div><span style="font-size: 19px;">1</span><div class="space"></div>
								<button class="button" type="button" id="plus1"> + </button>
								<input type="hidden" name="guestcnt" class="input_hidden" id="guestcnt" value="1">
							</div>
						</div>
						
						<div class="loc_box">
							<p class="loc_box_title">* 지역</p>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t1" value="제주시">
								<label class="acm_loc" for="t1">제주시</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t2" value="서귀포시">
								<label class="acm_loc" for="t2">서귀포시</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t3" value="조천읍">
								<label class="acm_loc" for="t3">조천읍</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t4" value="구좌읍">
								<label class="acm_loc" for="t4">구좌읍</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t5" value="성산읍">
								<label class="acm_loc" for="t5">성산읍</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t6" value="표선면">
								<label class="acm_loc" for="t6">표선면</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t7" value="남원읍">
								<label class="acm_loc" for="t7">남원읍</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t8" value="안덕면">
								<label class="acm_loc" for="t8">안덕면</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t9" value="대정읍">
								<label class="acm_loc" for="t9">대정읍</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t10" value="한경면">
								<label class="acm_loc" for="t10">한경면</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t11" value="한림읍">
								<label class="acm_loc" for="t11">한림읍</label>
							</div>
							<div class="label_box">
								<input type="checkbox" name="acm_loc" id="t12" value="애월읍">
								<label class="acm_loc" for="t12">애월읍</label>
							</div>
						</div>
						
						<div class="btn_box">
							<input class="btn" type="submit" value="확인">
						</div>
					</div>
				    <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
	</form>
		
		<nav class="new_nav">
			<ul class="nav_sub">
				<c:if test="${empty memail}">
					<li><a href="joinForm.do" class="sub">JOIN</a></li>
					<li><a href="loginForm.do" class="sub">LOGIN</a></li>
				</c:if>
				<c:if test="${not empty memail }">
					<li class="welcome"><img class="orange" alt="오렌지" src="${path }/resources/img/favicon.png" ><span class="nname">${sessionScope.nickname }</span><span class="wel">님 &nbsp; | &nbsp; </span></li>
					<!-- <ul class='nav_main'> -->
						<c:if test="${memail != 'admin' }">
							<li class="page" id="h1"><a href="myMain.do" ><img title="마이페이지" alt="마이페이지" src="${path }/resources/img/user.svg"></a></li>
							<c:if test="${sessionScope.mhost == 'y' }">
								<li class="page" id="h2"><a href="hostMain.do"><img title="호스트페이지" alt="호스트페이지" src="${path }/resources/img/house.svg"></a></li>
							</c:if>
						</c:if>
						<c:if test="${memail == 'admin' }">
							<li class="page"><a href="myMain.do" ><img title="마이페이지" alt="마이페이지" src="${path }/resources/img/user.svg"></a></li>
							<li class="page"><a href="hostMain.do"><img title="호스트페이지" alt="호스트페이지" src="${path }/resources/img/house.svg"></a></li>
							<li class="page"><a href="adminMain.do"><img title="관리자페이지" alt="관리자페이지" src="${path }/resources/img/admin.svg"></a></li>
						</c:if>
					<!-- </ul> -->
					<li><span>&nbsp; | &nbsp; </span><a href="logout.do" class="sub" >LOGOUT</a></li>
				</c:if>
			</ul>		
		</nav>
	</div>
</header>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>   
<script>
 // 인원 +- 버튼
    $(function(){
		$('#minus1').on("click",function(e) {
			e.preventDefault();
			var oldValue = $(this).siblings("span").text();
			var num = parseInt(oldValue);
			num -= 1;
			if (num <= 0) {
				alert('최소 인원입니다.');
				num = 1;
			}
			$(this).siblings("span").text(num);
			var gcnt = document.getElementById("guestcnt");
			gcnt.value = num;
		});
		$('#plus1').on("click",function(e) {
			e.preventDefault();
			var stat = $(this).siblings("span").text();
			var num = parseInt(stat);
			num += 1;
			$(this).siblings("span").text(num);
			var gcnt = document.getElementById("guestcnt");
			gcnt.value = num;
		});
    });
    
    // 딤레이어 팝업
    $('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    
    function layer_popup(el){
        var $el = $(el);    //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
           
        });

    }
    
 	// loc tag active : loc tag
	$('input[name="acm_loc"]').on('change', function() {
		if ($(this).is(":checked")) {
			$(this).siblings("label").addClass('active');
		} else {
			$(this).siblings("label").removeClass('active');
		}
	});
    
/* 달력 기능 */
	
	var selectDate1 = "";
	var selectDate2 = "";
	var resultDate1 = "";
	var resultDate2 = "";
	
	$(document).ready(function(){
		$(".t-datepicker").tDatePicker({
			autoClose: true,
			valiDation: true,
			formatDate: 'yyyy-mm-dd',
			titleToday: '오늘',
			titleCheckIn: '체크인',
			titleCheckOut: '체크아웃',
			titleDateRange: '일',
			titleDateRanges: '일',
			titleDays: ['월','화','수','목','금','토','일'],
			titleMonths: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			limitDateRanges : 180,
			limitNextMonth  : 6
		})
		
		  $('.btn-check-validator').on('click', function(e){
			    var getDateInputs = $('.check-validator').tDatePicker('getDateInputs');
			    
			    getDateInputs.map(function(el){
			      if ( el === null ) {
			        e.preventDefault();
			        return;
			      }
			    })
			    
			    var errorNull = $('.error-null').length
			    if ( errorNull === 0 ) {
			      if ( getDateInputs[0] === null || getDateInputs[0] === "" ) {
			        $( "<p class='.check-validator error-null'>체크인 날짜를 선택하세요</p>" ).appendTo( ".check-validator .t-date-check-in" );
			      }	
			      if ( getDateInputs[1] === null || getDateInputs[1] === "" ) {
			        $( "<p class='.check-validator error-null'>체크아웃 날짜를 선택하세요</p>" ).appendTo( ".check-validator .t-date-check-out" );
			      }
			    }
			})
	});
</script>
</body>
</html>
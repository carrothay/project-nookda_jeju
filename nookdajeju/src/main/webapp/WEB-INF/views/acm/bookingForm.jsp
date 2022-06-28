<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.number.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/acm.css">
<link rel="stylesheet" href="${path }/resources/datepicker/public/theme/css/t-datepicker.min.css">
<link rel="stylesheet" href="${path }/resources/datepicker/public/theme/css/themes/t-datepicker-orange.css">
<script type="text/javascript">
	/* 달력 기능 */
	$(document).ready(function(){
		
		var bookeddates = new Array();
		<c:forEach items="${bList}" var="bList">
			var dates = '${bList.b_date}';
			var date1 = dates.substr(0,10);
			var date2 = "'"+date1+"'";
			bookeddates.push(date2);
		</c:forEach>
		var full = bookeddates.join();
		var full2 = "["+full+"]";
console.log(full2);
		
		var sci = "";
		var sco="";
		if (${checkin} != 1 ){
			sci = '${checkin}';
			sco = '${checkout}';
			console.log(sci);
			console.log(sco);
		}
		
		
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
			dateCheckIn: sci,
			dateCheckOut: sco,
			dateDisabled: full2 ,
			limitDateRanges : 180,
			limitNextMonth  : 6
		})
		
		/* null 방지 & input value 가져오기 */
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
			    
			    // 기간 구하기
			    if ( getDateInputs[0] !== "" && getDateInputs[1] !== "" ) {
				    var ciDate = getDateInputs[0];
				    ciDate = new Date(ciDate);
				    resultDate1 = ciDate;
 				    var coDate = getDateInputs[1];
				    coDate = new Date(coDate);
				    resultDate2 = coDate;
				    var nights = Math.floor((coDate-ciDate)/(1000 * 60 * 60 * 24));
			        
			        $('#nights').text(nights);
					$('#nights2').text(nights);
					
					// 총 가격 구하기
					var totalprice = ${acm.acm_price} * nights;
					$('#totalprice').text(totalprice);
					$('#totalprice2').text(totalprice);
					$('.bookprice').val(totalprice);
			    }	
			    	// 천 단위 콤마 찍기
			    	var nData = addComma(${acm.acm_price});
			    	var tData = addComma($('.bookprice').val());
			    	$("#acmprice").text(nData);
			    	$('#totalprice').text(tData);
			    	$('#totalprice2').text(tData);
		 		}) 
		 });
		
    function addComma(num){
    	var regexp = /\B(?=(\d{3})+(?!\d))/g;
    	return num.toString().replace(regexp,',');
    };
	
	/* 인원수 증감 버튼 */
	$(function(){
		var sumCnt = 1;
		
		// 수량 감소
		$('#minus').on("click",function(e) {
			e.preventDefault();
			var oldValue = $(this).siblings("span").text();
			var num = parseInt(oldValue);
			num -= 1;

			if (num <= 0) {
				alert('최소 인원 수 입니다.');
				num = 1;
			}
			
			$(this).siblings("span").text(num);
			$(this).siblings("input").val(num);
		});
		
		// 수량 증가
		$('#plus').on("click",function(e) {
			e.preventDefault();
			var stat = $(this).siblings("span").text();
			var num = parseInt(stat);
			num += 1;
			
			if (num > ${acm.acm_capa}) {
				alert('최대 인원 수 입니다.');
				num = ${acm.acm_capa};
			}
			$(this).siblings("span").text(num);
			$(this).siblings("input").val(num);
		});
	});
	function submitChk(){
		if ($('.bookprice').val() === "0" ){
			alert("체크인, 체크아웃 날짜를 바르게 선택 후, 금액확인 버튼을 클릭하세요.");
			$(".btn-check-validator").focus();
			return false;
		}
		if ($('input[name=c1]').val() !== "check" && $('input[name=c2]').val() !== "check" ) {
			alert("필수 동의사항에 동의하세요.");
			return false;
		}
	};
</script>
</head>
<body>
<form action="bookingResult.do?acmno=${acm.acmno }&mno=${member.mno}"  onsubmit="return submitChk()" method="post"  name="frm1">
	<div class="container_semiwide">
		<div class="reserve_title">RESERVATIONS</div>
		<div class="reserve_content">
			<table>
				<tr>
					<th class="book_firstCell">예약 스테이</th>
					<td>${acm.acm_name } / ${acm.acm_type }</td>
				</tr>
				<tr>
					<th>예약 날짜</th>
						<td>
							<div class="t-datepicker check-validator">
								<div class="t-check-in"></div>
								<div class="t-check-out"></div>
								<div class="t-nights"><span id="nights">0</span> 박 / 총  <span id="totalprice">0</span>원 </div>
							</div>
						<input class="btn btn-info btn-check-validator" type="button" value="금액확인" />
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${member.mlastname }${member.mfstname }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${member.mphone }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${member.memail }</td>
				</tr>
				<tr>
					<th>투숙 인원 선택<div class="capa">(최대 ${acm.acm_capa }명)</div></th>
					<td>
						<div class="cnt_box">
							<button class="button" type="button" id="minus">-</button>&nbsp;
							<c:if test="${guestcnt == null }">
								<span>1</span>&nbsp;
								<input type="hidden" name="guestcnt" class="input_hidden" value="1">
							</c:if>
							<c:if test="${guestcnt != null }">
								<span>${guestcnt }</span>&nbsp;
								<input type="hidden" name="guestcnt" class="input_hidden" value="${guestcnt }">
							</c:if>
							<button class="button" type="button" id="plus">+</button>
						</div></td>
				</tr>
				<tr>
					<th>기타 요청사항</th>
					<td>
						<!-- 엔터키 전송 막기 -->
						<div style="display:none">
							<input type="submit" onclick="return false"/>
							<input type="text"/>
						</div>
						<textarea name="request" rows="5" cols="60"></textarea></td>
				</tr>
				<tr>
					<th>동의사항</th>
					<td>
						<div class="agree_title">변상 안내</div>
						<div class="agree_chk"><span class="agree_req">필수 </span><input type="checkbox" class="nookdaChk" name="c1" value="check"  id="c1"><label for="c1">동의</label></div>
						<div class="agree_content">숙소 이용 시 기물 파손 혹은 오염이 생길 경우 호스트에게 즉시 알려주시길 바랍니다. 체크아웃 이후 확인된 협의 되지 않은 파손, 오염, 분실은 배상 비용이 발생됩니다.</div>
						<div class="agree_title">유의 사항</div>
						<div class="agree_chk"><span class="agree_req">필수</span> <input type="checkbox" class="nookdaChk" name="c2" value="check" id="c2"><label for="c2">동의</label></div>
						<div class="agree_content">주변에 나무와 풀이 많아 벌레에 예민하시면 고민 후 예약을 해주세요. 벌레로 인한 환불은 되지 않습니다.</div>
					</td>					
				</tr>
				<tr>
					<th>예상 결제 금액</th>
					<td>
						<div class= "price_box">
							<div class="sum_pro">
								객실요금 : <span id="acmprice">0</span>원 * <span id="nights2">0</span>박 
							</div>
							<div class="sum_box">
								총 금액 : <span id="totalprice2">0</span>원
								<input type="hidden" class="bookprice" name="bookprice" value="0">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>결제 수단 선택</th>
					<td>
						<div class="payby">
							<input class="nookdaRa" type="radio" name="payby" value="카드결제" id="p1" checked="checked">
							<label for="p1">카드결제</label>
						</div>
						<div class="payby">
							<input class="nookdaRa" type="radio" name="payby" value="카카오페이" id="p2">
							<label for="p2">카카오페이</label>
						</div>
						<div class="payby">
							<input class="nookdaRa" type="radio" name="payby" value="네이버페이" id="p3">
							<label for="p3">네이버페이</label>
						</div>
						<div class="payby">
							<input class="nookdaRa" type="radio" name="payby" value="휴대폰결제" id="p4">
							<label for="p4">휴대폰결제</label>
						</div>
				</tr>
			</table>
		</div>
		<div class="submit_box">
			<input id="submit" type="submit" class="btn btn-warning" value="예약하기">
		</div>
	</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/hostyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/common_my.css">
<style type="text/css">
/* drop & drag */
	.drag-over { background: #ffffff; }
	.thumb { width: 200px; float: left; margin:0 9px 0 -4px; }
	.thumb > img { margin-bottom:3px; }
	.thumb0 { width: 200px; float: left; margin:0 9px 0 -4px; }
	.thumb0 > img { margin-bottom:3px; }
	#thumbnails {display: flex;}
	#thumbnails0 {overflow: auto; display: flex;}
	.thumb > .close { margin-left: 185px; cursor: pointer; color:black; font-weight: bold; font-family: 'Spoqa Han Sans Neo', 'sans-serif'; font-size: 20px; }
	#drop { background-color: #F2F2F2; height: 172px; overflow: auto;}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=&libraries=services"></script>
</head><body>
<div class="container_wide">	
	<div class="includes">
		<jsp:include page="hostMainMenu.jsp"></jsp:include>
	</div>
	
	<!-- 엔터키 전송 막기 -->
	<div style="display:none">
		<input type="submit" onclick="return false"/>
		<input type="text"/>
	</div>
	
	<div class="hostAcmReg-title"><h2 class="title">숙소수정</h2></div>
	<!-- <form action="hostAcmUpdateResult.do" method="post" name="frm" enctype="multipart/form-data"> -->
	<div class = "acmform">
	<form action="hostAcmUpdateResult.do" method="post" name="frm" enctype="multipart/form-data">
		<div class="hostAcmUpdate"> 
			<input type="number" name="acmno" value="${acm.acmno }" hidden="hidden">
			<table class = "uptable">
				<tr><td>숙소이름<span class=""></span></td>
					<td><input type="text" name="acm_name" required="required" value="${acm.acm_name }" class="r_only" readonly></td>
					<td >지역<span class=""></span></td>	<!-- 예) 애월읍 -->
					<td><input type="text" name="acm_loc" required="required" id="acm_loc" value="${acm.acm_loc }" class="r_only" readonly ></td></tr>
				<tr><td colspan="1">전체주소<span class=""></span></td>
					<td colspan="2"><input type="text" name="acm_addr" id="acm_addr" required="required" size=55 value="${acm.acm_addr }" ></td>
					<td colspan="1"><button type="button" onclick="sample5_execDaumPostcode()" id="addr_search">주소찾기</button></td></tr>
				<tr><td colspan="1">지도</td><td colspan="3"><div id="map" style="width:507px;height:300px; margin-top:10px;"></div></td></tr>
				<tr><td>위도 <span class=""></span></td>
					<td><input type="text" name="latitude" required="required" id="latitude" value="${acm.latitude }" class="r_only" readonly ></td>
					<td>경도<span class=""></span></td>
					<td><input type="text" name="longtitude" required="required" id="longtitude" value="${acm.longtitude }" class="r_only" readonly ></td></tr>
				<tr><td>숙소소개<span class=""></span></td>
					<td colspan="3"><textarea name="acm_content" required="required" id="acm_content">${acm.acm_content }</textarea></td></tr>
				<tr><td colspan="1">대표이메일<span class=""></span></td>
					<td colspan="3"><input type="text" name="acm_email" required="required" size=69 value="${acm.acm_email }"></td></tr>
				<tr><td>전화번호<span class=""></span></td>
					<td><input type="text" name="acm_phone" required="required" value="${acm.acm_phone }"></td>
					<td>가격<span class=""></span></td>
					<td><input type="text" name="acm_price" required="required" id="acm_price" value="${acm.acm_price }"></td></tr>
				<tr><td>체크인<span class=""></span></td>
					<td><input type="text" name="acm_checkin" required="required" value="${acm.acm_checkin }"></td>
					<td>체크아웃<span class=""></span></td>
					<td><input type="text" name="acm_checkout" required="required" value="${acm.acm_checkout }"></td></tr>
				<tr><td>숙소타입<span class=""></span></td>
					<td><input type="text" name="acm_type" required="required" value="${acm.acm_type }"></td>
					<td>침대타입<span class=""></span></td>
					<td><input type="text" name="acm_bedtype" required="required" value="${acm.acm_bedtype }"></td></tr>
				<tr><td>숙소면적<span class=""></span></td>
					<td><input type="text" name="acm_size" required="required" value="${acm.acm_size }" class="acm_size"></td>
					<td>최대인원<span class=""></span></td>
					<td><input type="text" name="acm_capa" required="required" value="${acm.acm_capa }"></td></tr>
				<tr><td colspan="1">등록 된 사진 <span class=""></span></td>
					<td colspan="3">
					<div id="thumbnails0">
						<c:forEach var="aplist" items="${aplist }">
							<div class="thumb0"><img src="resources/${aplist.acm_picurl}/${aplist.acm_picname}" title="${aplist.acm_picname}" style="width:200px; height:150px;"></div>
						</c:forEach>
					</div></td></tr>
				<tr><td colspan="1">수정 할 사진 <span class=""></span></td>
					<td colspan="3">* 등록할 사진을 드래그해주세요🙂!  &nbsp; 처음 사진이 대표사진이 됩니다.
									<div id="drop">
										<div id="thumbnails"></div>
									</div></td></tr>
			</table>
			<input type="submit" id="submit" class="btnup" value="수정하기">
		</div>
	</form>
	</div>
</div>
</body>
<script type="text/javascript">

	$(function() {
		/* drop & drag */
		var uploadfiles = [];  // 복수의 파일도 가능
		var $drop = $('#drop');
		
		$drop.on("dragover", function(e){      // 그림을 떨어뜨리려고 올려 놨을 때
			 e.stopPropagation();  // 이벤트를 전달하지 마라
			 e.preventDefault();   // 원래 기능을 하지 마라
		}).on("drop", function(e){  // 그림을 떨어뜨려 놓으면
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files; // 드래그 그림들
			console.log(files);
			for (var i=0; i<files.length; i++) {
				var file = files[i];
				var size = uploadfiles.push(file);  // 업로드 파일 목록배열 끝에 추가
				preview(file, size);
			}
		});
		
		$('#submit').on('click', function() {
			var formData = new FormData();
			formData.append('acmno', frm.acmno.value);
			formData.append('acm_name', frm.acm_name.value);
			formData.append('acm_loc', frm.acm_loc.value);
			formData.append('acm_addr', frm.acm_addr.value);
			formData.append('acm_phone', frm.acm_phone.value);
			formData.append('acm_checkin', frm.acm_checkin.value);
			formData.append('acm_checkout', frm.acm_checkout.value);
			formData.append('acm_email', frm.acm_email.value);
			formData.append('acm_type', frm.acm_type.value);
			formData.append('acm_content', frm.acm_content.value);
			formData.append('acm_price', frm.acm_price.value);
			formData.append('acm_capa', frm.acm_capa.value);
			formData.append('acm_bedtype', frm.acm_bedtype.value);
			formData.append('acm_size', frm.acm_size.value);
			formData.append('latitude', frm.latitude.value);
			formData.append('longtitude', frm.longtitude.value);
			$.each(uploadfiles, function(idx, file) {
				formData.append('file', file, file.name);
			});
			$.ajax({
				url:'hostAcmUpdateResult.do', data:formData, type:'post',contentType:false,
				processData:false, enctype:'multipart/form-data',
				success: function(data) {
				}
			});
		});		
		// x를 클릭한 그림 삭제
		$("#thumbnails").on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			$target.parent().remove(); 
		
			var upArray = uploadfiles;				// x누르면 미리보기에서만 삭제가 아니라 dom에 저장된 파일정보도 삭제되게끔
			console.log("upArray 삭제전"+upArray);
			var total = upArray.length;
			
			if (total == 1){
				var result = upArray.pop();
			}
			if (idx !== -1) {
				console.log("idx="+idx);
				upArray.splice(idx-1, 1);
			} 
			console.log("upArray 삭제후"+upArray);
		});
	});	
	
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = "<div class='thumb'><div class='close' data-idx="+idx+
	    			        "> X </div><img src="+e.target.result+" title="+
	       				     escape(f.name)+" style='width:200px; height:150px;'/></div>";
				$('#thumbnails').append(div);
			}
		})(file);
		reader.readAsDataURL(file, idx);
	}
	
	
	var longti = document.getElementById('longtitude').value; // 지도를 표시할 div
	var lati = document.getElementById('latitude').value; // 지도를 표시할 div
	
	var mapContainer = document.getElementById('map') // 지도를 표시할 div
	, mapOption = {
        center: new daum.maps.LatLng(lati, longti), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
	
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(lati, longti),
	    map: map
	});

	function sample5_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	            var addr = data.address; // 최종 주소 변수
	            var bname1 = data.bname1; // 추가 -읍
	            var sigungu = data.sigungu; // 추가 -시
	            var loc="";
	            if (bname1 == ""){
	            	loc = sigungu;
	            } else { loc = bname1; }
	            
	            // 시 또는 읍 값 넣기
	            document.getElementById("acm_loc").value = loc;
	            // 주소 값 넣기
	            document.getElementById("acm_addr").value = addr;
	            
	            // 주소로 상세 정보를 검색
	            geocoder.addressSearch(data.address, function(results, status) {
	                // 정상적으로 검색이 완료됐으면
	                if (status === daum.maps.services.Status.OK) {
	                    var result = results[0]; //첫번째 결과의 값을 활용
	                    // 해당 주소에 대한 좌표를 받아서
	                    document.getElementById("latitude").value = result.y;
	                    document.getElementById("longtitude").value = result.x;
	                    var coords = new daum.maps.LatLng(result.y, result.x);
	                    // 지도를 보여준다.
	                    mapContainer.style.display = "block";
	                    map.relayout();
	                    // 지도 중심을 변경한다.
	                    map.setCenter(coords);
	                    // 마커를 결과값으로 받은 위치로 옮긴다.
	                    marker.setPosition(coords)
	                }
	            });
	        }
	    }).open();
	}
	
	$(document).on("focusout", ".acm_size", function()	{
		if($(this).val() != '' ) {
			$(this).val( $(this).val()+'㎡');
		}		
	});

	$(document).on("focus", ".acm_size", function()	{	
		$(this).val( $(this).val().replace("㎡", ""));
	});
	
</script>
</html>
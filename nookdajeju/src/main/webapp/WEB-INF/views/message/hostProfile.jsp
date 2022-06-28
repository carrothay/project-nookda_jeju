<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Host Profile</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<link href="resources/bootstrap/css/message_list.css" rel="stylesheet">
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.number.min.js"></script>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="container">
		<!-- 프로필 -->
		<div class="profile">
	<h2>호스트 프로필</h2>
	<div>호스트 : ${host.nickname }</div>
	<div>호스트 이메일: ${host.memail }</div>
	<div>호스트 연락처: ${host.mphone }</div>
	<div class="line"></div>
	<div class="messagesend-btn">
	<!-- 메세지 보내기 버튼 -->
		<button type="button" class="his_btn"
			onclick="javascript:MessageContentList('${host.nickname}')">
			<i class='fa fa-paper-plane-o'></i>&nbsp;메시지 내역
		</button>
	</div>
	</div>
	<!-- 메세지 내용 영역 -->
	<div class="mesgs">
		<!-- 메세지 내용 목록 -->
		<div class="msg_history" name="contentList">
			<!-- 메세지 내용이 올 자리 -->
		</div>
		<div class="send_message"></div>
		<!-- 메세지 입력란이 올자리 -->
		<div class='type_msg'>
			<div class='input_msg_write row'>
				<div class='col-11'>
					<input type='text' class='write_msg form-control'
						placeholder='메시지를 입력하세요...' />
				</div>
				<div class='col-1'>
					<button class='msg_send_btn' type='button'
						onclick="javascript:SendMessage('${host.nickname}')">
						<i class='fa fa-paper-plane-o' aria-hidden='true'></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	let otherNick = '${host.nickname}';
	//메세지 내역을 가져온다.
	const MessageContentList = function(other_nick) {
		console.log(other_nick);
		$.ajax({
			url : "message_content_list_inprofile.do",
			method : "GET",
			data : {
				other_nick : other_nick,
			},
			success : function(data) {
				console.log("메세지 내용 가져오기 성공");
				console.log(data);
				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
			},
			error : function() {
				alert('내용 가져오는 중 오류');
			}
		})
	};
	// 메세지를 전송하는 함수
	const SendMessage = function(other_nick) {

		let content = $('.write_msg').val();
		console.log(content);

		content = content.trim();

		if (content == "") {
			alert("메세지를 입력하세요!");
		} else {
			$.ajax({
				url : "message_send_inlist_inprofile.do",
				method : "GET",
				data : {
					other_nick : other_nick,
					content : content
				},
				success : function(data) {
					console.log("메세지 전송 성공");

					// 메세지 입력칸 비우기
					$('.write_msg').val("");

					// 메세지 내용  리로드
					//                 MessageContentList(other_nick);

				},
				error : function() {
					alert('메시지 전송 중 오류');
				}
			});
		}
	};
</script>
</html>
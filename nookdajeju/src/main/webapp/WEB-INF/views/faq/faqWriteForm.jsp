<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" 
	href="${path }/resources/bootstrap/css/faq.css">
	
<style type="text/css">
input[name="title"] {
	width: 68%;
	display: inline-block;
}

.column {
	display: inline-block;
	width: 30%;
	float: right;
}

.file_label {
	display: inline-block;
	width: 100%;
	line-height: 43px;
	border: none;
	border: 1px solid var(--point-color);
	outline: 0;
	font-size: 15px;
	text-align: center;
	color: var(--point-color);
	cursor: pointer;
	padding: 2px 12px;
}


.up_title input {
	width: 100%;
	height: 45px;
	border: none;
	border-bottom: 1px solid #000;
	outline: 0;
	font-size: 14px;
 	margin-bottom: 40px;
}
.up_title input::placeholder{
	color: #aaa;
	font-size: 13px;
}

</style>
<script type="text/javascript">

//글작성일 때 required 확인
function insertChk() {
	if ($("input[name=fname]").val() == "" || $("input[name=fname]").val() == null) {
		alert("제목을 작성하세요.");
		return false;
	} else ($(".note-editable").text() == "" || $(".note-editable").text() == null) {
		alert("내용을 작성하세요.");
		return false;
	}
}
</script>
</head>
<body>
<div class="container_middle">
		
		<form action="faqWriteResult.do" method="post" enctype="multipart/form-data">
			<h1 class="faqtitle">자주 묻는 질문(FAQ) 등록</h1>
			
			<input type="hidden" name="fno" value="${fno }">
			
			<!-- 엔터키 전송 막기 -->
			<div style="display:none">
				<input type="submit" onclick="return false"/>
				<input type="text"/>
			</div>
			
			<!-- 제목 -->
			<div class = "up_title" >
				<h4 class="subtitle">제목</h4>
           		<input name="fname" placeholder="제목을 작성해 주세요." style="color:gray;"  required="required">
            </div>
            <div class = "up_content">
          		<h4 class="subtitle">내용</h4>
            	<textarea name="faq_content" placeholder="내용을 작성해 주세요." style="color:gray;"  required="required"></textarea>
            </div>
			
			<!-- 하단버튼 -->
            <div class="submit_box">
                 <input type="submit" class="faqbtn" value="등록하기" onclick="return insertChk()">
            	 <input type="button" onclick="history.go(-1)" class="faqbtn" value="취소">
            </div>
		</form>
	</div>
</body>
</html>
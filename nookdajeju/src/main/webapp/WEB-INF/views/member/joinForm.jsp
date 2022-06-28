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
	href="${path }/resources/bootstrap/css/login.css">
<style>
.container {
	width: 68%;
}
.lbtn {
	width: 110%;
}
.lbtn:hover {
	width: 110%;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function idChk() {
		if (!frm.memail.value) {
			alert("이메일을 입력한 후에 체크하세요.");
			frm.memail.focus();
			return false;  // action 하지마라
		}
		// id ajax
		$.post('idChk.do', "memail="+frm.memail.value, function(data) {
			$('#idChk1').html(data);
		});
	}
	
	// 닉네임 중복 체크
	function nickChk() {
		if(!frm.nickname.value) {
			alert("닉네임을 입력한 후 체크하세요.")
			frm.nickname.focus();
			frm.nickname.value="";
			return false;
		} else {
		// 닉네임 중복 체크 로직
		$.post('nickChk.do', 'nickname='+frm.nickname.value, function(data) {
			$('#nickChk').html(data);
			if (data == '사용 가능한 닉네임입니다.') {
				$("#submitinfoupdate").attr("disabled", false);
			} else if (data == '이미 사용중인 닉네임입니다.') {
				$("#submitinfoupdate").attr("disabled", true);
			}
		});
	  }
	}
	
	function chk() { 
		if (frm.mpw.value != frm.mpw2.value) {
			alert("암호와 암호 확인이 다릅니다"); 
			frm.mpw.focus();
			frm.mpw.value = ""; 
			frm.mpw2.value = "";
			return false;
		}
		if ($('#nickChk').html() == '이미 사용중인 닉네임입니다.') {
			alert("중복된 닉네임입니다. 다른 닉네임을 입력해 주세요.");
			frm.nickname.focus();
			return false;
		}
		
	}
	
</script>
</head>
<body>
<div class="container" align="center">
<form action="joinAction.do" method="post" name="frm" onsubmit="return chk()">
<h2 class="title">J O I N</h2>
<table class="join">
	<tr>
		<td class="col-md-4">이메일</td>
		<td class="chk_value">
			<input type="text" name="memail" required="required" autofocus="autofocus" placeholder="email@email.com"
			pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
			<div id="idChk1" class="err"></div>
		</td>
		<td><input type="button" class="ckbtn" value="중복 체크" onclick="idChk()"></td>
	</tr>	 
	<tr>
		<td class="col-md-4">암호</td>
		<td class="chk_value"><input type="password" name="mpw" required="required"></td>
	</tr>
	<tr>
		<td class="col-md-4">암호 확인</td>
		<td class="chk_value"><input type="password" name="mpw2" required="required"></td>
	</tr>
		
	<tr>
		<td class="col-md-4">성</td>
		<td class="chk_value"><input type="text" name="mlastname" required="required"></td>
	</tr>
	<tr>
		<td class="col-md-4">이름</td>
		<td class="chk_value"><input type="text" name="mfstname" required="required"></td>
	</tr>
		
	<tr>
		<td class="col-md-4">휴대폰 번호</td>
		<td class="chk_value"><input type="text" name="mphone" required="required" pattern="\d{3}-\d{4}-\d{4}" placeholder="000-0000-0000"></td>
	</tr>
	<tr>
		<td class="col-md-4">닉네임</td>
		<td class="chk_value">
			<input type="text" name="nickname" id="nickname" required="required">
			<div id="nickChk" class="err"></div>
		</td>
		<td><input type="button" class="ckbtn" onclick="nickChk()" value="중복 체크"></td>
		<td colspan="2"><a class="err" id="err_nick"></a></td>
	</tr>
		
	<tr>
		<td class="container_submit" colspan="2" align="center">
			<input type="submit" class="lbtn" value="회원 가입">
		</td>
	</tr>
</table>
</form>
<a href="loginForm.do" class="btn">로그인</a>
</div>
</body>
</html>
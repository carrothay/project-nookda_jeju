<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/mystyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<script type="text/javascript">
	// 닉네임 중복 체크
	/*
	function nickChk() {
		if(!frm.nickname.value) {
			alert("닉네임을 입력한 후 체크하세요")
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
	*/
	/* 비밀번호 형식 체크 (4글자이상) */
	function chkPass(){
		var pw = $("#password").val();
		if(pw.length<4) {
			$('#err_pass').html("&emsp; * 비밀번호를 4자리이상 입력해주세요.");
			frm.password.focus();
			frm.password.value="";
			return false;
		} else {
			$('#err_pass').html("");
		}
	}
	
	/* 비밀번호 확인 일치여부 체크 */
	function chkPass2() {
		if (!frm.mpw2.value){
			$('#err_pass2').html("&emsp; * 비밀번호 확인란을 입력하세요.");
			return false;
		} if(frm.mpw2.value!=frm.mpw.value){
			$('#err_pass2').html("&emsp; * 비밀번호가 일치하지 않습니다.");  
			frm.mpw2.focus();
			frm.mpw2.value="";
			return false;
		} else {
			$('#err_pass2').html("");
		}
	}
	/* 검사 */
	function chk() {
		if (frm.mpw.value != frm.mpw2.value) {
			alert("암호와 암호 확인이 다릅니다"); frm.mpw.focus();
			frm.mpw.value = ""; frm.mpw2.value = "";
			return false;
		}
	}
	
	/* 연락처 유효성 검사 */
	function chkPhone(){
		var reg_phone = /^([0-9]){3}[-]([0-9]){4}[-]([0-9]){4}$/;
		 if(!reg_phone.test(frm.mphone.value)){
			$('#err_phone').html("&emsp; * 올바른 연락처 형식이 아닙니다.");
			frm.mphone.focus();
			frm.mphone.value="";
			return false;
		} else {
			$('#err_phone').html("");
		}
	}
	
	/* 회원탈퇴 */
	function del() {
		var con = confirm("탈퇴 하시겠습니까?");
		if (con) location.href="myDelete.do";
		else {
			alert("탈퇴가 취소 되었습니다.");
			return;
		} 
	}
	
	/* form 경로 2개 */
	function submit2(frm) { 
		if(con) {
		frm.action='delete.do';
	    frm.submit(); 
	    return true;
		} else { return false;}
	} 

</script></head><body>
<div class="container_wide">
		<!-- myMainMenu -->
		<jsp:include page="myMainMenu.jsp"/>
<div class="container" align="center">
		<h2>${member.nickname }님의 프로필</h2> 
		<h3>회원 정보 수정</h3>
		<form method="post" name="frm" onsubmit="return chk()"> 
			<!-- 엔터키 전송 막기 -->
			<div style="display:none">
				<input type="submit" onclick="return false"/>
				<input type="text"/>
			</div>
	
			<table class="updateform">
					<tr>
						<td class="col-md-4">아이디</td>
						<td class="chk_value">
							<input type="text" name="memail" required="required"
							readonly="readonly" value="${member.memail }">
						</td>
					</tr>
					<tr>
						<td colspan="2" id="msg1"> &emsp; * ID는 수정이 불가합니다.</td>
					</tr>
					<tr>
						<td class="col-md-4">암호</td>
						<td class="chk_value">
							<input type="password" id="password" name="mpw"
							placeholder="입력해주세요" required="required"
							onChange="chkPass()">
						</td>
					</tr>
					<tr>
						<td colspan="2"><a class="err" id="err_pass"></a></td>
					</tr>
					<tr>
						<td class="col-md-4">암호 확인</td>
						<td class="chk_value">
							<input type="password" name="mpw2" placeholder="입력해주세요"
							required="required"
							onChange="chkPass2()">
						</td>
					</tr>
					<tr>
						<td colspan="2"><a class="err" id="err_pass2"></a></td>
					</tr>

					<tr>
						<td class="col-md-4">성</td>
						<td class="chk_value">
							<input type="text" name="mlastname" required="required"
							value="${member.mlastname }">
						</td>
					</tr>
					<tr>
						<td class="col-md-4">이름</td>
						<td class="chk_value">
							<input type="text" name="mfstname" required="required"
							value="${member.mfstname }">
						</td>
					</tr>

					<tr>
						<td class="col-md-4">휴대폰 번호</td>
						<td class="chk_value">
							<input type="tel" name="mphone" required="required"
							value="${member.mphone }" onChange="chkPhone()">
						</td>
					</tr>
					<tr>
						<td colspan="2"><a class="err" id="err_phone"></a></td>
					</tr>

					<tr>
						<td class="col-md-4">닉네임</td>
						<td class="chk_value">
							<input type="text" name="nickname" required="required"
							readonly="readonly" value="${member.nickname }">
						</td>
					</tr>
					<tr>
						<td colspan="2" id="msg1"> &emsp; * 닉네임은 수정이 불가합니다.</td>
					</tr>

					<tr>
						<td class="col-md-4">호스트 여부</td>
						<td class="chk_value">
		
					<!-- 관리자 프로필 -->
					<div class="admin_box">
						<c:if test="${adminchk == 1 }">
					  		<div>관리자입니다.</div>
						</c:if>
					</div>
					<c:if test="${adminchk == -1 }"> <!-- 관리자가 아니면 -->
						<div class="chk_host">
							<c:if test="${member.mhost eq 'n' }">
							호스트가 아닙니다.
							<input type="submit" value="호스트 신청하기" id="hbtn"
										onclick="javascript: form.action='myHostRequest.do';" />
							</c:if>
							<c:if test="${member.mhost eq 'y' }">
							호스트입니다.
							<input type="submit" value="호스트 그만하기" id="hbtn"
										onclick="javascript: form.action='myHostCancel.do';" />
							</c:if>
							<c:if test="${member.mhost eq 'p' }">
							호스트 승인 대기중 입니다.
							</c:if>
						</div>
					</c:if>
						</td>
					</tr>
				</table>
			<input type="hidden" name="nickname2" id="nickname2" value="${member.nickname}">
			
			<!-- button -->
			<div class="container_submit2">
				<input type="submit" id="submitinfoupdate" 
				class="hbtn2" value="수정하기" onclick="javascript: form.action='myInfoUpdateResult.do';"/>
				<input type="submit"class="hbtn2" value="탈퇴하기" onclick="del()"/>
			</div>
		</form>
	</div>
</div>
</body>
</html>
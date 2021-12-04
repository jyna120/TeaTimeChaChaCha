<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	  request.setCharacterEncoding("UTF-8");
%>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regForm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "JoinLogin/idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}
</script>

<title>Join</title>
</head>
<body>
<div class="join_container"> 
		<h1> 
			회원 가입 
		</h1> 
		<br/>
		<form name="regForm" method="post" action="MainForm.jsp?contentPage=JoinLogin/JoinAction.jsp"> 
			<h4>
				아이디
			</h4> 
			<div class="joinID"> 
				<input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디" name="member_id" title="아이디" maxlength="20">				
			</div>
			<input type="button" class="IDCheck" value="ID중복확인" onClick="idCheck(this.form.member_id.value)">
			<h4>
				비밀번호
			</h4> 
			<div class="joinPassword"> 
				<input type="password" class="input" placeholder="비밀번호" name="member_pwd" title="비밀번호" maxlength="20"> 
			</div> 
			<h4>
				이름
			</h4> 
			<div class="joinName"> 
				<input type="text" class="input" placeholder="이름" name="member_name" title="이름" maxlength="20"> 
			</div>
			<h4>
				닉네임
			</h4> 
			<div class="joinNickname"> 
				<input type="text" class="input" placeholder="닉네임" name="member_nickname" title="닉네임" maxlength="20"> 
			</div>
			
			<input type="submit" class="bt_join" value="회원가입"> 
		</form> 
</div>
</body>
</html>
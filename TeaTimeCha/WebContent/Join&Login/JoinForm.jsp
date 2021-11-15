<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="joinStyle.css" type="text/css">
<link rel="stylesheet" href="../headerStyle.css" type="text/css">

<title>Join</title>
</head>
<body>
<div id="header" >
	<div id="nav">
	<nav>
        <ul style=" text-align:right">
            <li><a href="../Home/home.jsp">소개</a></li>
            <li><a>|</a></li>
            <li><a href="#">차</a></li>
            <li><a>|</a></li>
            <li><a href="../Cafe/cafe.jsp">카페</a></li>
            <li><a>|</a></li>
            <li><a href="../Community/community.jsp">후기</a></li>
            <li><a>|</a></li>
            <li><a href="../Join&Login/LoginForm.jsp">로그인</a></li>
        </ul>   
    </nav>   
	</div>

	<h2 id="headerTitle" ></h2>
</div>

<div class="join_container"> 
		<h1> 
			회원 가입 
		</h1> 
		<br/>
		<form name="regForm" method="post" action="JoinAction.jsp"> 
			<h4>
				아이디
			</h4> 
			<div class="joinID"> 
				<input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디" name="member_id" title="아이디" maxlength="20"> 
			</div> 
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

<div id="footer" style="background-color:#CCD5AE;">
	Footer 영역 : Banner
</div>
</body>
</html>
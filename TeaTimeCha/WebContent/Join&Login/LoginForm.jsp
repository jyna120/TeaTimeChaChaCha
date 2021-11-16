<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="loginStyle.css" type="text/css">
<link rel="stylesheet" href="../headerStyle.css" type="text/css">

<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.member_id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.member_id.focus();
			return;
		}
		if (document.loginFrm.member_pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.member_pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>

<title>로그인</title>
</head>
<body>
<div id="header" >
	<div id="nav">
	<nav>
        <ul>
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
	<div class="login_containers"> 
		<h2> 
			로그인
		 </h2> 
		 <%if (id != null) {%>
		<b><%=id%></b>님 환영 합니다.
		<p>제한된 기능을 사용 할 수가 있습니다.<p/>
			<a class="alogout" href="logout.jsp">로그아웃</a>
			<%} else {%>
		<form name="loginFrm" method="post" action="loginProc.jsp"> 
		<h3>
			아이디
		</h3> 
		<div class="loginID"> 
			<input type="text" class="input" placeholder="아이디" name="member_id" maxlength="20"> 
		</div> 
		<h3>
			비밀번호
		</h3> 
		<div class="loginPassword"> 
			<input type="password" class="input" placeholder="비밀번호" name="member_pwd" maxlength="20"> 
		</div> 
		<input type="button" class="bt_login" value="로그인" onclick="loginCheck()">&nbsp;
		<input type="button" class="bt_join" value="회원가입" onclick="location.href='JoinForm.jsp'">
		</form> 
		<%}%>
	</div>
<br>

<div id="footer">
	Footer 영역 : Banner
</div>
</body>
</html>
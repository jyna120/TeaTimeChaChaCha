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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
 <script>
        $(document).ready(function () {
            $("#header").load("../menubar.jsp", function () {
            //페이지 별로 다른 메뉴 css 적용도 가능
                document.getElementById("sub_nav").classList.add("show");
            });
        })
 </script>

<title>로그인</title>
</head>
<body>
<div id="header" >
	
	<h2 id="headerTitle" ></h2>
</div>	
	<div class="login_containers"> 
		<h2> 
			로그인
		 </h2> 
		 <%if (id != null) {%>
			<script>	
				location.href="../Home/home.jsp";
			</script>
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
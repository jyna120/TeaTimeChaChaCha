<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>후기</title>
<link href="communityStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../headerStyle.css" type="text/css">
<script type="text/javascript">
</script>
</head>
<body>
<div id="header">
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

	<h2 id="headerTitle">후기</h2>
</div>

<div id="section" style="text-align: center;width:100%; height:600px; ">
	<div id="search" style="float:right; margin:10px;">
	<form method="post" action="forwardTest6_1.jsp">
		<input name="searchBar">
		<input type="submit" value="검색">
		<p/>
	</form>
	</div>
	<div>
	<table width="100%" cellpadding="2" cellspacing="0">
		<tr align="center" bgcolor="#D0D0D0" height="120%">
			<td>번 호</td>
			<td>제 목</td>
			<td>이 름</td>
			<td>날 짜</td>
			<td>조회수</td>
		</tr>
	</table>
	</div>
</div>
<br>

<div id="footer">
	Footer 영역 : Banner
</div>
</body>
</html>
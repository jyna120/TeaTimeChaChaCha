<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>카페</title>
<link href="cafeStyle.css" rel="stylesheet" type="text/css">
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

	<h2 id="headerTitle">카페</h2>
</div>

<div id="section" style="text-align: center; width:100%; height:600px; ">
	<div id="table">
	<table width="100%" cellpadding="2" cellspacing="0">
		<div id="search" style="float:right; margin:10px;">
			<form method="post" action="forwardTest6_1.jsp">
			<input name="searchBar">
			<input type="submit" value="검색">
			</form>
		</div>
		<!-- line -->
		<div class="line"></div>
		<tbody align="center" height="100%">
			<tr>
				<td width="50%"></td>
				<td width="50%"></td>
			</tr>
		</tbody>
	</table>
	</div>
</div>
<br>

<div id="footer">
	Footer 영역 : Banner
</div>
</body>
</html>
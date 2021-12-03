<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<%
	String id = (String)session.getAttribute("idKey");
	request.setCharacterEncoding("UTF-8");
%>

<meta charset="UTF-8">

<title>Menu</title>
</head>
<body>
<div id="nav">
	<nav>
        <ul>
            <li><a href="MainForm.jsp?contentPage=Home/home.jsp&title=TEA TIME">소개</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Tea/TeaForm.jsp&title=TEA">차</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Cafe/cafe.jsp&title=CAFE">카페</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Community/list.jsp&title=COMMUNITY">후기</a></li>
            <li><a>|</a></li>
            <%if (id == null) {%>
            <li><a href="MainForm.jsp?contentPage=JoinLogin/LoginForm.jsp&title=LOGIN">로그인</a></li>
            <%} else {%>
            <li><a href="MainForm.jsp?contentPage=JoinLogin/logout.jsp">로그아웃</a></li>
            <%}%>
        </ul>   
    </nav>

</div>
  
</body>
</html>
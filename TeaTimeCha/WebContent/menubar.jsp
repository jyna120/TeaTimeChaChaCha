<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id = (String)session.getAttribute("idKey");
	String title = "소개";
	int value=2;
%>
<script type="text/javascript">
	function titleChange(value){
		switch(value){
		case 1: document.getElementById("headerTitle").value = "차"
        	break;
   		case 2: title ="차";
        	break;
   		case 3: title ="카페";
    		break;
   		case 4: title ="후기";
			break;
   		case 5: title = null;
			break;
  		default: title = null;
        	break;
		}
		
	}
</script>
<meta charset="EUC-KR">

<title>Menu</title>
</head>
<body>
<div id="nav">
	<nav>
        <ul>
            <li><a href="MainForm.jsp?contentPage=Home/home.jsp" onclick="titleChange(1)">소개</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Tea/TeaForm.jsp" onclick="titleChange(2)">차</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Cafe/cafe.jsp">카페</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Community/community.jsp">후기</a></li>
            <li><a>|</a></li>
            <%if (id == null) {%>
            <li><a href="MainForm.jsp?contentPage=JoinLogin/LoginForm.jsp">로그인</a></li>
            <%} else {%>
            <li><a href="MainForm.jsp?contentPage=JoinLogin/logout.jsp">로그아웃</a></li>
            <%}%>
        </ul>   
    </nav>
    <% %>
    <h2 id="headerTitle"><%=title%></h2>   
</div>
  
</body>
</html>
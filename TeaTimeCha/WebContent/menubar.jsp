<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id = (String)session.getAttribute("idKey");
	String title = "�Ұ�";
	int value=2;
%>
<script type="text/javascript">
	function titleChange(value){
		switch(value){
		case 1: document.getElementById("headerTitle").value = "��"
        	break;
   		case 2: title ="��";
        	break;
   		case 3: title ="ī��";
    		break;
   		case 4: title ="�ı�";
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
            <li><a href="MainForm.jsp?contentPage=Home/home.jsp" onclick="titleChange(1)">�Ұ�</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Tea/TeaForm.jsp" onclick="titleChange(2)">��</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Cafe/cafe.jsp">ī��</a></li>
            <li><a>|</a></li>
            <li><a href="MainForm.jsp?contentPage=Community/community.jsp">�ı�</a></li>
            <li><a>|</a></li>
            <%if (id == null) {%>
            <li><a href="MainForm.jsp?contentPage=JoinLogin/LoginForm.jsp">�α���</a></li>
            <%} else {%>
            <li><a href="MainForm.jsp?contentPage=JoinLogin/logout.jsp">�α׾ƿ�</a></li>
            <%}%>
        </ul>   
    </nav>
    <% %>
    <h2 id="headerTitle"><%=title%></h2>   
</div>
  
</body>
</html>
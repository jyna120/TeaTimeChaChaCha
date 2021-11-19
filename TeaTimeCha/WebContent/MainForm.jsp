<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="headerStyle.css" type="text/css">
<link rel="stylesheet" href="JoinLogin/joinStyle.css" type="text/css">
<link rel="stylesheet" href="JoinLogin/loginStyle.css" type="text/css">
<%
    String contentPage = "Home/home.jsp";
    String a = request.getParameter("contentPage");
    if (a != null) {
         contentPage = a;
    }
%>
<title>Main</title>
</head>
<body>
<div id="wrap">
        <div id="header" >
            <jsp:include page="menubar.jsp" />

        </div>
        <div id="main">
            <jsp:include page="<%=contentPage%>" />
        </div>
        <div id="footer"> 하단 </div>
 </div>

</body>
</html>
<!-- 출처: https://all-record.tistory.com/116 [세상의 모든 기록] -->
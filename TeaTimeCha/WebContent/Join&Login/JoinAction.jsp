<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>회원가입 완료</h3>
<!--<link rel="stylesheet" href="/resources/css/member/join.css">  -->


<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID"); 
	String userPassword = request.getParameter("userPassword"); 
	String userName = request.getParameter("userName");
	String userNickname = request.getParameter("userNickname");	
	%>

	<b><%=userName%></b>님의 회원가입이 완료되었습니다.

</body>


<!--출처: https://group11.tistory.com/9 [Jo's] -->
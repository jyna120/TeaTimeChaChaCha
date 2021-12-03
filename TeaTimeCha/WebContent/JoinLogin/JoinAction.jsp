<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, package_db.*" %>
<jsp:useBean id="regMgr" class="package_db.RegisterMgrPool" scope="page"/>

<h3>회원가입 완료</h3>
<!--<link rel="stylesheet" href="/resources/css/member/join.css">  -->


<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String member_id = request.getParameter("member_id"); 
	String member_pwd = request.getParameter("member_pwd"); 
	String member_name = request.getParameter("member_name");
	String member_nickname = request.getParameter("member_nickname");
	
	RegisterBean member = new RegisterBean(); 
	member.setMember_id(member_id);
	member.setMember_pwd(member_pwd);
	member.setMember_name(member_name);
	member.setMember_nickname(member_nickname);

	%>

	<b><%=member_name%></b>님의 회원가입이 완료되었습니다.

</body>
<!--출처: https://group11.tistory.com/9 [Jo's] --> --%>

<%@page contentType="text/html; charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="package_db.MemberMgr"/>
<jsp:useBean id="bean" class="package_db.RegisterBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		boolean result = mgr.insertMember(bean);
		String msg = "회원가입에 실패 하였습니다.";
		String location = "MainForm.jsp?contentPage=JoinLogin/JoinForm.jsp";
		if(result){
			msg = "회원가입을 하였습니다.";
			location = "MainForm.jsp?contentPage=JoinLogin/LoginForm.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>
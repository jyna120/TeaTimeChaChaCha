<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="package_db.MemberMgr"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = request.getParameter("member_id");
	  String pwd = request.getParameter("member_pwd");
	  String url = "JoinLogin/LoginForm.jsp";
	  String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  
	  boolean result = mMgr.loginMember(id,pwd);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="MainForm.jsp?contentPage=<%=url%>";
</script>
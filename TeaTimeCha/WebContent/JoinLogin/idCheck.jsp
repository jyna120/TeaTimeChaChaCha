<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="package_db.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>ID �ߺ�üũ</title>
<link rel="stylesheet" href="headerStyle.css" type="text/css">
<link rel="stylesheet" href="ChaStyle.css" type="text/css">
</head>
<body bgcolor="#dfe4cb">
	<div align="center">
		<br/><b><%=id%></b>
		<%
			if (result) {
				out.println("�� �̹� �����ϴ� ID�Դϴ�.<p/>");
			} else {
				out.println("�� ��� ���� �մϴ�.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">�ݱ�</a>
	</div>
</body>
</html>
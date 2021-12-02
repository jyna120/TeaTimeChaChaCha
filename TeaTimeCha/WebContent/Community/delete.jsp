<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="Community.BoardBean"%>
<jsp:useBean id="bMgr" class="Community.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
    
	String title = "�Խù� �����ϱ�";
	String t = request.getParameter("title");
    if (t != null) {
    	title = new String(t.getBytes("8859_1"), "UTF-8");   	
    }
%>
<html>
<head>
<title>JSP Board</title>
<link href="headerStyle.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if (request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(num);
			String url = "list.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>

<script type="text/javascript">
	alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
	history.back();
</script>
<%}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body bgcolor="#CCD5AE">
<div id="header" >
            <jsp:include page="menubar.jsp" />
        </div>
        <h2 id="headerTitle"><%=title%></h2>
	<div align="center">
		<br/><br/>
		
		<div align="center" style="background:white;height:250px;padding:20px;">
		<table width="600" cellpadding="3">
			<tr>
			<td><font color="#CCD5AE"><h1  align="center">������� ��й�ȣ�� �Է����ּ���.</h1></font></td>
				
			</tr>
		</table>
		<form name="delFrm" method="post" action="delete.jsp">
			<br/><br/>
			<table width="600" cellpadding="2">
				<tr>
					<td align="center">
						<table>
							<tr>
								<td align="center">
									<input type="password" name="pass" size="17" maxlength="15">
								</td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee"/></td>
							</tr>
							
							<tr>
								<td align="center" >
									<input type="button" value="�����Ϸ�" onClick="check()"style="width:60px;border:3px solid #E9EDC9;border-radius: 5px;background:#E9EDC9"> 
									<input type="reset" value="�ٽþ���"style="width:60px;border:3px solid #E9EDC9;border-radius: 5px;background:#E9EDC9">
									<input type="button" value="�ڷ�" onClick="history.go(-1)"style="width:50px;border:3px solid #E9EDC9;border-radius: 5px;background:#E9EDC9">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	<%}%>
	</div>
</body>
</html>
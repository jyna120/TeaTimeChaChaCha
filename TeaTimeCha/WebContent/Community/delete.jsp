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
<link href="../communityStyle.css" rel="stylesheet" type="text/css">
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
			String url = "community.jsp?nowPage=" + nowPage;
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
        <h2 id="headerTitle">DELETE</h2>
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
									<button type="button"  onClick="check()"> �����Ϸ�</button>
									<button type="reset" value="�ٽþ���">�ٽþ���</button>
									<button type="button" value="�ڷ�" onClick="history.go(-1)">�ڷ�</button>
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
	<div id="footer"> 
       		ƼŸ�� ������ <br/>
        	Developers �ϳ��� �̺� from ���ſ��ڴ��б� 
        </div>
</body>
</html>
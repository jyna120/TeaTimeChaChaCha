<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="Community.BoardBean"%>
<jsp:useBean id="bMgr" class="Community.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
    
	String title = "게시물 삭제하기";
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
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
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
			<td><font color="#CCD5AE"><h1  align="center">사용자의 비밀번호를 입력해주세요.</h1></font></td>
				
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
									<button type="button"  onClick="check()"> 삭제완료</button>
									<button type="reset" value="다시쓰기">다시쓰기</button>
									<button type="button" value="뒤로" onClick="history.go(-1)">뒤로</button>
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
       		티타임 차차차 <br/>
        	Developers 하나의 이변 from 성신여자대학교 
        </div>
</body>
</html>
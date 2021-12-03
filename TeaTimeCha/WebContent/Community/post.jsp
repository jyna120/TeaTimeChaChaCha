<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("UTF-8");
    
	String title = "후기게시판";
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
<style>
button{
width:60px;
border:3px solid #E9EDC9;
border-radius: 5px;
background:#E9EDC9}
</style>
</head>
<body bgcolor="#CCD5AE">
<div align="center" >
        
<div style="background:white;height:350px;padding:5%;">
<form name="postFrm" method="post" action="Community/boardPostServlet" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="20%">성 명</td>
				<td width="80%">
				<input name="name" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" size="15" maxlength="15"></td>
			</tr>
			
			 <tr>
     			<td>파일찾기</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>내용타입</td>
 				<td> 
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <button type="submit" value="등록" >등록</button>
					 <button type="reset" value="다시쓰기">다시쓰기</button>
					 <button type="button" value="리스트" onclick="location.href = 'MainForm.jsp?contentPage=Community/list.jsp&title=COMMUNITY'">리스트</button>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</div>
</body>
</html>
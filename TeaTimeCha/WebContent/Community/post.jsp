<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.net.URLEncoder" %>
<%
   request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
   String title = "�ı�Խ���";
   String t = request.getParameter("title");
    if (t != null) {
       title = new String(t.getBytes("8859_1"), "UTF-8");      
    }
%>


<html>
<head>
<title>JSP Board</title>

<link href="headerStyle.css" rel="stylesheet" type="text/css">
<link href="../communityStyle.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor="#CCD5AE">
<div align="center" >
<div id="header" >
   <div id="nav">
	<nav>
        <ul>
            <li><a href="../MainForm.jsp?contentPage=Home/home.jsp&title=TEA TIME">�Ұ�</a></li>
            <li><a>|</a></li>
            <li><a href="../MainForm.jsp?contentPage=Tea/TeaForm.jsp&title=TEA">��</a></li>
            <li><a>|</a></li>
            <li><a href="../MainForm.jsp?contentPage=Cafe/cafe.jsp&title=CAFE">ī��</a></li>
            <li><a>|</a></li>
            <li><a href="../MainForm.jsp?contentPage=Community/list.jsp&title=COMMUNITY">�ı�</a></li>
            <li><a>|</a></li>
            <%if (id == null) {%>
            <li><a href="../MainForm.jsp?contentPage=JoinLogin/LoginForm.jsp&title=LOGIN">�α���</a></li>
            <%} else {%>
            <li><a href="../MainForm.jsp?contentPage=JoinLogin/logout.jsp">�α׾ƿ�</a></li>
            <%}%>
        </ul>   
    </nav>

</div>
</div>
<h2 id="headerTitle">POST</h2>


<div style="background:white;height:600px;padding:5%;">
<form name="postFrm" method="post" action="boardPostServlet" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
   <tr>
      <td align=center>
      <table align="center">
         <tr>
            <td width="20%">�� ��</td>
            <td width="80%">
            <input name="name" size="10" maxlength="8"></td>
         </tr>
         <tr>
            <td>�� ��</td>
            <td>
            <input name="subject" size="50" maxlength="30"></td>
         </tr>
         <tr>
            <td>�� ��</td>
            <td><textarea name="content" rows="10" cols="50"></textarea></td>
         </tr>
         <tr>
            <td>��й�ȣ</td>
            <td><input type="password" name="pass" size="15" maxlength="15"></td>
         </tr>
         
          <tr>
              <td>����ã��</td> 
              <td><input type="file" name="filename" size="50" maxlength="50"></td>
          </tr>
          <tr>
             <td>����Ÿ��</td>
             <td> 
               TEXT<input type=radio name="contentType" value="TEXT" checked>
               </td>
          </tr>
         <tr>
            <td colspan="2"><hr/></td>
         </tr>
         <tr>
            <td colspan="2">
                <button type="submit" value="���" >���</button>
                <button type="reset" value="�ٽþ���">�ٽþ���</button>
                <button type="button" value="����Ʈ" onclick="location.href = 'community.jsp'">����Ʈ</button>
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
<div id="footer"> 
       		ƼŸ�� ������ <br/>
        	Developers �ϳ��� �̺� from ���ſ��ڴ��б� 
        </div>
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="Community.BoardBean" scope="session"/>
<%
	  String nowPage = request.getParameter("nowPage");
	  String com_subject = bean.getCom_subject();
	  String com_content = bean.getCom_content(); 
%>
<html>
<head>
<title>JSPBoard</title>
<link href="../communityStyle.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCD5AE">
<div id="header" >
            <jsp:include page="menubar.jsp" />
        </div>
        <h2 id="headerTitle">REPLY</h2>
<div align="center"  style="background:white;height:600px;padding:20px;">
<br><br>

<form method="post" action="boardReply" >
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">�г���</td>
     <td width="80%">
	  <input name="com_name" size="30" maxlength="20"></td>
    </tr>
    <tr>
     <td>�� ��</td>
     <td>
	  <input name="com_subject" size="50" value="�亯 : <%=com_subject%>" maxlength="50"></td> 
    </tr>
	<tr>
     <td>�� ��</td>
     <td>
	  <textarea name="com_content" rows="12" cols="50">
      	<%=com_content %>
      	========�亯 ���� ������.=======
      	</textarea>
      </td>
    </tr>
    <tr>
     <td>��� ��ȣ</td> 
     <td>
	  <input type="password" name="com_pass" size="15" maxlength="15"></td> 
    </tr>
    <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr> 
     <td colspan="2">
	  <button type="submit" value="�亯���" >�亯���</button>
      <button type="reset" value="�ٽþ���">�ٽþ���</button>
      <button type="button" value="�ڷ�" onClick="history.back()">�ڷ�</button>
      </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="com_ip" value="<%=request.getRemoteAddr()%>" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="com_ref" value="<%=bean.getCom_ref()%>">
 <input type="hidden" name="com_pos" value="<%=bean.getCom_pos()%>">
 <input type="hidden" name="com_depth" value="<%=bean.getCom_depth()%>">
</form> 
</div>
<div id="footer"> 
       		ƼŸ�� ������ <br/>
        	Developers �ϳ��� �̺� from ���ſ��ڴ��б� 
        </div>
</body>
</html>
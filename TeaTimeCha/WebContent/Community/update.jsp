<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="Community.BoardBean"%>
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent(); 
%>
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
<link href="ChaStyle.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<style>
button{
width:60px;
border:3px solid #E9EDC9;
border-radius: 5px;
background:#E9EDC9}
</style>
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("������ ���� �н����带 �Է��ϼ���.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body bgcolor="#CCD5AE">
		<!--div id="header" >
            <jsp:include page="menubar.jsp" />
        </div>
        <h2 id="headerTitle"><%=title%></h2-->
        
<div align="center" style="background:white;height:250px;padding:5%;">
 		
<form name="updateFrm" method="post" action="./Community/boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">�� ��</td>
     <td width="80%">
	  <input name="name" value="<%=name%>" size="30" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td>�� ��</td>
     <td>
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td>�� ��</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>��� ��ȣ</td> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      ���� �ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
     <button type="button" onclick="check()">�����Ϸ�</button>
 	 <button type="reset" onclick="">�ٽü���</button>
 	 <button type="button" onclick="history.go(-1) ">�ڷ�</button>

	  <input type="button" value="�����Ϸ�" onClick="check()">
      
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>
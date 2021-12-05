<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="Community.BoardBean"%>
<% 
	  int com_num = Integer.parseInt(request.getParameter("com_num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String com_subject = bean.getCom_subject();
	  String com_name = bean.getCom_name(); 
	  String com_content = bean.getCom_content(); 
%>
<%
	request.setCharacterEncoding("UTF-8");
    
	String title = "EDIT";
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
<style>
button{
width:60px;
border:3px solid #E9EDC9;
border-radius: 5px;
background:#E9EDC9}
</style>
<script>
	function check() {
	   if (document.updateFrm.com_pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateFrm.com_pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body bgcolor="#CCD5AE">
		<div id="header" >
            <jsp:include page="menubar.jsp" />
        </div>
        <h2 id="headerTitle"><%=title%></h2>
        
<div align="center" style="background:white;height:600px;padding:5%;">
 		
<form name="updateFrm" method="post" action="boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
	  <input name="com_name" value="<%=com_name%>" size="30" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td>제 목</td>
     <td>
	  <input name="com_subject" size="50" value="<%=com_subject%>" maxlength="50">
	 </td>
    <tr>
     <td>내 용</td>
     <td>
	  <textarea name="com_content" rows="10" cols="50"><%=com_content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>비밀 번호</td> 
     <td><input type="password" name="com_pass" size="15" maxlength="15">
      수정 시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
     <button type="button" onclick="check()">수정완료</button>
 	 <button type="reset" onclick="">다시수정</button>
 	 <button type="button" onclick="history.go(-1) ">뒤로</button>

	  <!--input type="button" value="수정완료" onClick="check()"-->
      
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type='hidden' name="com_num" value="<%=com_num%>">
</form> 
</div>
 <div id="footer"> 
       		티타임 차차차 <br/>
        	Developers 하나의 이변 from 성신여자대학교 
        </div>
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="Community.BoardBean"%>
<jsp:useBean id="bMgr" class="Community.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
    
	String title = "�� �б�";
	String t = request.getParameter("title");
    if (t != null) {
    	title = new String(t.getBytes("8859_1"), "UTF-8");   	
    }
%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  int com_num = Integer.parseInt(request.getParameter("com_num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(com_num);//��ȸ�� ����
	  BoardBean bean = bMgr.getBoard(com_num);//�Խù� ��������
	  String com_name = bean.getCom_name();
	  String com_subject = bean.getCom_subject();
      String com_regdate = bean.getCom_regdate();
	  String com_content = bean.getCom_content();
	  String com_filename = bean.getCom_filename();
	  int com_filesize = bean.getCom_filesize();
	  String com_ip = bean.getCom_ip();
	  int com_count = bean.getCom_count();
	  session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<html>
<head>
<title>�ı�Խ���</title>
<link href="../communityStyle.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<style>
td{
border-right:none;
border-left:none;
border-top:none
}
button{
width:50px;
border:3px solid #E9EDC9;
border-radius: 5px;
background:#E9EDC9}
</style>
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(com_filename){
		 document.downFrm.com_filename.value=com_filename;
		 document.downFrm.submit();
	}
</script>
</head>
<body bgcolor="#CCD5AE"  >

<div >
        <div id="header" >
            <jsp:include page="menubar.jsp" />
        </div>
        <h2 id="headerTitle">REVIEW</h2>
        
        <div  style="background:white; width: 100%;height:600px;float:center;padding-top:3%;">
        <div style="background:#CCD5AE; width: 100%;float:center;padding-top:3%;"> 
        <center id="review" style="background:white; width: 100%;float:center;">
        <table align="center" width="600" cellspacing="3" >
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
    <td align="center" bgcolor="#DDDDDD" width="20%"> ���� </td>
    <td bgcolor="#FFFFE8" colspan="3"><%=com_subject%></td>
   </tr>
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="20%"> �г��� </td>
  <td bgcolor="#FFFFE8"width="30%"><%=com_name%></td>
  <td align="center" bgcolor="#DDDDDD" width="20%"> ��¥ </td>
  <td bgcolor="#FFFFE8" width="30%"><%=com_regdate%></td>
 </tr>
<tr> 
    <td colspan="4" height="240px"><br/><pre><%=com_content%></pre><br/></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">÷������</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( com_filename !=null && !com_filename.equals("")) {%>
  		<a style="text-decoration-line:none;color:black" href="javascript:down('<%=com_filename%>')"><%=com_filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=com_filesize%>KBytes)</font>  
  		 <%} else{%> ��ϵ� ������ �����ϴ�.<%}%>
     </td>
    
     
   </tr>
   
   <tr>
    <td colspan="4" align="right">
       ��ȸ��  <%=com_count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 
 <tr>
  <td align="center" colspan="2"height="50px> 
 <hr/>
 <!--onclick="location.href='javascript:list()' "/location.href='update.jsp?nowPage=<%=nowPage%>&com_num=<%=com_num%>'  reply.jsp?nowPage=<%=nowPage%>-->
 <button type="button" onclick="location.href = 'community.jsp'">����Ʈ</button>
 <button type="button" onclick="location.href = 'update.jsp?&nowPage=<%=nowPage%>&com_num=<%=com_num%>'">����</button>
 <button type="button" onclick="location.href ='reply.jsp?&nowPage=<%=nowPage%>' ">�亯</button>
 <button type="button" onclick="location.href='delete.jsp?&title=DELETE&nowPage=<%=nowPage%>&com_num=<%=com_num%>' ">����</button>

  </td>
 </tr>
</table>
        </center><!--id=review-->
        </div>
        </div>

</div>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="com_filename">
</form>

<form name="listFrm" method="post" action="MainForm.jsp?contentPage=Community/list.jsp&title=REVIEW">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
 </div>
 <div id="footer"> 
       		ƼŸ�� ������ <br/>
        	Developers �ϳ��� �̺� from ���ſ��ڴ��б� 
        </div>
</body>
</html>
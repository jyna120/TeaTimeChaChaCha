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
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//��ȸ�� ����
	  BoardBean bean = bMgr.getBoard(num);//�Խù� ��������
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<html>
<head>
<title>�ı�Խ���</title>
<link href="ChaStyle.css" rel="stylesheet" type="text/css">
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
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
</script>
</head>
<body bgcolor="#CCD5AE"  >

<div >
        <!--div id="header" >
            <jsp:include page="menubar.jsp" />
        </div>
        <h2 id="headerTitle"><%=title%></h2-->
        
        <div  style="background:white; width: 100%;float:center;padding-top:3%;">
        <div style="background:#CCD5AE; width: 100%;float:center;padding-top:3%;"> 
        <center id="review" style="background:white; width: 100%;float:center;">
        <table align="center" width="600" cellspacing="3" >
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
    
    <td bgcolor="#FFFFE8" colspan="4"><%=subject%></td>
   </tr>
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> �ۼ��� </td>
  <td bgcolor="#FFFFE8"><%=name%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> ��ϳ�¥ </td>
  <td bgcolor="#FFFFE8"><%=regdate%></td>
 </tr>
<tr> 
    <td colspan="4" height="150px"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">÷������</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> ��ϵ� ������ �����ϴ�.<%}%>
     </td>
     <td>
     <%=filename%></td>
     </tr>
     <tr>
     <td><img  width="100%"src="fileupload/tt.png"></td>
     
     <!--td> �̹��� ��������</td-->
   </tr>
   
   <tr>
    <td colspan="4" align="right">
       ��ȸ��  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/><!-- onclick="location.href='javascript:list()' "/location.href='update.jsp?nowPage=<%=nowPage%>&num=<%=num%>'  reply.jsp?nowPage=<%=nowPage%>-->
 <button type="button" onclick="location.href = 'MainForm.jsp?contentPage=Community/list.jsp&title=COMMUNITY'">����Ʈ</button>
 <button type="button" onclick="location.href = 'MainForm.jsp?contentPage=Community/update.jsp&title=EDIT&nowPage=<%=nowPage%>&num=<%=num%>'">����</button>
 <button type="button" onclick="location.href ='MainForm.jsp?contentPage=Community/reply.jsp&nowPage=<%=nowPage%>' ">�亯</button>
 <button type="button" onclick="location.href='MainForm.jsp?contentPage=Community/delete.jsp&title=DELETE&nowPage=<%=nowPage%>&num=<%=num%>' ">����</button>

  </td>
 </tr>
</table>
        </center><!--id=review-->
        </div>
        </div>

</div>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="MainForm.jsp?contentPage=Community/list.jsp&title=REVIEW">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
 </div>
</body>
</html>
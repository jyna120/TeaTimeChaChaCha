<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="Community.BoardBean"%>
<jsp:useBean id="bMgr" class="Community.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
    
	String title = "글 읽기";
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
	  bMgr.upCount(num);//조회수 증가
	  BoardBean bean = bMgr.getBoard(num);//게시물 가져오기
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<title>후기게시판</title>
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
	
	function down(filename){
		 document.downFrm.filename.value=filename;
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
    <td align="center" bgcolor="#DDDDDD" width="20%"> 찻집 </td>
    <td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
   </tr>
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="20%"> 작성자 </td>
  <td bgcolor="#FFFFE8"width="30%"><%=name%></td>
  <td align="center" bgcolor="#DDDDDD" width="20%"> 날짜 </td>
  <td bgcolor="#FFFFE8" width="30%"><%=regdate%></td>
 </tr>
<tr> 
    <td colspan="4" height="240px"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a style="text-decoration-line:none;color:black" href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
     </td>
    
     
   </tr>
   
   <tr>
    <td colspan="4" align="right">
       조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 
 <tr>
  <td align="center" colspan="2"height="50px> 
 <hr/><!-- onclick="location.href='javascript:list()' "/location.href='update.jsp?nowPage=<%=nowPage%>&num=<%=num%>'  reply.jsp?nowPage=<%=nowPage%>-->
 <button type="button" onclick="location.href = 'community.jsp'">리스트</button>
 <button type="button" onclick="location.href = 'update.jsp?&nowPage=<%=nowPage%>&num=<%=num%>'">수정</button>
 <button type="button" onclick="location.href ='reply.jsp?&nowPage=<%=nowPage%>' ">답변</button>
 <button type="button" onclick="location.href='delete.jsp?&title=DELETE&nowPage=<%=nowPage%>&num=<%=num%>' ">삭제</button>

  </td>
 </tr>
</table>
        </center><!--id=review-->
        </div>
        </div>

</div>

<form name="downFrm" action="Community/download.jsp" method="post">
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
 <div id="footer"> 
       		티타임 차차차 <br/>
        	Developers 하나의 이변 from 성신여자대학교 
        </div>
</body>
</html>
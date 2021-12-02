<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, package_db.*"%>
<jsp:useBean id="teaMgr" class="package_db.TeaMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>티타임 차차차</title>
<link href="homeStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../headerStyle.css" type="text/css">
<script type="text/javascript">
</script>
</head>
<body>
<div id="section" style="text-align: center; width:100%; height:600px; ">
	<div id="table">
	<table width="100%" cellpadding="2" cellspacing="0">
		<div class="dayTea">
			<p>오늘의 차 추천</p><br/>
			<% 					
				Vector<TeaBean> vlist = teaMgr.getTeaList();
				int counter = vlist.size();
				int r  = (int)(Math.random()*counter);
				TeaBean teaBean =vlist.get(r);
			%>
			<p class="teaRandom"><%=teaBean.getTea_name()%></p>
			한잔 어떠세요?<br/><br/>
			<a class="teaMore" href="MainForm.jsp?contentPage=Tea/teaInfo.jsp&title=TEA&c=<%=r%>">>> 더보기</a>		
		</div>
		<!-- line -->
		<div class="line"></div>
		<tbody align="center" height="100%">
			<tr>
				<td width="50%"><img src="https://wildernessandcruises.com/wp-content/uploads/2020/11/pexels-mareefe-1417945-768x528.jpg"
				size="cover"></td>
				<td width="50%">text</td>
			</tr>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>
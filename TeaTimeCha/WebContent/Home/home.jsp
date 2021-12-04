<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, package_db.*"%>
<jsp:useBean id="teaMgr" class="package_db.TeaMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>티타임 차차차</title>
<link rel="stylesheet" href="../headerStyle.css" type="text/css">
<script type="text/javascript">
</script>
</head>
<body>
<div id="section" style="text-align: center; width:100%; ">
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
		<tbody align="center" >
			<tr class="image">
				<td width="70%"><img src="Home/홈1.jpg" width="80%"></td>
				<td><i>여유를 담은 차 한잔,<br/><br/>일상의 힐링으로 다가오다.</i><br/><br/><br/><br/>티타임 차차차는<br/><br/>서울에 있는 전통 찻집과 차를 소개하며,<br/>후기를 남겨 기록할 수 있는 공간입니다.</td>
			</tr>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>
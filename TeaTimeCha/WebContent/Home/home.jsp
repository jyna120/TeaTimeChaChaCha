<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, package_db.*"%>
<jsp:useBean id="teaMgr" class="package_db.TeaMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ƼŸ�� ������</title>
<link rel="stylesheet" href="../headerStyle.css" type="text/css">
<script type="text/javascript">
</script>
</head>
<body>
<div id="section" style="text-align: center; width:100%; ">
	<div id="table">
	<table width="100%" cellpadding="2" cellspacing="0">
		<div class="dayTea">
			<p>������ �� ��õ</p><br/>
			<% 					
				Vector<TeaBean> vlist = teaMgr.getTeaList();
				int counter = vlist.size();
				int r  = (int)(Math.random()*counter);
				TeaBean teaBean =vlist.get(r);
			%>
			<p class="teaRandom"><%=teaBean.getTea_name()%></p>
			���� �����?<br/><br/>
			<a class="teaMore" href="MainForm.jsp?contentPage=Tea/teaInfo.jsp&title=TEA&c=<%=r%>">>> ������</a>		
		</div>
		<!-- line -->
		<div class="line"></div>
		<tbody align="center" >
			<tr class="image">
				<td width="70%"><img src="Home/Ȩ1.jpg" width="80%"></td>
				<td><i>������ ���� �� ����,<br/><br/>�ϻ��� �������� �ٰ�����.</i><br/><br/><br/><br/>ƼŸ�� ��������<br/><br/>���￡ �ִ� ���� ������ ���� �Ұ��ϸ�,<br/>�ı⸦ ���� ����� �� �ִ� �����Դϴ�.</td>
			</tr>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>
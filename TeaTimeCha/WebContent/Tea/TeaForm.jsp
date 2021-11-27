<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, package_db.*"%>
<jsp:useBean id="teaMgr" class="package_db.TeaMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="joinStyle.css" type="text/css">
<link rel="stylesheet" href="../headerStyle.css" type="text/css">

<title>Tea</title>
</head>
<body>
<div class="tea_container">
	<h2> 
		차 페이지
	</h2> 
	<table bordercolor="#CCD5AE" border="1">
	<tr>
	   <td><strong>차 이름</strong></td>
	   <td><strong>차 종류</strong></td>
	   <td><strong>차 맛</strong></td>
	   <td><strong>차 효능</strong></td>
	</tr>
	<%
		Vector<TeaBean> vlist = teaMgr.getTeaList();
		int counter = vlist.size();
		for(int i=0; i<vlist.size(); i++){
	   		TeaBean teaBean =vlist.get(i);
	%>
	<tr>
		<td><%=teaBean.getTea_name()%></td>
		<td><%=teaBean.getTea_type()%></td>
		<td><%=teaBean.getTea_taste()%></td>
		<td><%=teaBean.getTea_effect()%></td>
	</tr>
	<%
   		}
	%>
	</table>
	<br/>
	<br/>
	등록된 차 수 : <%= counter %> 
</div>
</body>
</html>
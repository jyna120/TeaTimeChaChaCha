<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, package_db.*"%>
<jsp:useBean id="teaMgr" class="package_db.TeaMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="ChaStyle.css" type="text/css">

<title>Tea</title>
</head>
<body>
<div class="tea_container">
	<%
		Vector<TeaBean> vlist = teaMgr.getTeaList();
		int counter = vlist.size();
		for(int i=0; i<vlist.size(); i++){
	   		TeaBean teaBean =vlist.get(i);
	%>
	<div class="tea_box" onclick="location.href = 'MainForm.jsp?contentPage=Tea/teaInfo.jsp&title=TEA&c=<%=i%>'">
		<img class="teaPreview" src="TeaImage/<%=teaBean.getTea_image()%>" >
		<p><%=teaBean.getTea_name()%></p>
	</div>
	<%} %>
</div>
</body>
</html>
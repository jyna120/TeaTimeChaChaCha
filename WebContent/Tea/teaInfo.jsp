<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.util.*, package_db.*"%>
<jsp:useBean id="teaMgr" class="package_db.TeaMgrPool" />

<html>
<head>
<%	
	
	request.setCharacterEncoding("EUC-KR");
	String c = "0";
	String num = request.getParameter("c");
	if (num != null) {
        c = num;
   }
	int teac = Integer.parseInt(c);
	Vector<TeaBean> vlist = teaMgr.getTeaList();
	TeaBean teaBean =vlist.get(teac);
	
	String teaName = teaBean.getTea_name();
	String teaType = teaBean.getTea_type();
	String teaTaste = teaBean.getTea_taste();
	String teaEffect = teaBean.getTea_effect();
	String teaImage= teaBean.getTea_image();
%>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../ChaStyle.css" type="text/css">
<title>Tea Information</title>
</head>
<body>
 	<table class="teaTable">
 		<tr class="teaTr" ><!-- 차 이미지 -->
 			<td class="teaTd"></td>
 			<td class="teaTd"><img class="teaImg" src="TeaImage/<%=teaImage%>" ></td>
 		</tr>
 		<tr class="teaTr"><!-- 차 이름 -->
 			<td class="teaTd">이름</td>
 			<td class="teaTd"><%=teaName%></td>
 		</tr>
 		<tr class="teaTr"><!-- 차 종류 -->
 			<td class="teaTd">종류</td>
 			<td class="teaTd"><%=teaType%></td>
 		</tr>
 		<tr class="teaTr"><!-- 차 맛 -->
 			<td class="teaTd">맛</td>
 			<td class="teaTd"><%=teaTaste%></td>
 		</tr>
 		<tr class="teaTr"><!-- 차 효능 -->
 			<td class="teaTd">효능</td>
 			<td class="teaTd"><%=teaEffect%></td>
 		</tr>
 		
 	</table>
</body>
</html>
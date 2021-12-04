<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, package_db.*"%>
<jsp:useBean id="cafeMgr" class="package_db.CafeMgrPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>카페</title>
<link rel="stylesheet" href="../headerStyle.css" type="text/css">
<link rel="stylesheet" href="ChaStyle.css" type="text/css">
<script type="text/javascript">
</script>
</head>
<body>
<div id="section" style="text-align: center; width:100%;">
	<div id="cafebar">
		<!--
		<div class="order">
			<form method="post" action="forwardTest6_1.jsp">
			<input type="submit" value="리뷰순">
			</form>
		</div>
	 	-->
		<div id="search">
			<select class="form-control" name="searchField">
				<option value="0">선택</option>
				<option value="cafeName">이름</option>
				<option value="cafeAddress">지역</option>
			</select>
			<input type="text" class="form-control" name="searchText" maxlength="100">
			<button type="submit">찾기</button>
			</form>
		</div>
	</div>
	<!-- line -->
	<div class="line"></div>
	<div class="cafe_container">
	<%
		Vector<CafeBean> vlist = cafeMgr.getTeaList();
		int counter = vlist.size();
		for(int i=0; i<vlist.size(); i++){
	   		CafeBean cafeBean =vlist.get(i);
	%>
	<table class="cafe_box">
	<tbody>
		<tr>
			<td class="cafe_image"><img class="cafePreview" src="CafeImage/<%=cafeBean.getCafe_image()%>" ></td>
			<td class="cafe_info"><p class="cafe_name"><%=cafeBean.getCafe_name()%></p><br/><%=cafeBean.getCafe_address()%><br/><br/><%=cafeBean.getCafe_info()%></td>
		</tr>
	</tbody>
	</table>
	<!-- line -->
	<div class="line"></div>
	<%} %>
</div>
</div>
</body>
</html>
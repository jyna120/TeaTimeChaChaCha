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
<div id="section" style="text-align: center;">
	<div id="cafebar">
		<div class="dayTea">
			<span>서울에 있는 찻집 리스트</span>
		</div>
		<!--
		<div id="search">
			<div class="row">
			<form method="get" name="search" action="cafeList.jsp">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">이름</option>
								<option value="userID">주소</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">찾기</button></td>
					</tr>
				</table>
			</form>
		</div>
		</div>
		-->
	</div>
	<!-- line -->
	<div class="line"></div>
	<div class="cafe_container">
		<%
			Vector<CafeBean> vlist = cafeMgr.getCafeList();
			int counter = vlist.size();
			for(int i=0; i<vlist.size(); i++){
	   			CafeBean cafeBean =vlist.get(i);
		%>
		<table class="cafe_box">
		<tr>
			<td class="cafe_image"><img class="cafePreview" src="CafeImage/<%=cafeBean.getCafe_image()%>" ></td>
			<td class="cafe_info"><p class="cafe_name"><%=cafeBean.getCafe_name()%></p><br/><br/><%=cafeBean.getCafe_address()%><br/><br/><%=cafeBean.getCafe_info()%></td>
		</tr>
		</table>
		<!-- line -->
		<div class="line"></div>
		<%} %>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="loginStyle.css" type="text/css">
<link rel="stylesheet" href="../headerStyle.css" type="text/css">

<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.member_id.value == "") {
			alert("���̵� �Է��� �ּ���.");
			document.loginFrm.member_id.focus();
			return;
		}
		if (document.loginFrm.member_pwd.value == "") {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.loginFrm.member_pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>

<title>�α���</title>
</head>
<body>
<div id="header" >
	<div id="nav">
	<nav>
        <ul>
            <li><a href="../Home/home.jsp">�Ұ�</a></li>
            <li><a>|</a></li>
            <li><a href="#">��</a></li>
            <li><a>|</a></li>
            <li><a href="../Cafe/cafe.jsp">ī��</a></li>
            <li><a>|</a></li>
            <li><a href="../Community/community.jsp">�ı�</a></li>
            <li><a>|</a></li>
            <li><a href="../Join&Login/LoginForm.jsp">�α���</a></li>
        </ul>   
    </nav>   
	</div>

	<h2 id="headerTitle" ></h2>
</div>	
	<div class="login_containers"> 
		<h2> 
			�α���
		 </h2> 
		 <%if (id != null) {%>
		<b><%=id%></b>�� ȯ�� �մϴ�.
		<p>���ѵ� ����� ��� �� ���� �ֽ��ϴ�.<p/>
			<a class="alogout" href="logout.jsp">�α׾ƿ�</a>
			<%} else {%>
		<form name="loginFrm" method="post" action="loginProc.jsp"> 
		<h3>
			���̵�
		</h3> 
		<div class="loginID"> 
			<input type="text" class="input" placeholder="���̵�" name="member_id" maxlength="20"> 
		</div> 
		<h3>
			��й�ȣ
		</h3> 
		<div class="loginPassword"> 
			<input type="password" class="input" placeholder="��й�ȣ" name="member_pwd" maxlength="20"> 
		</div> 
		<input type="button" class="bt_login" value="�α���" onclick="loginCheck()">&nbsp;
		<input type="button" class="bt_join" value="ȸ������" onclick="location.href='JoinForm.jsp'">
		</form> 
		<%}%>
	</div>
<br>

<div id="footer">
	Footer ���� : Banner
</div>
</body>
</html>
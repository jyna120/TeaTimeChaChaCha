<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="loginStyle.css" type="text/css">
<link rel="stylesheet" href="../headerStyle.css" type="text/css">

<script type="text/javascript">
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
		<form method="post" action="#"> 
		<h3>
			���̵�
		</h3> 
		<div class="loginID"> 
			<input type="text" class="input" placeholder="���̵�" name="userID" maxlength="20"> 
		</div> 
		<h3>
			��й�ȣ
		</h3> 
		<div class="loginPassword"> 
			<input type="password" class="input" placeholder="��й�ȣ" name="userPassword" maxlength="20"> 
		</div> 
		<input type="submit" class="bt_login" value="�α���"> 
		<input type="button" class="bt_join" value="ȸ������" onclick="location.href='JoinForm.jsp'">
		</form> 
	</div>
<br>

<div id="footer">
	Footer ���� : Banner
</div>
</body>
</html>
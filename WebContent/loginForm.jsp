<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%
	// ȸ������ �ϸ鼭 ���� �Ӽ��� ���� msg ������
	String msg = (String)session.getAttribute("msg");

	// ���� ���ٽ� �ƹ��͵� �����ϱ� �λ�~
	if(msg == null) {
		msg = "�������";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>LoginForm</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script>
		// ȸ������ ��ư ������� join.jsp�� �̵�
		function goJoin() {
			location.href="join.jsp"
		}
		
		// �α��� ��ư ������� checkLogin.jsp�� �̵�
		function checkLogin() {
			// input�� ���� ������ �Ѿ�� CUD�ҰŴϱ� post�� submit
			var obj = document.loginForm;
			obj.action = "checkLogin.jsp";
			obj.method = "post";
			obj.submit();
		}
	</script>
</head>
<body>
	<p class="titleStr">
		Login
	</p>
	<form name="loginForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" /><br/>
			<div class="btns">
				<input type="button" value="�α���" onclick="checkLogin()" />
				<input type="button" value="ȸ������" onclick="goJoin()" />
			</div>
		</div>
		<div class="msgBox">
			<%= msg %>
		</div>		
	</form>
</body>
</html>
<!-- ��� �۾��� �������� ���� �Ӽ��� ����� msg�� ���� ���� -->
<%@ include file="removeMessage.jspf" %>
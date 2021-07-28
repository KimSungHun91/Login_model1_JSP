<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%
	// 회원가입 하면서 세션 속성에 담은 msg 가져옴
	String msg = (String)session.getAttribute("msg");

	// 최초 접근시 아무것도 없으니까 인삿말~
	if(msg == null) {
		msg = "어서오세요";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>LoginForm</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script>
		// 회원가입 버튼 누른경우 join.jsp로 이동
		function goJoin() {
			location.href="join.jsp"
		}
		
		// 로그인 버튼 누른경우 checkLogin.jsp로 이동
		function checkLogin() {
			// input의 값을 가지고 넘어가서 CUD할거니까 post로 submit
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
				<input type="button" value="로그인" onclick="checkLogin()" />
				<input type="button" value="회원가입" onclick="goJoin()" />
			</div>
		</div>
		<div class="msgBox">
			<%= msg %>
		</div>		
	</form>
</body>
</html>
<!-- 모든 작업이 끝나고나면 세션 속성에 저장된 msg의 내용 삭제 -->
<%@ include file="removeMessage.jspf" %>
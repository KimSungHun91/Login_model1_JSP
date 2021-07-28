<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="checkSession.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Info.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script>
	function doUpdate() {
		var obj = document.infoForm;
		
		var flag = true;
		for(var i=0; flag && i<obj.length; i++) {
			if(obj[i].type.toLowerCase() != "button") {
				if(obj[i].value.trim().length == 0) {
					document.getElementById("msg").innerHTML = "필수입력항목 누락 : " + obj[i].title;
					flag = false;
				}
			}
		}
		
		if(flag) {
			if(obj.u_pw.value != obj.u_re.value) {
				document.getElementById("mgs").innerHTML = "비밀번호가 일치하지 않습니다.";
				flag = false;
			}
		}
		
		if(flag) {
			obj.method = "post";
			obj.action = "doUpdate.jsp";
			obj.submit();
		}
	}
	
	function cancelInfo() {
		location.href = "cancelInfo.jsp";
	}
	
	function deleteMember() {
		if(window.confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "doDelete.jsp";
		}
	}
</script>
</head>
<body>
	<p class="titleStr">
		Info
	</p>
	<form name="infoForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" readonly="readonly" value="<%= member.getU_id() %>" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" title="Password" /><br/>
			<label for="u_re">Retry :</label> <input type="password" name="u_re" title="Retry" /><br/>
			<label for="u_name">Name :</label> <input type="text" name="u_name" title="Name" readonly="readonly" value=<%= member.getU_name() %> /><br/>
			<label for="u_nick">Nick :</label> <input type="text" name="u_nick" title="Nickname" value=<%= member.getU_nick() %> /><br/>				
			<div class="btns">
				<input type="button" value="수정" onclick="doUpdate()" />
				<input type="button" value="취소" onclick="cancelInfo() "/>
				<input type="button" value="회원탈퇴" onclick="deleteMember()" />
			</div>
		</div>
		<div class="msgBox">
			<%= session.getAttribute("msg") %>
		</div>		
	</form>	
</body>
</html>
<%@ include file="removeMessage.jspf" %>
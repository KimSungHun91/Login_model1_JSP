<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.*" %>
<%
	String msg = (String)session.getAttribute("msg");
	if(msg == null) {
		msg = "모든 항목은 필수입력입니다.";
	}
	
	// 처음엔 멤버가 없음 -> 회원가입 하는 도중의 정보를 남겨줌 tempMember
	Member member = (Member)session.getAttribute("tempMember");
	if(member == null) {
		// 아무 정보도 없는 멤버를 들고옴
		// 밑에 value가 빈문자열이 찍힘
		member = MemberManager.getBlankMember();
	}
	session.removeAttribute("tempMember");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>join.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script>
	function checkAndMove() {
		var obj = document.joinForm;
		
		var flag = true;
		// joinForm에서
		for(var i=0; flag && i<obj.length; i++) {
			// 타입이 button 버튼이 아닌 경우 
			if(obj[i].type.toLowerCase() != "button") {
				// 공백 확인
				if(obj[i].value.trim().length == 0) {
					document.getElementById("msg").innerHTML = "필수입력항목 누락 : " + obj[i].title;
					flag = false;
				}
			}
		}
		
		if(flag) {
			// 비밀번호와 비밀번호 재입력 일치 확인
			if(obj.u_pw.value != obj.u_re.value) {
				document.getElementById("msg").innerHTML = "비밀번호가 일치하지 않습니다."
				flag = false;
			}
		}
		
		// 모든 조건 성공(회원가입 성공), doJoin.jsp로 이동
		if(flag) {
			obj.method = "post";
			obj.action = "doJoin.jsp";
			obj.submit();
		}
	}
	
	function cancelJoin() {
		location.href="cancelJoin.jsp"
	}
</script>
</head>
<body>	
	<p class="titleStr">
		Join Member
	</p>
	<form name="joinForm">
		<div class="centerBox">
			<label for="u_id">ID :</label> <input type="text" name="u_id" title="ID" value="<%= member.getU_id() %>" /><br/>
			<label for="u_pw">PW :</label> <input type="password" name="u_pw" title="PASSWORD" /><br/>
			<label for="u_re">Retry :</label> <input type="password" name="u_re" title="RETRY" /><br/>
			<label for="u_name">Name :</label> <input type="text" name="u_name" title="NAME" value="<%= member.getU_name() %>" /><br/>
			<label for="u_nick">Nick :</label> <input type="text" name="u_nick" title="NICKNAME" value="<%= member.getU_nick() %>" /><br/>				
			<div class="btns">
				<input type="button" value="회원가입" onclick="checkAndMove()" />
				<input type="button" value="취소" onclick="cancelJoin()" />		
			</div>
		</div>
		<div class="msgBox" id="msg">
			<%= msg %>
		</div>	
	</form>	
</body>
</html>
<%@ include file="removeMessage.jspf" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.*"%>
<%
	// 로그인 한 유저의 id와 pw 가져옴
	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	
	// 로그인 한 유저가 회원가입을 했는지 확인
	Member member = MemberManager.findMember(application, u_id);
	String msg;
	String nextPage = "loginForm.jsp";
	// 회원가입 안함
	if(member == null) {
		msg = "가입 후 이용해 주세요.";
	} else {
		// 비밀번호 불일치
		if(!member.getU_pw().equals(u_pw)) {
			msg = "비밀번호가 일치하지 않습니다.";
		} else {
			// 로그인 성공
			msg = member.getU_nick() + "님 환영합니다.";
			nextPage = "loginSuccess.jsp";
			session.setAttribute("member", member);
		}
	}
	session.setAttribute("msg", msg);
%>
<jsp:forward page="<%= nextPage %>"></jsp:forward>
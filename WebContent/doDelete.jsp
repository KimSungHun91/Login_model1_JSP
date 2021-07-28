<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.*" %>
<%@ include file="checkSession.jspf" %>
<%
	if(MemberManager.deleteMember(application, member.getU_id())) {
		session.invalidate();
		session = request.getSession();
		session.setAttribute("msg", "회원탈퇴가 완료되었습니다.");
		response.sendRedirect("loginForm.jsp");
	} else {
		session.setAttribute("msg", "회원탈퇴중 오류가 발생했습니다.");
%>
	<jsp:forward page="info.jsp"></jsp:forward>
<%
	}
%>
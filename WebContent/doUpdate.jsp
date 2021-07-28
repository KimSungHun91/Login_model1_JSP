<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="checkSession.jspf" %>
<%@ page import="kr.ac.green.*" %>
<%
	request.setCharacterEncoding("EUC_KR");
	member.setU_pw(request.getParameter("u_pw"));
	member.setU_nick(request.getParameter("u_nick"));
	
	MemberManager.updateMember(application, member);
	session.setAttribute("msg", "회원정보가 수정되었습니다.");
	response.sendRedirect("loginSuccess.jsp");
%>
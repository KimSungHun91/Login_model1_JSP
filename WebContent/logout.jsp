<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="checkSession.jspf" %>
<%
	session.invalidate();
	
	session = request.getSession();
	session.setAttribute("msg", "로그아웃 되었습니다.");
%>
<jsp:forward page="loginForm.jsp"></jsp:forward>
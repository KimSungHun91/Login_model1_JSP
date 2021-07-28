<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.*"%>
<%@ page import="java.util.*"%>
<%
	// post니까 인코딩
	request.setCharacterEncoding("EUC_KR");
%>
<jsp:useBean id="member" class="kr.ac.green.Member"></jsp:useBean>
<%-- 파라미터로 넘어온 값이 Member.java 멤버변수에 자동으로 set됨 --%>
<jsp:setProperty property="*" name="member"/>

<%
	String msg = "회원가입 성공";
	String nextPage = "loginForm.jsp";
	if(!MemberManager.addMember(application, member)) {
		msg = "이미 존재하는 아이디입니다.";
		session.setAttribute("tempMember", member);
		nextPage = "join.jsp";
	}
	session.setAttribute("msg", msg);
	response.sendRedirect(nextPage);
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.*"%>
<%@ page import="java.util.*"%>
<%
	// post�ϱ� ���ڵ�
	request.setCharacterEncoding("EUC_KR");
%>
<jsp:useBean id="member" class="kr.ac.green.Member"></jsp:useBean>
<%-- �Ķ���ͷ� �Ѿ�� ���� Member.java ��������� �ڵ����� set�� --%>
<jsp:setProperty property="*" name="member"/>

<%
	String msg = "ȸ������ ����";
	String nextPage = "loginForm.jsp";
	if(!MemberManager.addMember(application, member)) {
		msg = "�̹� �����ϴ� ���̵��Դϴ�.";
		session.setAttribute("tempMember", member);
		nextPage = "join.jsp";
	}
	session.setAttribute("msg", msg);
	response.sendRedirect(nextPage);
%>
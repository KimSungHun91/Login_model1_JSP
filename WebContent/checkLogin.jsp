<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.green.*"%>
<%
	// �α��� �� ������ id�� pw ������
	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	
	// �α��� �� ������ ȸ�������� �ߴ��� Ȯ��
	Member member = MemberManager.findMember(application, u_id);
	String msg;
	String nextPage = "loginForm.jsp";
	// ȸ������ ����
	if(member == null) {
		msg = "���� �� �̿��� �ּ���.";
	} else {
		// ��й�ȣ ����ġ
		if(!member.getU_pw().equals(u_pw)) {
			msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
		} else {
			// �α��� ����
			msg = member.getU_nick() + "�� ȯ���մϴ�.";
			nextPage = "loginSuccess.jsp";
			session.setAttribute("member", member);
		}
	}
	session.setAttribute("msg", msg);
%>
<jsp:forward page="<%= nextPage %>"></jsp:forward>
<%@page import="sist.com.dao.TaehoonDao"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(TaehoonDao.idcheckProcess(id, password)){
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(120);
		response.sendRedirect("index.jsp");
	}else{
		out.println("<script>alert('�������� ���� ���̵��̰ų�, �߸��� ��й�ȣ�Դϴ�.');location.href='loginMain.jsp';</script>");
	}
	
%>
</head>
<body>
	
</body>
</html>
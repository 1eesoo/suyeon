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
	String id = request.getParameter("idchekfun");
	String password = request.getParameter("pwchekfun");
	
	//out.println(id+" "+password);
	
	
	if(TaehoonDao.idcheckProcess(id, password)){
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(20);
		response.sendRedirect("info.jsp");//���⿡ ���� �ּҸ� ������ ��
	}else{
		out.println("<script>alert('�������� ���� ���̵��̰ų�, �߸��� ��й�ȣ�Դϴ�.');location.href='info.jsp';</script>");
	} 
	
%>
</head>
<body>
	
</body>
</html>
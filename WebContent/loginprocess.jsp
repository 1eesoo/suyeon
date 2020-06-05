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
		out.println("<script>alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');location.href='loginMain.jsp';</script>");
	}
	
%>
</head>
<body>
	
</body>
</html>
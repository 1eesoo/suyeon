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
		response.sendRedirect("info.jsp");//여기에 보낼 주소를 적으면 됨
	}else{
		out.println("<script>alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');location.href='info.jsp';</script>");
	} 
	
%>
</head>
<body>
	
</body>
</html>
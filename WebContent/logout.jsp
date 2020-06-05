<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
</head>
<body>
</body>
</html>
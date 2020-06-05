<%@page import="java.util.HashMap"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script>

</script>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageData = request.getParameter("page");
	String type = request.getParameter("type");
	
	if(type.equals("qna")){
		AppleDao.deleteQna(no);
		/* 부모의 REPLY값 변화*/
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("num", request.getParameter("pno"));
		map.put("mode", "del");
		
		AppleDao.updateReply(map);
		
		response.sendRedirect("community.jsp?type="+type+"&page="+pageData);
	}else if(type.equals("notice")){
		AppleDao.deleteNotice(no);
		
		response.sendRedirect("community.jsp?type="+type+"&page="+pageData);
		
	}else if(type.equals("event")){
		AppleDao.deleteEvent(no);
	
		response.sendRedirect("community.jsp?type="+type+"&page="+pageData);
		
	}
%>
</body>
</html>
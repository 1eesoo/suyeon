<%@page import="sist.com.dao.TaehoonDao"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>üũ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
  $(function(){
	  
  });
</script>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="member" class="sist.com.model.SemiMemberBean" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
</head>
<body>
<%-- <%=member %> --%>



<%
   //out.println(member);
    TaehoonDao.insertMember(member);
    out.println("<script>alert('ȸ������ �Ǿ����ϴ�'); location.href='loginMain.jsp';</script>");
  
%>

</body>
</html>
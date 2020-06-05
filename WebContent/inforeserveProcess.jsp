<%@page import="sist.com.dao.SungsuDao"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@page import="sist.com.model.SemiReserveBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String date = request.getParameter("date");
	String count = request.getParameter("count");
	String pno = request.getParameter("pno");
	String id =(String)session.getAttribute("id");
	
	if(id==null){
		id="DOE";
	}
	
	out.println("date:"+date+" count:"+count+" pno:"+pno);
	
	
	if(date!=null||count!=null||pno!=null||id!=null){
	SemiReserveBean srb = new SemiReserveBean();
	int cno = AppleDao.getCnoFromPno(Integer.parseInt(pno));
	
	srb.setId(id);
	srb.setCno(cno);
	srb.setPno(Integer.parseInt(pno));
	srb.setRcount(Integer.parseInt(count));
	srb.setRdate(date);
	
	SungsuDao.anInsertsemireserve(srb);
	}
	response.sendRedirect("/semicolonweb/myReservation.jsp?id="+id+"&pno="+pno+"");
%>
<script type="text/javascript">
alert('예약완료');
</script>
</body>

</html>
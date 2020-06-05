<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="sist.com.model.SemiReserveBean"%>
<%@page import="sist.com.model.SemiReviewBean"%>
<%@page import="sist.com.dao.SuyeonSemiDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
  $(function(){
	  
  });
</script>
<%request.setCharacterEncoding("EUC-KR"); %>

</head>
<body>


<%

	String path="C:\\Javaworkspace\\Semicolon\\semicolonweb\\WebContent\\semiupload\\";
	SemiReviewBean srb=new SemiReviewBean();
	if(FileUpload.isMultipartContent(request)){
		DiskFileUpload diskFileUpload=new DiskFileUpload();
		diskFileUpload.setRepositoryPath(path);
		diskFileUpload.setFileSizeMax(1024*1024*5);
		List<FileItem>fileList=diskFileUpload.parseRequest(request);
		String fixFile="";
		for(FileItem fileItem:fileList){
			String name=fileItem.getFieldName();//input name
			
			if(name.equals("rvcontents")){
				srb.setRvcontents(fileItem.getString("EUC-KR"));
			}
			
			String fileName="";
			
			if(!fileItem.isFormField()){
				if(fileItem.getName().length()==0)
					continue;
				fileName=(System.currentTimeMillis()+fileItem.getName());
				
				File file=new File(path+fileName);
				try{
					fileItem.write(file);
					srb.setRvfilename(fileName);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			srb.setRvfilename(srb.getRvfilename() == null ? "noimg.jpg" : srb.getRvfilename());
			
			
		}
	}
		String pno=request.getParameter("pno");
		String cno=request.getParameter("cno");
		String id=request.getParameter("id");
		srb.setPno(Integer.parseInt(pno));
		srb.setCno(Integer.parseInt(cno));
		srb.setId(id);
		srb.setRvgrade("5");
		SuyeonSemiDao.insertReview(srb);
		response.sendRedirect("info.jsp?pno="+pno+"&id="+id+"");
	
	
%>
</body>
</html>
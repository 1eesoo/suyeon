<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@page import="sist.com.model.SemiProductBean"%>
<%@page import="sist.com.model.SemiCompanyBean"%>
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
		request.setCharacterEncoding("EUC-KR");

		String id = request.getParameter("id");
		String type = request.getParameter("type");

		if (type.equals("company")) {
			String name = request.getParameter("name");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String tel3 = request.getParameter("tel3");
			String post1 = request.getParameter("post1");
			String post2 = request.getParameter("post2");
			String post3 = request.getParameter("post3");

			String tel = tel1 + "-" + tel2 + "-" + tel3;
			String post = post1 + "-" + post2 + "-" + post3;

			SemiCompanyBean sc = new SemiCompanyBean();

			sc.setCname(name);
			sc.setCtel(tel);
			sc.setCadd(post);

			AppleDao.insertCompany(sc);

			response.sendRedirect("index.jsp");
		} else if (type.equals("product")) {

			// 			multipartdata

			SemiProductBean sp = new SemiProductBean();
			int no = 0;
			String path = "C:\\semicolonweb\\semicolonweb\\WebContent\\semiupload\\";

			if (FileUpload.isMultipartContent(request)) {
				DiskFileUpload diskFileUpload = new DiskFileUpload();
				diskFileUpload.setRepositoryPath(path);
				diskFileUpload.setSizeMax(1024 * 1024 * 5);
				List<FileItem> list = diskFileUpload.parseRequest(request);

				/* 게시판별 분기*/
				for (FileItem fileItem : list) {
					String name = fileItem.getFieldName();

					
					if (name.equals("name")) {
						sp.setPname(fileItem.getString("EUC-KR"));
					}

					if (name.equals("price")) {
						sp.setpPrice(Integer.parseInt(fileItem.getString("EUC-KR")));
					}
					if (name.equals("selectProductse")) {
						sp.setPtype(fileItem.getString("EUC-KR"));
					}
					if (name.equals("cno")) {
						sp.setCno(Integer.parseInt(fileItem.getString("EUC-KR")));
					}
					
					if (name.equals("pstock")) {
						sp.setPstock(Integer.parseInt(fileItem.getString("EUC-KR")));
					}
 
					String fileName = "";
					//         	String fixFile="";
					if (!fileItem.isFormField()) {//input file
						if (fileItem.getName().length() == 0)
							continue;
						fileName = (System.currentTimeMillis() + fileItem.getName());
						//         		    fixFile+=fileName+"#";
						File file = new File(path + fileName);
						try {
							fileItem.write(file);
							sp.setPfilename(fileName);

						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} //for
				sp.setPfilename(sp.getPfilename() == null ? "noimg.jpg" : sp.getPfilename());
				
				AppleDao.insertProduct(sp);
				
				response.sendRedirect("/semicolonweb/list.jsp?page=1&id="+id);
			}
		}
	%>

</body>
</html>
<%@page import="sist.com.dao.AppleDao"%>
<%@page import="sist.com.model.SemiEventBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
<link rel="stylesheet" href="/semicolonweb/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
</script>
<%
int no = 2;
if(request.getParameter("no")!=null){
	 no = Integer.parseInt(request.getParameter("no"));
}
	String pageData = request.getParameter("page");
	
	
	SemiEventBean seb = null;	
	if(no!=0){
	 seb = (SemiEventBean)AppleDao.eventInfo(no);	
	}
	
	/* ID�������� */
	String id = (String)request.getSession().getAttribute("id");
	
	
%>
<style>
table tr td{
	text-align:left;
}
	.contents{
		margin: 50px auto;
		width: 60%; height: 700px;
		text-align: center;
	}
	.btnGroup{
		float: right;
		margin-bottom: 50px;
	}
	.table, tr, .th, td{
		border-top: #000;
		border: 1px solid #000;
		
	}
		.ftr{
			border-top: 1px solid black;
		}
		.th{
			width: 10%;
		}
		.content th,.content td {
			height: 300px;
			line-height: 300px;
		}
		.imgFile th{
			height: 100px;
			line-height: 100px;
		}
			.imgFile img{
				display: block;
				width: 100px; height: 100px;
			}
</style>

</head>
<body>
   <!--::header part start::-->
  <header class="main_menu">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                  <div class="col-lg-6 col-sm-12 col-md-6">
                       <!--  <div class="sub_menu_social_icon">
                            <a href="#"><i class="flaticon-facebook"></i></a>
                            <a href="#"><i class="flaticon-twitter"></i></a>
                            <a href="#"><i class="flaticon-skype"></i></a>
                            <a href="#"><i class="flaticon-instagram"></i></a>
                            <span><i class="flaticon-phone-call"></i>+880 356 257 142</a></span> -->
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">
                        
                              <%if(id!=null){ %>                              
                            <span><%=id %>�� �ȳ��ϼ���</span>                          
                            <a href="logout.jsp">�α׾ƿ�</a>
                            <a href="myInfo.jsp?id=<%=id%>">���� ������</a>
                            <%if(id.equals("admin")){ %>
                            <a href="admincontrolMain.jsp">������������</a>
                            <%
                            }
                            %>
                             <%
                            }else{
                            %>
                             <span>OO�� �ȳ��ϼ���</span>
                            <a href="loginMain.jsp">�α���</a>
                            <a href="#">���� ������</a>
                            <a href="#"></a>
                            <%
                            }
                            %>
                        </div>
                    </div>
                  
                </div>
            </div>
        
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="/semicolonweb/index.jsp"> <img src="/semicolonweb/img/semi_logo.png" alt="logo" width="200" height="80"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                     <li class="nav-item">
                                        <a class="nav-link" href="/semicolonweb/index.jsp?id=<%=id %>">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/semicolonweb/list.jsp?page=1&id=<%=id %>">��ǰ���</a>
                                        
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/semicolonweb/community.jsp?id=<%=id %>">Ŀ�´�Ƽ</a>
                                    </li>
                                </ul>
                            </div>
                            <a href="#" class="btn_1 d-none d-lg-block">book now</a>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->
    
    <div class="contents">
    	<div class="btnGroup">
    	<button class="back"><a id="aback" href="community.jsp?type=event&no=<%=no %>&page=<%=pageData%>">���</a></button>
    	
    	<% if(seb.getId().equals(id)||id.equals("admin")){%>
    		<button class="mod"><a id="aedit" href="eventForm.jsp?type=event&mode=modify&page=<%=pageData %>&no=<%=no%>">����</a></button>
    		<button class="del"><a id="adelete" href="delete.jsp?type=event&no=<%=no %>">����</a></button>
    		<%} %>
  
  <%
  if(id.equals("admin")){
	  %>
    		<button class="del"><a id="ainsert" href="insert.jsp?type=eprogress&no=<%=no %>&page=<%=pageData %>>">����</a></button>
   		<%
    		}
  %>
    	</div>
    	<div>
    		<table class="table">
    			<tr class="ftr">
    				<th class="th">�۹�ȣ</th>
    				<td><%=seb.getEno() %></td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">�ۼ���</th>
    				<td><%=seb.getEdate() %></td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">�ۼ���</th>
    				<td><%=seb.getId() %></td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">����</th>
    				<td><%=seb.getEtitle() %></td>
    			</tr>
    			<tr class="content">
    				<th class="th">����</th>
    				<td><%=seb.getEcontents() %></td>
    			</tr>
    			<tr class="imgFile">
    				<th class="th">÷������</th>
    				<td>
    					<img src="/semicolonweb/semiupload/<%=seb.getEfilename() %>" alt="testimg" >
    				</td>
    			</tr>
    		</table>
    	</div>
    </div>
    
    	<!-- footer part start-->
	<footer class="footer-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-sm-6 col-md-5">
					<div class="single-footer-widget">
						<h4>���������� Ÿ������ �˻�</h4>
						<!-- Ȥ�� �̺�Ʈ? -->
						<ul>
							<li><a href="#">����Ű</a></li>
							<li><a href="#">����ŷ</a></li>
							<li><a href="#">London, UK</a></li>
							<li><a href="#">Saintmartine, Bangladesh</a></li>
							<li><a href="#">Mount Everast, India</a></li>
							<li><a href="#">Sidney, Australia</a></li>
							<li><a href="#">Miami, USA</a></li>
							<li><a href="#">California, USA</a></li>
							<li><a href="#">London, UK</a></li>
							<li><a href="#">Saintmartine, Bangladesh</a></li>
							<li><a href="#">Mount Everast, India</a></li>
							<li><a href="#">Sidney, Australia</a></li>
						</ul>

					</div>
				</div>

				<div class="col-sm-6 col-md-3">
					<div class="single-footer-widget footer_icon">
						<h4>Contact Us</h4>
						<!--                         <p>4156, New garden, New York, USA
                                +880 362 352 783</p> -->
						<span>contact@martine.com</span>
						<div class="social-icons">
							<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
								class="ti-twitter-alt"></i></a> <a href="#"><i
								class="ti-pinterest"></i></a> <a href="#"><i
								class="ti-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="copyright_part_text text-center">
						<p class="footer-text m-0">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="ti-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer part end-->
    </body>
    </html>
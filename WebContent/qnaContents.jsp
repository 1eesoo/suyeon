<%@page import="sist.com.dao.AppleDao"%>
<%@page import="sist.com.model.SemiQnaBean"%>
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
	int no = Integer.parseInt(request.getParameter("no"));
	String pageData = request.getParameter("page");
	SemiQnaBean sqb = null;	
	if(no!=0){
	 sqb = (SemiQnaBean)AppleDao.qnaInfo(no);	
	}
	
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
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">
                              <%if(id!=null){ %>                              
                            <span><%=id %>님 안녕하세요</span>                          
                            <a href="logout.jsp">로그아웃</a>
                            <a href="myInfo.jsp?id=<%=id%>">마이 페이지</a>
                            <%if(id.equals("admin")){ %>
                            <a href="admincontrolMain.jsp">관리자페이지</a>
                            <%
                            }
                            %>
                             <%
                            }else{
                            %>
                             <span>OO님 안녕하세요</span>
                            <a href="loginMain.jsp">로그인</a>
                            <a href="#">마이 페이지</a>
                            <a href="#"></a>
                            <%
                            }
                            %>
                        </div>
                    </div>
                  
                </div>
            </div>
        </div>
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="index.jsp?id=<%=id %>"> <img src="/semicolonweb/img/semi_logo.png" alt="logo" width="200" height="80"> </a>
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
                                        <a class="nav-link" href="/semicolonweb/list.jsp?page=1&id=<%=id %>">상품목록</a>
                                        
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/semicolonweb/community.jsp?id=<%=id %>">커뮤니티</a>
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
  
  <button class="back"><a id="aback" href="community.jsp?type=qna&no=<%=no %>&page=<%=pageData%>">목록</a></button>
  <% if(sqb.getId().equals(id)||id.equals("admin")){ %>
    		<button class="mod"><a id="aedit" href="qnaForm.jsp?type=qna&mode=modify&page=<%=pageData %>&no=<%= no%>">수정</a></button>
    		<button class="del">  <a id="adelete" href="delete.jsp?type=qna&no=<%=no %>">삭제</a></button>
    	<%} %>
    		<%-- <%
    			if(id!=null && id.equals("admin")){
    		%> --%>
    		<%if(id.equals("admin")){ %>
    		<button class="reply">
    		<a id="areply" href="qnaForm.jsp?type=qna&mode=reply&page=<%=pageData %>&ref=<%=sqb.getRef()%>&lev=<%=sqb.getLev() %>&pnum=<%=sqb.getQno()%>&step=<%=sqb.getStep() %>">답글</a>
    		</button>
    		<%} %>
    		<%-- <%
    			}
    		%> --%>
    	</div>
    	<div>
 
    		<table class="table">
    			<tr class="ftr">
    				<th class="th">글번호</th>
    				<td><%=sqb.getQno() %></td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">작성일</th>
    				<td><%=sqb.getQdate() %></td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">작성자</th>
    				<td><%=sqb.getId() %></td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">제목</th>
    				<td><%=sqb.getQtitle() %></td>
    			</tr>
    			<tr class="content">
    				<th class="th">내용</th>
    				<td><%=sqb.getQcontents() %></td>
    			</tr>
    			<tr class="imgFile">
    				<th class="th">첨부파일</th>
    				<td>
    					<img alt="" src="/semicolonweb/semiupload/<%=sqb.getQfilename()%>">
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
						<h4>레저스포츠 타입으로 검색</h4>
						<!-- 혹은 이벤트? -->
						<ul>
							<li><a href="#">수상스키</a></li>
							<li><a href="#">하이킹</a></li>
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
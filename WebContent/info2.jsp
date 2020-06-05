<%@page import="sist.com.model.SemiProductBean"%>
<%@page import="sist.com.dao.SungsuDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SEMI;LEISURE SPORTS</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min2.css">
<!-- themify CSS -->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/infoStyle.css">
<link href="dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css">

<%
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {
		e.printStackTrace();
	}
	int m = 0;
	Calendar tDay = Calendar.getInstance();
	int y = tDay.get(Calendar.YEAR);

	if (currentPage == 1) {
		m = tDay.get(Calendar.MONTH);
	} else {
		m = (tDay.get(Calendar.MONTH)) + (currentPage - 1);
	}
	int d = tDay.get(Calendar.DATE);

	Calendar dSet = Calendar.getInstance();
	dSet.set(y, m, 1);
	int yo = dSet.get(Calendar.DAY_OF_WEEK);
	int last_day = tDay.getActualMaximum(Calendar.DATE);
	
	
	SemiProductBean np = null;	
	/* ��ǰ������ �������� */
	int pno=0;
	if(request.getParameter("pno")!=null){
	pno = Integer.parseInt(request.getParameter("pno"));
	np = SungsuDao.anselectProductFromPno(pno);	
	}
	
	
	
%>
<head>

<link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
<link rel="stylesheet" href="/semicolonweb/css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<!-- <script src="/semicolonweb/js/infoEx.js" charset="UTF-8"></script> -->
<!-- <script src="/semicolonweb/js/custom.js"></script> -->

<script type="text/javascript">
	
</script>

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

						<%
							String id = "DOE";
							if (id != null) {
						%>
						<span><%=id%>�� �ȳ��ϼ���</span> <a href="logout.jsp">�α׾ƿ�</a> <a
							href="/semicolonweb/myInfo.jsp">���� ������</a>
						<%
							if (id.equals("admin")) {
						%>
						<a href="admincontrolMain.jsp">������������</a>
						<%
							}
						%>
						<%
							} else {
						%>
						<span>OO�� �ȳ��ϼ���</span> <a href="loginMain.jsp">�α���</a> <a
							href="/semicolonweb/myInfo.jsp">���� ������</a> <a href="#"></a>
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
						<nav
							class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="/semicolonweb/index.jsp"> <img
								src="/semicolonweb/img/semi_logo.png" alt="logo" width="200"
								height="80">
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div
								class="collapse navbar-collapse main-menu-item justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item"><a class="nav-link"
										href="/semicolonweb/index.jsp">Home</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/semicolonweb/info.jsp">����</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/semicolonweb/community.jsp">Ŀ�´�Ƽ</a></li>
									<!-- <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Blog
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="blog.html">Blog</a>
                                            <a class="dropdown-item" href="single-blog.html">Single blog</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            pages
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="top_place.html">top place</a>
                                            <a class="dropdown-item" href="tour_details.html">tour details</a>
                                            <a class="dropdown-item" href="elements.html">Elements</a>
                                        </div>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.html">Contact</a>
                                    </li>-->
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
	<%
		if (currentPage == 1) {
	%>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>Reservation</h2>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<%
		}
	%>

	<!--top place start-->
	<section class="event_part section_padding">
		<div class="bgOp"></div>
		<div class="imgContainer">

<%
	if(np!=null){
%>
			<img id="img" alt="img"
				src="/semicolonweb/semiupload/<%=np.getPfilename() %>"
				width="500" height="500">
				
<%
	}
%>
		</div>

		<div class="container">
			<div id="reserve">
				<div id="reserve_contents">
					<h5>�����ϱ�</h5>
					<br>
					<h2>Maldeve - Asia</h2>
					<!-- ���� ������ ��ǰ�� -->
					<!-- �޷� ���� -->
					<table border="1">
						<tr>
							<td align="center" colspan="7">
								<%
									if (currentPage == 1) {
								%> <a id="monthid"><%=y%>��<%=(m + 1)%>��</a> �޷� <a
								href="info.jsp?page=<%=currentPage + 1%>">Next</a> <%
 	} else if (currentPage > 1 && currentPage < 5) {
 %> <a href="info.jsp?page=<%=currentPage - 1%>">Before</a> <a
								id="monthid"><%=y%>��<%=(m + 1)%>��</a> �޷� <a
								href="info.jsp?page=<%=currentPage + 1%>">Next</a> <%
 	} else if (currentPage > 4) {
 %> <a href="info.jsp?page=<%=currentPage - 1%>">Before</a> <a
								id="monthid"><%=y%>��<%=(m + 1)%>��</a> �޷� <%
 	}
 %>
							</td>
						</tr>
						<tr>
							<%
								String[] a = {"sun", "mon", "tue", "wed", "thu", "fri", "sat"};
								for (int i = 0; i < 7; i++) {
							%>
							<td width="50" align="center"><%=a[i]%></td>
							<%
								}
							%>
						</tr>
						<tr>
							<%
								for (int k = 1; k < yo; k++) {
							%>
							<td></td>
							<%
								}
							%>
							<%
								for (int j = 1; j <= last_day; j++) {
							%>
							<td align="center">
								<%
									if (d <= j) {
								%> <a id="dayid" onmouseover="style='cursor:pointer'"><%=j%></a> <%
 	} else {
 %> <a id="dayid" onmouseover="style='cursor:pointer'"> <%=j%> </a> <%
 	}
 %> <%
 	if ((yo + j - 1) % 7 == 0) {
 %>
							</td>
						</tr>
						<tr>
							<%
								}
								}
								for (int e = 1; e <= (7 - yo); e++) {
							%>
							<td></td>
							<%
								}
							%>
						</tr>
					</table>
					<br>
					<!-- �޷� �� -->


					<%
						/* ��ǰ�� �����ɴϴ� */
					%>
					<p>
						���೯¥: <span id="dayid"></span>
					</p>
					<br>
					<p>
						��ǰ����: <span id="pprice">&nbsp;<%= np!=null?np.getpPrice():""%></span>
					</p>
					<br>
					<p>
						�����ο�: <span> <input type="text" name="pv"
							readonly="readonly" size="7" /> <select name="pv1">
								<option value="empty" selected="selected">�����ϼ���</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="direct">�����Է�</option>
								<option></option>
						</select><br>
						</span>
					</p>
<!-- 					<div class="rating"> -->
<!-- 						<span>Rating:</span> -->
<!-- 						<div class="place_review"> -->
<!-- 							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i -->
<!-- 								class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a> -->
<!-- 							<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i -->
<!-- 								class="fas fa-star"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<a href="#" class="btn_1">�����ϱ�</a>
				</div>
			</div>

		</div>

	</section>
	<!--top place end-->

	<section id="productInfo"></section>

	<section id="productReview">
		<div id="review">
			<div id="reviewTop">
				<h2>��ǰ����</h2>
				<p>��ǰ�� �����Ͻ� �е��� �ۼ��Ͻ� �����Դϴ�.</p>
			</div>

			<!-- <div class="writeReview">
					<button class="writeBtn">�����ۼ��ϱ�</button>    		
	    		</div> -->

			<!-- <div id="reviewCount">
	    			<ul>
	    				<li>
	    					<p>����� �� ����</p>
	    				</li>
	    				<li>
	    					<p>�� ���  ��</p>
	    				</li>
	    				<li>
	    					<p>���� ����</p>
	    				</li>
	    			</ul>
	    		</div> -->

			<div class="sortReview">
				<ul id="sortReview">
					<li class="liFirst">���� 00��</li>
					<li><a href="#">�ֽż�</a></li>
					<li><a href="#">����������</a></li>
					<li><a href="#">����������</a></li>
				</ul>
			</div>

			<div id="reviewUl">
				<ul class="reviewUl1">
					<li>
						<div class="rating">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
						</div>
					</li>
					<li>5</li>
				</ul>
				<ul class="reviewUl2">
					<li class="secondLine">�̼���</li>
					<li>2020.05.14</li>
					<li>��ǰ��</li>
				</ul>
				<ul class="reviewUl3">
					<li class="thirdLine">�ı⳻��</li>
					<li><img
						src="/semicolonweb/images/demo/backgrounds/bicycleboard.jpg"
						width="50" height="50"></li>
					<li>��ȸ��</li>
				</ul>
			</div>

			<!-- <div id="reviewTable">
	    		
		    		<table border="1">
		    		
		    			<tr>
		    				<td colspan="2">
		    					 <div class="rating">
	                                  <div class="place_review">
	                                      <a href="#"><i class="fas fa-star"></i></a>
	                                      <a href="#"><i class="fas fa-star"></i></a>
	                                      <a href="#"><i class="fas fa-star"></i></a>
	                                      <a href="#"><i class="fas fa-star"></i></a>
	                                      <a href="#"><i class="fas fa-star"></i></a>
	                                  </div>
	                              </div>
		    				</td>
		    				<td colspan="3">
		    					5
		    				</td>
		    			
		    			</tr>
		    			
		    			<tr>
		    				<td>�̼���</td>
		    				<td>2020.05.14</td>
		    				<td colspan="3">��ǰ��</td>
		    				
		    			</tr>
		    			
		    			<tr>
		    				<td colspan="3">
		    					��Ծ~~!
		    				</td>
		    			
		    				<td>
		    					<img src="/semicolonweb/images/demo/backgrounds/bicycleboard.jpg" width="50" height="50">
		    				</td>
		    				<td>��ȸ��</td>
		    			</tr>
		    			
		    		</table>
	    		</div>
	    		 -->
		</div>


	</section>


	<!-- footer part start-->
	<footer class="footer-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-sm-6 col-md-5">
					<div class="single-footer-widget">
						<h4>Discover Destination</h4>
						<ul>
							<li><a href="#">Miami, USA</a></li>
							<li><a href="#">California, USA</a></li>
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
				<div class="col-sm-6 col-md-4">
					<div class="single-footer-widget">
						<h4>Subscribe Newsletter</h4>
						<div class="form-wrap" id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="form-inline">
								<input class="form-control" name="EMAIL"
									placeholder="Your Email Address"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Your Email Address '" required=""
									type="email">
								<button class="click-btn btn btn-default text-uppercase">
									<i class="far fa-paper-plane"></i>
								</button>
								<div style="position: absolute; left: -5000px;">
									<input name="b_36c4fd991d266f23781ded980_aefe40901a"
										tabindex="-1" value="" type="text">
								</div>

								<div class="info"></div>
							</form>
						</div>
						<p>Subscribe our newsletter to get update news and offers</p>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="single-footer-widget footer_icon">
						<h4>Contact Us</h4>
						<p>4156, New garden, New York, USA +880 362 352 783</p>
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

	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- magnific js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- masonry js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- masonry js -->
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/gijgo.min.js"></script>
	<!-- contact js -->
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/contact.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>
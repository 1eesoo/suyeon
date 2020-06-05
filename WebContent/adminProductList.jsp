
<%@page import="sist.com.model.SemiCompanyBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.HashSet"%>
<%@page import="sist.com.model.SemiMemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="sist.com.model.SemiProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!doctype html>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<html lang="en">
<%
	request.setCharacterEncoding("EUC-KR");

	ArrayList<SemiProductBean> pList = null;
	HashMap<Integer,String> cList=null;
	String id = (String) request.getSession().getAttribute("id"); 
	//id="Admin";	//�׽�Ʈ
	if(!id.equals("admin")){
		response.sendRedirect("loginMain.jsp");
	}
	HashMap<String, Object> pMap = new HashMap<String, Object>();

	int productScale = 9; // �������� ��ǰ��
	int pageScale = 6; //	��� �ϴܿ� ǥ�õǴ� ��������
	int totalRow = AppleDao.getProductTotalRow();
	int totalPage = 0;
	int totalPages = (totalRow % productScale == 0) ? (totalRow / productScale) : (totalRow / productScale) + 1;
	totalPage = totalPages == 0 ? 1 : totalPages;
	String pageData = request.getParameter("page");
	if (pageData == null) {
		pageData = "1";
	}
	int currentPage = Integer.parseInt(pageData);
	if (currentPage == 0) {
		currentPage = 1;
	}
	int currentBlock = (currentPage % pageScale == 0)
			? (currentPage / pageScale)
			: (currentPage / pageScale) + 1;

	int start = 1 + (currentPage - 1) * productScale;
	int end = productScale + (currentPage - 1) * productScale;

	int startPage = 1 + (currentBlock - 1) * pageScale;
	int endPage = pageScale + (currentBlock - 1) * pageScale;

	endPage = endPage >= totalPage ? totalPage : endPage;

	HashMap<String, Object> map = new HashMap<String, Object>();

	String query = request.getParameter("query");

	map.put("query", query);

	map.put("start", start);
	map.put("end", end);
	pList = (ArrayList<SemiProductBean>) AppleDao.selectProduct(map);
//	cList=(ArrayList<SemiCompanyBean>) AdminPlistDao.selectCompany();
// 	int itemNo=0;	//��� ǥ�ÿ� �ѹ� 
%>
<head>
<!-- Required meta tags -->
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
<link rel="stylesheet" href="/semicolonweb/css/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Martine</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("input#search").click(function() {
			var select = $("select[name=query] option:selected").val();

			if (select == 'empty') {
				alert('�����ϼ���');
				return false;
			}

			$("form[name=searchForm]").submit();
		});

	});
</script>
<style>
#floatMenu {
	border-radius: 30px;
	position: absolute;
	width: 200px;
	height: 400px;
	right: 50px;
	top: 250px;
	background-color: #F0F0F0;
	border: 3px solid red;
}

.pageCenter {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #2f3e66;
	opacity: 0.5;
	color: white;
}
.pagination

 

a


:hover


:not

 

(
.active

 

)
{
background-color


:


#ddd


;
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

						<%
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
									<li class="nav-item">
                                        <a class="nav-link" href="/semicolonweb/index.jsp?id=<%=id %>">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/semicolonweb/list.jsp?page=1&id=<%=id %>">��ǰ���</a>
                                        
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/semicolonweb/community.jsp?id=<%=id %>">Ŀ�´�Ƽ</a>
                                    </li>
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

	<!-- breadcrumb start-->

	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>Admin-��ǰ</h2>
							<!-- <p>home . Packages</p> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<section class="searchSection"
		style="text-align: right; float: right; margin-right: 350px;">
		<div>
			<form action="" method="post" name="searchForm">
				<table class="bbsWrite mgb35" style="align: right;">
					<tbody>
						<tr>
							<td><select name="query">
									<option selected="selected" value="empty">�����ϼ���</option>
									<option value="new">�ֽż�</option>
									<option value="lowprice">�������ݼ�</option>
									<option value="highprice">�������ݼ�</option>
									<option value="company">�Ǹ�ó��</option>
									<option value="type">������</option>
							</select> <input type="button" id="search" value="Search" /></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</section>

	<!-- about us css start-->

<section>
	<div>
		<table>
			<tr>
				<th></th>
				<th>��ǰ��ȣ</th>
				<th>��ǰ�̹���</th>
				<th>��ǰ��</th>
				<th>ȸ���ȣ</th>
				<th>ȸ���</th>
				<th>��ǰ����</th>
				<th>��ǰ����</th>
			<tr>
			<%
				if(pList!=null){	
				for (int i = 0; i < pList.size(); i++) {
			%>
			<tr>
				<td><input type="checkBox"></td>
				<td><%=pList.get(i).getPno() %></td>
				<td><img src="/semicolonweb/semiupload/<%=pList.get(i).getPfilename()%>" alt="<%=pList.get(i).getPfilename()%>" width=30 height=30></td>
				<td><%=pList.get(i).getPname() %></td>
				<td><%=pList.get(i).getCno() %></td>
				<td><%= %></td>
				<td><%=pList.get(i).getPno() %></td>
				<td><%=pList.get(i).getPno() %></td>
			</tr>
				<%
				}
				%>
		</table>
	</div>
</section>

<!-- �������� -->
	<section class="hotel_list section_padding single_page_hotel_list">
		<div class="container">
			<div class="row justify-content-center" style=""></div>
			<div class="row">

				<%
					if(pList!=null){	
				for (int i = 0; i < pList.size(); i++) {
				%>
				<!-- ��� -->
				<div class="col-lg-4 col-sm-6">
					<!-- ������ǰ(��������) -->
					<div class="single_ihotel_list">
						<!-- ������ǰ -->
						<img
							src="/semicolonweb/semiupload/<%=pList.get(i).getPfilename()%>"
							alt="<%=pList.get(i).getPfilename()%>" width=300 height=300>
						<!--  
			                <div class="hover_text">
                            <div class="hotel_social_icon">
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                    <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                </ul>
                            </div>
                            <div class="share_icon">
                                <i class="ti-share"></i>
                            </div>
                        </div> -->
						<div class="hotel_text_iner">
							<h3>
								<a href="/semicolonweb/info.jsp?pno=<%=pList.get(i).getPno()%>"> <%=pList.get(i).getPname()%></a>
							</h3>
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <span>(210 review)</span>
							</div>
							<p>
								�Ǹ�ó :
								<%=AppleDao.getCnameFromPno(pList.get(i).getPno())%></p>
							<p>
								���� :
								<%=pList.get(i).getPtype()%></p>
							<p>
								���� :
								<%=pList.get(i).getPstock()%></p>
							<h5>
								From <span><%=pList.get(i).getpPrice()%></span>
							</h5>
						</div>
					</div>
				</div>
				<%
					}
					}
				%>

			</div>
		</div>

	</section>
	<!-- /�������� -->
	
	<!-- about us css end-->

	<div class="pageCenter">
		<div class="pagination">
			<%
				if (currentBlock > 1) {
			%>
			<a href="/semicolonweb/list.jsp?page=<%=startPage - 1%>">&laquo;</a>
			<%
				} else {
			%>
			<a href="#">&laquo;</a>
			<%
				}
			%>
			

			<%
				for (int i = startPage; i <= endPage; i++) {

					if (currentPage == i) {
			%>
			<a href="#"><font color="red" size="3"><%=i%></font></a>
			<%
				} else {
			%>
			<a href="/semicolonweb/list.jsp?page=<%=i%>"><%=i%></a>
			<%
				}
				}
				if (totalPage > endPage) {
			%>
			<a href="/semicolonweb/list.jsp?page=<%=endPage + 1%>">&raquo;</a>
			<%
				} else {
			%>
			<a href="#">&raquo;</a>
			<%
					}
				}
			%>
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
				<!--  <div class="col-sm-6 col-md-4">
                    <div class="single-footer-widget">
                        <h4>Subscribe Newsletter</h4>
                        <div class="form-wrap" id="mc_embed_signup">
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="form-inline">
                                <input class="form-control" name="EMAIL" placeholder="Your Email Address"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '"
                                    required="" type="email">
                                <button class="click-btn btn btn-default text-uppercase"> <i class="far fa-paper-plane"></i>
                                </button>
                                <div style="position: absolute; left: -5000px;">
                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                        type="text">
                                </div>

                                <div class="info"></div>
                            </form>
                        </div>
                        <p>Subscribe our newsletter to get update news and offers</p>
                    </div>
                </div> -->
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
<a style="display:scroll;position:fixed;bottom:40px;right:10px; width:50px; height:50px" href="#" title=��������"><img src="/semicolonweb/semiupload/img_top.png"></a>

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
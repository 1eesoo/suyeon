<%@page import="sist.com.model.SemiCompanyBean"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@page import="sist.com.model.SemiReserveBean"%>
<%@page import="sist.com.dao.SungsuDao"%>
<%@page import="java.util.List"%>
<%@page import="sist.com.dao.TaehoonDao"%>
<%@page import="sist.com.model.SemiProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>

<html>
<%
//        String id = request.getParameter("id");
        List<SemiProductBean>list = TaehoonDao.selectTop4();
        //out.println(list);
        SemiProductBean bean1 = list.get(0);
        SemiProductBean bean2 = list.get(1);
        SemiProductBean bean3 = list.get(2);
        SemiProductBean bean4 = list.get(3);
        
       // out.println(bean1+" "+bean2);
        
        
// 		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("EUC-KR");
		String id = (String)request.getSession().getAttribute("id");
		
		/* if(id==null){
			id= "DOE";
		} */
		String com = request.getParameter("select1");
		
		if(com!=null){
		String pro = request.getParameter("select2");
		String dataFun = request.getParameter("dataFun");
		String timeFun = request.getParameter("timeFun");
		String countFun = request.getParameter("countFun");
		
		
		SemiProductBean sp = SungsuDao.selectProductFromPname(pro);
		
		
		int pno = sp.getPno();
		int cno = sp.getCno();
		
		int rcount = Integer.parseInt(countFun);
		
		
		String dataFunYear = dataFun.split("/")[2];
		String dataFunMonth = dataFun.split("/")[0];
		String dataFunday = dataFun.split("/")[1];
		
		String rtime = timeFun;
		
		String rdate = dataFunYear+"/"+dataFunMonth+"/"+dataFunday+" "+rtime;
		
		SemiReserveBean srb = new SemiReserveBean();
		
		srb.setId(id);
		srb.setPno(pno);
		srb.setCno(cno);
		srb.setRcount(rcount);
		srb.setRdate(rdate);

			
			
		
		session.setAttribute("semireservebean", srb);
		
		response.sendRedirect("/semicolonweb/info.jsp?id="+id);
		

		}
%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"></script>
<script  src="/semicolonweb/js/index.js" charset="UTF-8"></script>
<script type="text/javascript">

</script>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SEMI;LEISURESPORTS</title>
    <link rel="icon" href="/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="/semicolonweb/fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/magnific-popup.css">
    <link rel="stylesheet" href="/semicolonweb/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="/semicolonweb/css/style.css">
   
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

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1>SEMI;</h1>
                            <h1>LEISURE SPORTS</h1>
                            <p>Let's start your journey with us, your dream will come true</p>
                            <a href="#" class="btn_1">Discover Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- booking part start-->
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="hotel-tab" data-toggle="tab" href="#hotel" role="tab" aria-controls="hotel" aria-selected="true">Choice</a>
                            </li>
                           
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                
                                    <form action="" id="choiceFun" name="choiceFun" method="post">
                                        <div class="form-row">
                                           <div class="form_colum">
                                                <select class="nc_select" id="select1" name="select1" >
                                                
                                                <%                                                   
                                                   List<String> cnl = TaehoonDao.selectComName1();
                                                
                                                List<SemiCompanyBean> scb = AppleDao.selectCompany(); 
                                                
                                                %>
                                                
                                                      <option selected value='empty'>업체 </option>
                                                    <%
                                                      for(int i=0; i<scb.size(); i++){
                                                    %>
                                                    <option value="<%=scb.get(i).getCno()%>"><%=scb.get(i).getCname() %></option>
                                                    <%
                                                      }
                                                    %>
                                                    </select>
                                            </div>
                                            <div class="form_colum">
                                                <select   id="select2" name="select2">
                                                   
                                                </select>
                                            </div>
                                            <div class="form_colum">
                                                <input name="dataFun" id="datepicker_1" placeholder="이용날짜">
                                            </div>
                                            <div class="form_colum">
                                                <input name="timeFun" id="datepicker_2" placeholder="이용시간">
                                            </div>
                                            <div class="form_colum">
                                                <select class="nc_select" id="countFun" name="countFun" >
                                                    <option selected value="empty">이용인원</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>
                                            <input type="hidden" name="id" value="<%=id%>">
                                            <div class="form_btn">
                                                <a href="#" class="btn_1" id="searchFun">예약하기</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Header part end-->

    <!--top place start-->
    <section class="top_place section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>선호도</h2>
                        <p>현재 예약이 가장 많은 상품</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="/semicolonweb/semiupload/<%=bean1.getPfilename() %>" width="555" height="399" >
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                
                                <a href="info.jsp?pno=<%=bean1.getPno() %>&id=<%=id %>" class="place_btn">상세정보</a>
                                <h3><%=bean1.getPname() %></h3>
                                <p><%=bean1.getPtype() %></p>
                                <p><%=bean1.getpPrice() %>원</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span>(210 review)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="/semicolonweb/semiupload/<%=bean2.getPfilename() %>" width="555" height="399">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="info.jsp?pno=<%=bean2.getPno() %>&id=<%=id %>" class="place_btn">상세정보</a>
                                <h3><%=bean2.getPname() %></h3>
                                <p><%=bean2.getPtype() %></p>
                                <p><%=bean2.getpPrice() %>원</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span>(210 review)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="/semicolonweb/semiupload/<%=bean3.getPfilename() %>" width="555" height="399" >
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="info.jsp?pno=<%=bean3.getPno() %>&id=<%=id %>" class="place_btn">상세정보</a>
                               <h3><%=bean3.getPname() %></h3>
                                <p><%=bean3.getPtype() %></p>
                                <p><%=bean3.getpPrice() %>원</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span>(210 review)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img src="/semicolonweb/semiupload/<%=bean4.getPfilename() %>" width="555" height="399">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="info.jsp?pno=<%=bean4.getPno() %>&id=<%=id %>" class="place_btn">상세정보</a>
                                <h3><%=bean4.getPname() %></h3>
                                <p><%=bean4.getPtype() %></p>
                                <p><%=bean4.getpPrice() %>원</p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span>(210 review)</span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div>
               <!--  <a href="#" class="btn_1 text-cnter">Discover more</a> -->
            </div>
        </div>
    </section>
    <!--top place end-->

    <!--top place start-->
 <!--           <h2 style="text-align: center;">인기많은상품</h2>
    <section class="event_part section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="event_slider owl-carousel" >
                        <div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="col-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <h5>Upcoming Event</h5>
                                        <h2>Maldeve - Asia</h2>
                                        <p>Waters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged.
                                        </p>
                                        <p>date: <span>12 Aug 2019</span> </p>
                                        <p>Cost: <span>Start from $820</span> </p>
                                        <p>Organizer: <span> Martine Agency</span> </p>
                                        <div class="rating">
                                            <span>Rating:</span>
                                            <div class="place_review">
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                            </div>
                                        </div>
                                        <a href="#" class="btn_1">Plan Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="ol-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <h5>Upcoming Event</h5>
                                        <h2>Maldeve - Asia</h2>
                                        <p>Waters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged.
                                        </p>
                                        <p>date: <span>12 Aug 2019</span> </p>
                                        <p>Cost: <span>Start from $820</span> </p>
                                        <p>Organizer: <span> Martine Agency</span> </p>
                                        <div class="rating">
                                            <span>Rating:</span>
                                            <div class="place_review">
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                            </div>
                                        </div>
                                        <a href="#" class="btn_1">Plan Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="ol-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <h5>Upcoming Event</h5>
                                        <h2>Maldeve - Asia</h2>
                                        <p>Waters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged.
                                        </p>
                                        <p>date: <span>12 Aug 2019</span> </p>
                                        <p>Cost: <span>Start from $820</span> </p>
                                        <p>Organizer: <span> Martine Agency</span> </p>
                                        <div class="rating">
                                            <span>Rating:</span>
                                            <div class="place_review">
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                                <a href="#"><i class="fas fa-star"></i></a>
                                            </div>
                                        </div>
                                        <a href="#" class="btn_1">Plan Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!--top place end-->

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
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="single-footer-widget footer_icon">
                        <h4>Contact Us</h4>
                        <p>4156, New garden, New York, USA
                                +880 362 352 783</p>
                        <span>contact@martine.com</span>
                        <div class="social-icons">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                            <a href="#"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer part end-->

    <!-- jquery plugins here-->
    <script src="/semicolonweb/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="/semicolonweb/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="/semicolonweb/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="/semicolonweb/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="/semicolonweb/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="/semicolonweb/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="/semicolonweb/js/jquery.nice-select.min.js"></script>
    <script src="/semicolonweb/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="/semicolonweb/js/jquery.ajaxchimp.min.js"></script>
    <script src="/semicolonweb/js/jquery.form.js"></script>
    <script src="/semicolonweb/js/jquery.validate.min.js"></script>
    <script src="/semicolonweb/js/mail-script.js"></script>
    <script src="/semicolonweb/js/contact.js"></script>
    <!-- custom js -->
    <script src="/semicolonweb/js/custom.js"></script>
</body>

</html>
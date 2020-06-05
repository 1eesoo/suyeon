<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
<link rel="stylesheet" href="/semicolonweb/css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="/semicolonweb/js/login.js" charset="UTF-8"></script>

</head>
<body>
<form role="form" name = "login" method ="post" action="loginprocess.jsp">
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
                          
                            <a href="#">�α���</a>
                            <a href="#">���� ������</a>
                            <a href="#"></a>
                        </div>
                    </div>
                  
                </div>
            </div>
        
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="index.jsp"> <img src="/semicolonweb/img/semi_logo.png" alt="logo" width="200" height="80"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.jsp">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="list.jsp?page=1">��ǰ���</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="community.jsp">Ŀ�´�Ƽ</a>
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
    <article class="">
		<div class="">
			<div class="col-md-6 col-md-offset-3">
				<h3 align="center">�α���</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			
				<div class="form-group">
					<label for="inputName">ID</label> <input type="text"
						class="form-control" name="id" id="inputid" placeholder="���̵� �Է��� �ּ���">
				</div>
				
				<div class="form-group">
					<label for="inputPassword">��й�ȣ</label> <input type="password"
						class="form-control" name = "password" id="inputpassword" placeholder="��й�ȣ�� �Է����ּ���">
				</div>
				
	   		
				<br>
				
				<div class="form-group text-center">
					<button type="button" id="join-submit" class="btn btn-primary" onclick="idcheck()">
						�α���<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" id="buttonMain" class="btn btn-warning">
						ȸ������<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			
		</div>

	</article>
    </form>
    </body>
   </html>
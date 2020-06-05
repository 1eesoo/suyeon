<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü���</title>
<link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
<link rel="stylesheet" href="/semicolonweb/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script  src="/semicolonweb/js/cmember.js" charset="UTF-8"></script>
<%
	String id= (String)request.getSession().getAttribute("id");
%>
<style>
	table{
		margin: 50px auto;
		width: 50%; height: auto;
	}
		
	label{
		text-align: center;
		font-weight: bold;
		size: 20px;
		padding: 8px;
	}
	
	#btnDiv{
		width: 100px; height: 50px;
		margin: 0 auto;
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
                                        <a class="nav-link" href="index.jsp?id=<%=id %>">Home</a>
                                    </li>
                                   <!--  <li class="nav-item">
                                        <a class="nav-link" href="#">����</a>
                                        
                                    </li> -->
                                    <li class="nav-item">
                                        <a class="nav-link" href="admincontrolMain.jsp?id=<%=id %>">������������</a>
                                    </li>                          
                                </ul>
                            </div>
                           
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->
   <!-- CNO	CNAME	CTEL	CADD	 -->     
    <div id="registerComPart">
    	<h1 align="center" style="font-weight: bold; size: 50px; margin-top: 50px;">��ü���</h1>
    	<form action="registerProcess.jsp?type=company&id=<%=id %>" name="rcfrm" method="POST">
    		<table>
    			<tr>
    				<td>
    					<label>��ü��</label>
    				</td>
    				<td>
    					<input type="text" name="name" size="50" id = "id">
					    <input type="button" value="�ߺ�üũ" id="idCheck"	>
					    <span id="rsp"></span>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>��ü����ó</label>
    				</td>
    				<td>
    					<input type="text" name = "tel1" size="10"> -
			    		<input type="text" name = "tel2" size="10"> -
			    		<input type="text" name = "tel3" size="10">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>��ü�ּ�</label>
    				</td>
    				<td>
    					<input type="text" name="post1" class="inputText" size="10" readonly/> - <input type="text" name="post2" class="inputText" size="10" readonly/> 
			    		<span class="buttonFuc"><a href="#" id="sendPost">������ȣ</a></span>
    				</td>
    			</tr>
    			<tr>
    				<td><label>���ּ�1</label></td>
    				<td><input type="text" name="post3" size="50" readonly="readonly"/></td>
    			</tr>
    			<tr>
    				<td><label>���ּ�2</label></td>
    				<td><input type="text" name="post4" size="50" ></td>
    			</tr>
    		</table>
    		<div id="btnDiv">
	    		<input id="regiBtn" type="button" value="����ϱ�" >    		
    		</div>
   			
    	</form>
    </div>
</body>
</html>
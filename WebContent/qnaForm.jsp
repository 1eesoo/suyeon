<%@page import="java.util.HashMap"%>
<%@page import="sist.com.model.SemiQnaBean"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@page import="sist.com.model.SemiProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ǻ��׵���ϱ�</title>
<link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
<link rel="stylesheet" href="/semicolonweb/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("select[name=selectproduct]").change(function(){
			$("input[name=product]").val($("#select option:selected").text());
		});
		
		$("#regiBtn").click(function(){
			if($("select[name=selectproduct]").val()=='empty'){
				alert('��ǰ����� �����ϼ���');
			}else
		  if($("input[name=title]").val().length==0 ||
		  $("textarea[name=contents]").val().length==0){
			  alert('��ĭ�� �Է��ϼ���')
		  }else{
			document.qnaFrm.submit();
			}
		});
		
		  $('input[type=file]').change(function(){
			  $("input[name='fileField']").prop("disabled",false);
			  $("input[name='fileField']").val($('input[type=file]')[0].files[0].name);
			  
		  });
		  
		  
		  
		  
		  
		  
	});
	
	
	
	function init(){
		
	}
</script>

	<%
		
	/* type = ���� �� �Խ���
	   mode = new, reply, modify
	   pageData = ���ư� page
	*/
		String type = request.getParameter("type");
		String mode = request.getParameter("mode");
		String pageData = request.getParameter("page");
		String id = (String)request.getSession().getAttribute("id");
		
// 		String mode = "new";
// 		String pageData="1";

		int ref=0,step=0,lev=0,pnum=0;
		if(mode==null){
			mode = "new";
		}
		if(mode!=null&& mode.equals("reply")){
	    	   ref=Integer.parseInt(request.getParameter("ref"));
	    	   step=Integer.parseInt(request.getParameter("step"));
	    	   lev=Integer.parseInt(request.getParameter("lev"));
	    	   pnum=Integer.parseInt(request.getParameter("pnum"));
	       }
		
		SemiQnaBean sqb = null;
 		if(mode!=null&& mode.equals("modify")){
 			String no = request.getParameter("no");
 			sqb = (SemiQnaBean)AppleDao.qnaInfo(Integer.parseInt(no));
 			
 		}
	%>
<style>
	
	table{
		margin: 50px auto;
		width: 60%; height: auto;
	}
		
	label{
		text-align: center;
		font-weight: bold;
		size: 60px;
		padding: 8px;
	}
	
	#btnDiv{
		width: 100px; height: 50px;
		margin: 0 auto;
	}
	#txtarea{
		width: 700px; height: 300px;
		resize: none;
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
    
    <div id="qnaRegi">
    	<h1 align="center" style="font-weight: bold; size: 50px; margin-top: 50px;">���ǻ��׵��</h1>
    	<form action="insert.jsp?mode=<%=mode %>&type=qna&page=<%=pageData%>" name="qnaFrm" method="POST" enctype="multipart/form-data">
    		<table>
    			<tr>
    				<td>
    					<label>����</label>
    				</td>
    				<td>
    					<input type="text" name="title" value="<%=mode.equals("modify")?sqb.getQtitle():""%>" size="93">
    				</td>
    			</tr>
				<tr>
    				<td>
    					<label>��ǰ��</label>
    				</td>
    				<td>
    					<input type="text" readonly="readonly" value="<%=mode.equals("modify")?AppleDao.selectPnameFromPno(sqb.getPno()):"" %>" name = "product" size="20">
    					<select id = "select" name="selectproduct">
    					
    						<option selected="selected" value="empty">�����ϼ���</option>
    					<%
  	HashMap<String,Object> map = new HashMap<>();
							ArrayList<SemiProductBean> list = (ArrayList<SemiProductBean>)AppleDao.selectAllProduct();
							if(list!=null){
							for(int i = 0; i < list.size();i++){
						%>
							<option value="<%=list.get(i).getPno()%>"><%=list.get(i).getPname()%></option>
						<%
							}
							} 
						%>
    					</select>
    				
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>����</label>
    				</td>
    				<td>
    					<textarea id="txtarea" name="contents"><%=mode.equals("modify")?sqb.getQcontents():""%></textarea>
    				</td>
    			</tr>
    			<tr>
    				<td><label>÷������</label></td>
    				<td>
    					<input type="text" size="20" readonly ="readonly" name = "fileField"value= "<%=mode.equals("modify")?sqb.getQfilename():""%>"disabled="disabled">
    					<input type="file" name="file" >
    				</td>
    			</tr>
    		</table>
							<input  type="hidden" name="id" value="<%=id%>"/>
						    <%
							  if(mode!=null&& mode.equals("reply")){
							%>
							<input  type="hidden" name="ref" value="<%=ref%>"/>
							<input  type="hidden" name="step" value="<%=step%>"/>
							<input  type="hidden" name="lev" value="<%=lev%>"/>
							<input  type="hidden" name="pnum" value="<%=pnum%>"/>
							<%
							  }
							%>   			
    			<input type="hidden" name="no" value="<%=mode.equals("modify")?sqb.getQno():"" %>">
    		<div id="btnDiv">
	    		<input id="regiBtn" type="button" value="����ϱ�" >    		
    		</div>
    	</form>
    </div>
</body>
</html>
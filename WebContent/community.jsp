<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="sist.com.model.SemiNoticeBean"%>
<%@page import="sist.com.model.SemiEventBean"%>
<%@page import="sist.com.dao.AppleDao"%>
<%@page import="sist.com.model.SemiQnaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>COMMUNITYPAGE</title>
<link rel="shortcut icon" type="image/x-icon" href="/semicolonweb/img/semi_logo.png">
<link href="/semicolonweb/css/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="/semicolonweb/css/bootstrap.min.css">
<link rel="stylesheet" href="/semicolonweb/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<link rel="stylesheet" href="/semicolonweb/css/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js">
</script>
<%
	String type = request.getParameter("type");
	type= type==null?"qna":type;
	
// 	session.setAttribute("id", "admin");
	
	String id = (String)request.getSession().getAttribute("id");

%>
<script>
	$( function() {
		
		var id = '<%=id%>';
		
		
		/* 초기에 선택되는 탭 결정 */
		var type = '<%=type%>';
		var selectIndex;
		if(type=='qna'){
			selectIndex =0;
			
	             $(".comm_btn").hide();
	        	$("#awrite").attr("href",'/semicolonweb/qnaForm.jsp'+$("input#qna").attr("value"));
	        	if(id!=null){ 
	        	$(".comm_btn").show();
	        	}
	      
		}else if(type=='notice'){
			selectIndex =1;
	        	$(".comm_btn").hide();
	        	$("#awrite").attr("href",'/semicolonweb/noticeForm.jsp'+$("input#notice").attr("value"));
	        	if(id!=null && id=='admin'){
		        $(".comm_btn").show();
	        	}
		}else if(type=='event'){			
			selectIndex =2;
	        	$(".comm_btn").hide();
	        	$("#awrite").attr("href",'/semicolonweb/eventForm.jsp'+$("input#event").attr("value"));
	        	if(id!=null && id=='admin'){
	        	$(".comm_btn").show();
	        	}
		}
		
		$("#tabs").tabs({
			  active: selectIndex
		});
		  
		/* 탭이 클릭되면 선택된 탭에 따라 글쓰기 버튼의 href 변경 */
		$('#tabs').click('tabsselect', function (event, ui) {
	        var selectedTab = $("#tabs").tabs('option', 'active');
	        if(selectedTab == 0){
	        	 $(".comm_btn").hide();
	        	$("#awrite").attr("href",'/semicolonweb/qnaForm.jsp'+$("input#qna").attr("value"));
	        	if(id!=null){ 
	        	 $(".comm_btn").show();
	        	}
	        	
	       }else if(selectedTab==1){
	        	 $(".comm_btn").hide();
	        	$("#awrite").attr("href",'/semicolonweb/noticeForm.jsp'+$("input#notice").attr("value"));
	        	if(id!=null &&id=='admin'){
	        	 $(".comm_btn").show();
	        	}
	        }else if(selectedTab==2){
	        	$("#awrite").attr("href",'/semicolonweb/eventForm.jsp'+$("input#event").attr("value"));
	        	 $(".comm_btn").hide();
	        	if(id!=null &&id=='admin'){
	        	 $(".comm_btn").show();
	        	}
	        	
	        	
	        };
	    });
		$('a[href="#"]').click(function(e) {
			e.preventDefault();
		});
		$(".comm_btn").click(function(){
			$("#awrite").get(0).click();
		});
		
	} );

	
</script>
<style>
	#tabs{
		margin: 0 auto;
		width: 1300px; height: 500px;		
	}
	
	ul.tabs_ul{
		text-align: center;
		postion: relative;
		z-index: 1;	
	}
	
	#tabs .tabs_table{
		width: 80%;
		margin: 40px auto;
		font-size: 20px;
		text-align: center;		
	}
	
		#tabs .tabs_table th{
			padding: 10px 50px;					
		}
	
	#tabs h2{
		font-size: 50px;
		font-weight: bold;
		text-align: center;
		margin-top: 20px;
	}
	
	button.comm_btn{
		float: right;
		position: relative;
		z-index: 2;
		width: 100px; height: 50px;
		margin: 20px 100px;
		padding: 0;
		border: none;
		border-radius: 0;
		background-color:#fe5c24;
		transition: 0.5s;
	}
	
	button.comm_btn:hover{
		background-color: #007bff;
		transition: 0.5s;
	}
	
	button.comm_btn > a{
		color: #fff;
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
    
       <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>COMMUNITY</h2>
                            <p>문의사항 공지사항 이벤트</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
    <div class="comm_section">
    
    	
	   <%
	   		request.setCharacterEncoding("EUC-KR");
	
	 	    int pageScale=10;
	 	    int totalRow=0;
	 	    int totalPage=1;
	 	    int qnacurrentPage=1;
	 	    int eventcurrentPage=1;
	 	    int noticecurrentPage=1;
	 		totalRow=AppleDao.getQnaTotalRow();
	 	
	 		
	 			
	 		totalPage=(totalPage=totalRow%pageScale==0?(totalRow/pageScale):(totalRow/pageScale)+1)==0?1:totalPage;
	 	    try{
	 	    	qnacurrentPage=1;
	 	    	eventcurrentPage=1;
	 	    	noticecurrentPage=1;
	 	    	String pageData = request.getParameter("page");
	 			pageData= pageData==null?"1":pageData;
	 	    	if(type.equals("qna")){
	 	    	qnacurrentPage=Integer.parseInt(pageData);
	 	    	}else if(type.equals("event")){
	 	    	eventcurrentPage=Integer.parseInt(pageData);
	 	    	}else if(type.equals("notice")){
	 	    	noticecurrentPage=Integer.parseInt(pageData);
	 	    	}
	 	    }catch(Exception e){
	 	    	
	 	    }
	 	    //1page --->1  10
	 	    //2page---->11 20
	 	    /*  1BLOCK  STARTPAGE ENDPAGE [1][2]....[10]
	 		 2BLOCK  STARTPAGE ENDPAGE [11][2]....[20] */
	 	    int start=1+(qnacurrentPage-1)*pageScale;
	 	    int end=pageScale+(qnacurrentPage-1)*pageScale;
	 	    int currentBlock=qnacurrentPage%pageScale==0?(qnacurrentPage/pageScale):(qnacurrentPage/pageScale)+1;
	 	    int startPage=1+(currentBlock-1)*pageScale;
	 	    int endPage=(pageScale+(currentBlock-1)*pageScale);
	 	    endPage=(endPage)>=totalPage?totalPage:endPage;

		    HashMap<String,Object>map=new HashMap<String,Object>();
	 	    map.put("start",start);
	 	    map.put("end",end);	    		
	 	   
	   %>
    	
   <input type="hidden" id="qna" value="?type=qna&mode=new&page=<%=qnacurrentPage %>">
   <input type="hidden" id ="notice" value="?type=notice&mode=new&page=<%=noticecurrentPage %>">
   <input type="hidden" id ="event" value="?type=event&mode=new&page=<%=eventcurrentPage %>">
   
   <%if(id!=null){ %>
   <button class="comm_btn">
   <a id="awrite" href="/semicolonweb/qnaForm.jsp?type=qna&mode=new&page=<%=qnacurrentPage %>">글쓰기</a>
   </button>
   <%}%>
    <div id="tabs">
		  <ul class="tabs_ul">
		    <li><a href="#tabs-1">문의사항</a></li>
		    <li><a href="#tabs-2">공지사항</a></li>
		    <li><a href="#tabs-3">이벤트</a></li>
		  </ul>
		  <div id="tabs-1">
		   	<h2>문의사항</h2>
		    <table class="table" border="1px solid black">
		    		<colgroup>
							<col width="140" />
							<col width="600" />
							<col width="200" />
							<col width="200" />
							<col width="200" />
							<col width="200" />
						</colgroup>
		    	<tr style="background-color:#dcdcdc">
		    		<th style = "text-align:center;" scope="col">번호</th>
      			<th style = "text-align:center;" scope="col">제목</th>
      			<th style = "text-align:center;" scope="col">답변상태</th>
      			<th style = "text-align:center;" scope="col">글쓴이</th>
      			<th style = "text-align:center;" scope="col">작성일</th>
      			<th style = "text-align:center;" scope="col">조회수</th>   
		    	</tr>
		    	<% 
		    	ArrayList<SemiQnaBean> QnaList = (ArrayList<SemiQnaBean>)AppleDao.selectQna(map);
				
		    	if(QnaList!=null){
		    	for(int i = 0; i < QnaList.size(); i++){
		    		
		    		SemiQnaBean sbean= QnaList.get(i);
		    	%>
		    	<tr>
		    		<td style = "text-align:center;"><%= sbean.getQno()%></td>
		    		<td style="text-align:left">
		    		
		    			<%
								   if(!(sbean.getRef()==sbean.getQno())){
								   for(int index=0;index<sbean.getLev();index++){
								%>
								 &nbsp;&nbsp;
								<%	   
								    }//for
								   %>
								   <img src="/semicolonweb/semiupload/reply.png" width="10" height="10" />
								   <%
								   }
								%>
		    		<a href="qnaContents.jsp?no=<%=sbean.getQno() %>&page=<%=qnacurrentPage%>" style="cursor:pointer;" onmouseover="style='text-decoration:underline;'" onmouseout="style='text-decoration:none'"><%= sbean.getQtitle() %></a>
		    		</td>
			    		<td style = "text-align:center;">
			    		<% if(sbean.getRef()==sbean.getQno()){
			    		if(sbean.getQstate().equals("true")){ 
			    		%><font color="red">진행중</font><%}else{ 
			    		%><font color="blue">답변완료</font>
			    		<%
			    		} }%></td>
			    		<td style = "text-align:center;"><%= sbean.getId()%></td>
		    		<td style = "text-align:center;"><%= sbean.getQdate() %></td>
		    		<td style = "text-align:center;"><%= sbean.getQhit() %></td>
		    	</tr>
		    	<%
		    	}
		    	}
		    	%>
		    </table>
		     <!-- paging section -->
	   	<nav class="pagination" style=" display: inline-block;float: none;">
	        <ul>
	        <%if(currentBlock>1) {%>
	          <li><a href="/semicolonweb/community.jsp?type=qna&page=<%=startPage-1%>">&laquo; 이전</a></li>
	        <%}else{ %>
	          <li><a href="#">&laquo; 이전</a></li>
	        <%} %>
	        
	        <%if(qnacurrentPage>1){ %>
	          <li><a href="/semicolonweb/community.jsp?page=<%=qnacurrentPage-1%>">&laquo; Previous</a></li>
	          <%}
	          for(int i =startPage; i<=endPage;i++){
	        	  if(qnacurrentPage==i){
	          %>
	          <li><a href="#"><font color="red" size="3"><%=i %></font></a></li>
	          <%} else{ %>
	          <li><a href="/semicolonweb/community.jsp?type=qna&page=<%=i %>"><%=i %></a></li>
	          <%
	          	}
	          }
	        
						   if(qnacurrentPage<totalPage){
						%>
						<li><a href="/semicolonweb/community.jsp?type=qna&page=<%=qnacurrentPage+1%>">Next</a></li>
						<%
						   }
						   if(totalPage>endPage){  %>
	          <li><a href="/semicolonweb/community.jsp?type=qna&page=<%=endPage+1%>">다음&raquo;</a></li>
	        	<%
						   }else{
	        	%>
	          <li><a href="#">다음&raquo;</a></li>	        	
	        	<%
						   }
	        	%>
	        </ul>
      </nav>
		  </div>
		  
		  	   <%
	   		request.setCharacterEncoding("EUC-KR");
	
	 	    pageScale=10;
	 	    totalRow=0;
	 	   	totalPage=1;
	 	    
	 		totalRow=AppleDao.getNoticeTotalRow();
	 	
	 		totalPage=(totalPage=totalRow%pageScale==0?(totalRow/pageScale):(totalRow/pageScale)+1)==0?1:totalPage;
	 	   
	 	    //1page --->1  10
	 	    //2page---->11 20
	 	    /*  1BLOCK  STARTPAGE ENDPAGE [1][2]....[10]
	 		 2BLOCK  STARTPAGE ENDPAGE [11][2]....[20] */
	 	    start=1+(noticecurrentPage-1)*pageScale;
	 	    end=pageScale+(noticecurrentPage-1)*pageScale;
	 	    currentBlock=noticecurrentPage%pageScale==0?(noticecurrentPage/pageScale):(noticecurrentPage/pageScale)+1;
	 	    startPage=1+(currentBlock-1)*pageScale;
	 	    endPage=(pageScale+(currentBlock-1)*pageScale);
	 	    endPage=(endPage)>=totalPage?totalPage:endPage;
	 	    map.put("start",start);
	 	    map.put("end",end);	    		
	 	    
	   
	   %>
		  
		  <div id="tabs-2">
		  	<h2>공지사항</h2>
		  	
		    <table class="table" border="1px solid black">
		    	 	<colgroup>
							<col width="140" />
							<col width="600" />
							<col width="200" />
							<col width="200" />
							<col width="200" />
						</colgroup>
		    	<tr style="background-color:#dcdcdc">
		    		<th style = "text-align:center;" scope="col">번호</th>
      			<th style = "text-align:center;" scope="col">제목</th>
      			<th style = "text-align:center;" scope="col">글쓴이</th>
      			<th style = "text-align:center;" scope="col">작성일</th>
      			<th style = "text-align:center;" scope="col">조회수</th>   
		    	</tr>
		    	  <% 
             ArrayList<SemiNoticeBean> NoticeList = (ArrayList<SemiNoticeBean>)AppleDao.selectNotice(map);
            
		    	  if(NoticeList!=null){
             for(int i = 0; i < NoticeList.size(); i++){
                
                SemiNoticeBean nbean= NoticeList.get(i);
             %>
             <tr>
                <td style = "text-align:center;"><%= nbean.getNno() %></td>
                <td style="text-align:left"><a href="noticeContents.jsp?no=<%=nbean.getNno() %>&page=<%=noticecurrentPage %>"  style="cursor:pointer;" onmouseover="style='text-decoration:underline;'" onmouseout="style='text-decoration:none'"><%= nbean.getNtitle() %></a></td>
                <td style = "text-align:center;"><%= nbean.getId()%></td>
                <td style = "text-align:center;"><%= nbean.getNdate() %></td>
                <td style = "text-align:center;"><%= nbean.getNhit() %></td>
             </tr>
             <%
             }
		    	  }
             %>
		    </table>
		     <!-- paging section -->
	     	<nav class="pagination" style=" display: inline-block;float: none;">
	        <ul>
	        <%if(currentBlock>1) {%>
	          <li><a href="/semicolonweb/community.jsp?type=notice&page=<%=startPage-1%>">&laquo; 이전</a></li>
	        <%}else{ %>
	          <li><a href="#">&laquo; 이전</a></li>
	        <%} %>
	        
	        <%if(noticecurrentPage>1){ %>
	          <li><a href="/semicolonweb/community.jsp?page=<%=noticecurrentPage-1%>">&laquo; Previous</a></li>
	          <%}
	          for(int i =startPage; i<=endPage;i++){
	        	  if(noticecurrentPage==i){
	          %>
	          <li><a href="#"><font color="red" size="3"><%=i %></font></a></li>
	          <%} else{ %>
	          <li><a href="/semicolonweb/community.jsp?type=notice&page=<%=i %>"><%=i %></a></li>
	          <%
	          	}
	          }
	        
						   if(noticecurrentPage<totalPage){
						%>
						<li><a href="/semicolonweb/community.jsp?type=notice&page=<%=noticecurrentPage+1%>">Next</a></li>
						<%
						   }
						   if(totalPage>endPage){  %>
	          <li><a href="/semicolonweb/community.jsp?type=notice&page=<%=endPage+1%>">다음&raquo;</a></li>
	        	<%
	        	
						   }else{
	        	%>
	          <li><a href="#">다음&raquo;</a></li>	        	
	        	<%
						   }
	        	%>
	        </ul>
      </nav>
		  </div>
		  
		   <%
	   		request.setCharacterEncoding("EUC-KR");
	
	 	    pageScale=10;
	 	    totalRow=0;
	 	   	totalPage=1;
	 	    
	 		totalRow=AppleDao.getEventTotalRow();
	 	
	 		totalPage=(totalPage=totalRow%pageScale==0?(totalRow/pageScale):(totalRow/pageScale)+1)==0?1:totalPage;
	 	    try{
	 	    }catch(Exception e){
	 	    	
	 	    }
	 	    //1page --->1  10
	 	    //2page---->11 20
	 	    /*  1BLOCK  STARTPAGE ENDPAGE [1][2]....[10]
	 		 2BLOCK  STARTPAGE ENDPAGE [11][2]....[20] */
	 	    start=1+(eventcurrentPage-1)*pageScale;
	 	    end=pageScale+(eventcurrentPage-1)*pageScale;
	 	    currentBlock=eventcurrentPage%pageScale==0?(eventcurrentPage/pageScale):(eventcurrentPage/pageScale)+1;
	 	    startPage=1+(currentBlock-1)*pageScale;
	 	    endPage=(pageScale+(currentBlock-1)*pageScale);
	 	    endPage=(endPage)>=totalPage?totalPage:endPage;
	 	    map.put("start",start);
	 	    map.put("end",end);	    		
	 	    
	   
	   %>
		  <div id="tabs-3">
		  	<h2>이벤트</h2>
		    <table class="table" border="1px solid black">
			 	<colgroup>
							<col width="140" />
							<col width="600" />
							<col width="200" />
							<col width="200" />
							<col width="200" />
							<col width="200" />
						</colgroup>
		    	<tr style="background-color:#dcdcdc">
		    		<th style = "text-align:center;" scope="col">번호</th>
      			<th style = "text-align:center;" scope="col">제목</th>
      			<th style = "text-align:center;" scope="col">진행상태</th>
      			<th style = "text-align:center;" scope="col">글쓴이</th>
      			<th style = "text-align:center;" scope="col">작성일</th>
      			<th style = "text-align:center;" scope="col">조회수</th>   
		    	</tr>
<% 
             ArrayList<SemiEventBean> EventList = (ArrayList<SemiEventBean>)AppleDao.selectEvent(map);
            
if(EventList!=null){
             for(int i = 0; i < EventList.size(); i++){
                
                SemiEventBean ebean= EventList.get(i);
             %>
             <tr>
                <td style = "text-align:center;"><%=ebean.getEno()%></td>
                <td style="text-align:left"><a href="eventContents.jsp?no=<%= ebean.getEno() %>&page=<%=eventcurrentPage%>"  style="cursor:pointer;" onmouseover="style='text-decoration:underline;'" onmouseout="style='text-decoration:none'"><%= ebean.getEtitle() %></a></td>
                <td style = "text-align:center;">
			    		<% 
			    		if(ebean.getEprogress().equals("true")){ 
			    		%><font color="red">진행중</font><%}else{ 
			    		%><font color="blue">종료</font>
			    		<%
			    		} %></td>
                <td style = "text-align:center;"><%= ebean.getId()%></td>
                <td style = "text-align:center;"><%= ebean.getEdate() %></td>
                <td style = "text-align:center;"><%= ebean.getEhit() %></td>
             </tr>
             <%
             }
}
             %>	
		    </table>
		     <!-- paging section -->
	     	<nav class="pagination" style=" display: inline-block;float: none;">
	        <ul>
	        <%if(currentBlock>1) {%>
	          <li><a href="/semicolonweb/community.jsp?type=event&page=<%=startPage-1%>">&laquo; 이전</a></li>
	        <%}else{ %>
	          <li><a href="#">&laquo; 이전</a></li>
	        <%} %>
	        
	        <%if(eventcurrentPage>1){ %>
	          <li><a href="/semicolonweb/community.jsp?page=<%=eventcurrentPage-1%>">&laquo; Previous</a></li>
	          <%}
	          for(int i =startPage; i<=endPage;i++){
	        	  if(eventcurrentPage==i){
	          %>
	          <li><a href="#"><font color="red" size="3"><%=i %></font></a></li>
	          <%} else{ %>
	          <li><a href="/semicolonweb/community.jsp?type=event&page=<%=i %>"><%=i %></a></li>
	          <%
	          	}
	          }
						   if(eventcurrentPage<totalPage){
						%>
						<li><a href="/semicolonweb/community.jsp?type=event&page=<%=eventcurrentPage+1%>">Next</a></li>
						<%
						   }
						   if(totalPage>endPage){  %>
	          <li><a href="/semicolonweb/community.jsp?type=event&page=<%=endPage+1%>">다음&raquo;</a></li>
	        	<%
						   }else{
	        	%>
	          <li><a href="#">다음&raquo;</a></li>	        	
	        	<%
						   }
	        	%>
	        </ul>
      </nav>
      
		  </div>
		</div>
	   
	  
	    
     </div>

</body>
</html>
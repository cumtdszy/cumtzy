<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ page import="com.shop.entity.Tuser"%>
<%
String path = request.getContextPath();

%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>B2C水果销售网站</title>
		<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="css/theme.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

   
       </script>
       
       <script type="text/javascript">
          function loginOut(){
						window.location.href="<%=path%>/userLogout";
						
					}
		
          </script>
	
		<!----webfonts---->
		
		<!----//webfonts---->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<!--  jquery plguin -->
	<!--start slider -->
	    <link rel="stylesheet" href="css/fwslider.css" media="all">
	    <link rel="stylesheet" href="css/index.css" media="all">
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
		<script src="js/fwslider.js"></script>
	<!--end slider -->
	</head>
	<body>
		<!----start-container----->
		<div class="header-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="logo"><a href="<%=path%>/page/index.jsp"></a></div>
					</div>
					<div class="col-md-8">					
	 					<nav class="navbar navbar-default" role="navigation">
						  <div class="container-fluid">
						    <!-- Brand and toggle get grouped for better mobile display -->
						    <div class="navbar-header"><span class="text-left"><a href="#"></a></span>
						      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						        <span class="sr-only">Toggle navigation</span>
						        <span class="icon-bar"></span>
						        <span class="icon-bar"></span>
						        <span class="icon-bar"></span>
						      </button>						   
						    </div>					
						    <!-- Collect the nav links, forms, and other content for toggling -->
						    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						      <ul class="nav navbar-nav">
						      	 <li> <a href="<%=path%>/index">首页</a></li>
						        <li><a href="<%=path %>/categoryAll">产品分类</a></li>
						       
						        <c:if test="${empty  sessionScope.user}">
						           <li><a href="<%=path%>/login">登陆</a></li>
						        <li><a href="<%=path%>/register">注册</a></li>
						         </c:if>
						         
						         <c:if test="${not empty  sessionScope.user}">
						      
						          <li><a href="<%=path%>/orderAll.action">我的订单</a></li>
						            
						         </c:if>
						         
                                
                                  <li><a href="<%=path%>/toadminlogin">后台管理</a></li>
                        
						      </ul>							      					    					      
						    </div><!-- /.navbar-collapse -->
						  </div><!-- /.container-fluid -->
						</nav>
						<div class="right">
							<ul class="list-unstyled">
								<form class="navbar-form pull-right" role="search" action="<%=path%>/productAll" method="post">
			                       <div class="form-group">
			                          <input type="text" class="form-control" value="葡萄" name="productName" >
			                        </div>
			                        <input type="submit"  value="查询"></input>
			                   </form>							
							</ul>							
						</div>	
					</div>
					<!----start-images-slider---->	
				  <!-- Single button -->
      
				</div>
			</div>
        </div>	
        <div class="copyrights">Collect from </div>
        <div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
           <!----start-images-slider---->
		<div class="images-slider">
		    <div id="fwslider">
		        <div class="slider_container">
		            <div class="slide"> 
		                    <img src="<%=path%>/images/img.jpg" alt=""/>
		                <div class="slide_content">
		                    <div class="slide_content_wrap">
		                         <p class="description">欢迎您来到</p>
		                        <h4 class="title">B2C水果销售网站</h4>	
		                         <p class="description"><a href="#">welcome</a></p>	                      
		                        <div class="slide-btns description">		            	                      
		                        </div>
		                    </div>
		                </div>
		            </div>		        
		            <div class="slide">
		                <img src="<%=path%>/images/img.jpg" alt=""/>
		                <div class="slide_content">
		                     <div class="slide_content_wrap">		                   
		                         <p class="description">欢迎您来到 </p>
		                        <h4 class="title">B2C水果销售网站</h4>	 
		                         <p class="description"><a href="#">Browse collection</a></p>	 	                       		                       
		                        <div class="slide-btns description">		                      
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <!--/slide -->
		        </div>
		        <div class="timers"> </div>
		        <div class="slidePrev"><span> </span></div>
		        <div class="slideNext"><span> </span></div>
		    </div>
		    <!--/slider -->
		</div>
        </div>
    </div>
</div>

 

				
				
				
				
				

<div class="footer">
	<div class="container">
		 <div class="row">
		 	<div class="col-md-12">
		 		
		 	</div>	
		 </div>	
		 <div class="copy-right text-center">
			<p> <%
        String onLineCount = String.valueOf(application.getAttribute("counts"));
			if(onLineCount!=null&&!onLineCount.equalsIgnoreCase("")&&!onLineCount.equalsIgnoreCase("null")){
				   out.write("当前在线人数：" + onLineCount);
			   }else{
				   out.write("当前在线人数：0"); 
			   }
		        
    %>
    </p>	
		</div>
	</div>
</div>
		

</body>
</html>


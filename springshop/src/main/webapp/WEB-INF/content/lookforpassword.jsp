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
		<title>在线购物网站系统</title>
		<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="css/theme.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
             
       </script>
	  
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800,300' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		
		 <script type="text/javascript">
		  function gE(x){ return document.getElementById(x);} 
	      
		  function loginOut(){
		      window.location.href="<%=path%>/userLogout.action";
						
		  }
	  
         function check(){ 
            $.ajax({  
	        async :false,  
	        cache:true,  
	        type: 'POST',  
	        url: "<%=path%>/findpassoword?username="+gE("username").value+"&email="+gE("email").value,//请求的action路径  
	        error: function () {//请求失败处理函数  
	            alert('返回异常');  
	            //jQuery('#registeruserDiv').hideLoading();	
	        },  
	        success:function(data){ //请求成功后处理函数。    
	               //alert(data);
             
                
                   $("#password").val(data);  
                       
	            
	             //jQuery('#registeruserDiv').hideLoading();	
	        }  
	        });	
         } 
         
          </script>
		<!--  jquery plguin -->
	</head>
	<body>
		<!----start-container----->
		<div class="header-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="logo"><a href="<%=path%>/page/index.jsp"></div>
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
						        <li><a href="<%=path %>/categoryAll.action">产品分类</a></li>
						       
						        <c:if test="${empty  sessionScope.user}">
						           <li><a href="<%=path%>/login">登陆</a></li>
						        <li><a href="<%=path%>/register">注册</a></li>
						         </c:if>
						         
						         <c:if test="${not empty  sessionScope.user}">
						      
						          <li><a href="<%=path%>/orderAll.action">我的订单</a></li>
						            
						         </c:if>
						      </ul>							      					    					      
						    </div><!-- /.navbar-collapse -->
						  </div><!-- /.container-fluid -->
						</nav>
						<div class="right">
							<ul class="list-unstyled">
								
								<li><a href="<%=path%>/about">关于我们</a></li>		
								  <c:if test="${not empty  sessionScope.user}">
					               <li>
					                                  ${sessionScope.user.username}<a href="javascript:void(0)" onclick="loginOut()">[退出]</a> &nbsp;
					             </li>
					             
					              <li>
					              个人信息<a href="<%=path%>/myinfo">修改</a>
					              </li>
					           </c:if>											
							</ul>							
						</div>	
					</div>
					<!----start-images-slider---->	
				  <!-- Single button -->
      
				</div>
			</div>
        </div>	
       <div class="container">
       	   <div class="main">
       	   	 <div class="row">
	       	   	<div class="col-md-12 text-center">
			 		<h2>找回密码(必须用户名和邮箱正确，才能成功找回密码)</h2>
			 	</div>	
		 	</div>
       	       <form class="form-horizontal" role="form"  >
       	     	
       	     	 <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="username" name="username" value="" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="email" name="email" value="" >
				    </div>
				  </div>
				  
				  
				   <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="password" name="password" value="" >
				    </div>
				  </div>
				  
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn btn-default" onclick="check();">找回密码</button>
				    </div>
				  </div>
			  </form>
           </div>
       </div>
       
<div class="footer">
	<div class="container">
		 <div class="row">
		 	
		 </div>	
		 <div class="copy-right text-center">
			<p> <%
        String onLineCount = String.valueOf(application.getAttribute("counts"));
        out.write("当前在线人数：" + onLineCount);
    %></p>	
		</div>
	</div>
</div>
		
		

</body>
</html>


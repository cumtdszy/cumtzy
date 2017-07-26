<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE HTML>
<html>
	<head>
		<title>B2C水果销售网站</title>
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="${pageContext.request.contextPath}/css/theme.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
             
       </script>
	  
		<!----webfonts---->
		
		<!----//webfonts---->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		
		 <script type="text/javascript">
		  function gE(x){ return document.getElementById(x);} 
	  function loginOut(){
		 
		  window.location.href="${pageContext.request.contextPath}/userLogout";
						
					}
	  
	      function check(){
		   
	    	 var username=document.getElementById("username").value;
	    	  if(!username.match(/^[a-zA-Z]\w{5,12}$/)){
	    	         alert("用户名以字符开头，包括字符、数字和下划线，6~12位");
	    	         return false;
	    	 }
		    
		    if(gE("loginpw").value==""){
		        alert("密码不能为空");
		    	return false;
		    }
		    
		    if(gE("confirpw").value==""){
		        alert("确认密码不能为空");
		    	return false;
		    }
		    
		    if(gE("confirpw").value!=gE("loginpw").value){
		        alert("密码和确认密码不一样");
		    	return false;
		    }
		    
		    if(gE("address").value==""){
		        alert("地址不能为空");
		    	return false;
		    }
		    
		 
		    
		    var email=document.getElementById("email").value;
		    if(!email.match(/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/)){
		    	 alert("电子邮件地址不合法");	
		    	 return false;
		    }
		    
		    var phone=document.getElementById("phone").value; 
		    if(!phone.match(/^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$)/)){
		   	 alert("电话号码不合法");	
		   	 return false;
		    }
		    
		    return true;
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
						<div class="logo"><a href="${pageContext.request.contextPath}/index"></div>
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
						      	 <li> <a href="${pageContext.request.contextPath}/index">首页</a></li>
						        <li><a href="${pageContext.request.contextPath}/categoryAll">产品分类</a></li>
						      
						       <c:if test="${empty  sessionScope.user}">
						           <li><a href="${pageContext.request.contextPath}/login">登陆</a></li>
						        <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
						         </c:if>
						         
						         <c:if test="${not empty  sessionScope.user}">
						      
						          <li><a href="${pageContext.request.contextPath}/orderAll.action">我的订单</a></li>
						            
						         </c:if>
						         
						         
						      </ul>							      					    					      
						    </div><!-- /.navbar-collapse -->
						  </div><!-- /.container-fluid -->
						</nav>
						<div class="right">
							<ul class="list-unstyled">
									<li><a href="${pageContext.request.contextPath}/about">关于我们</a></li>		
								  <c:if test="${not empty  sessionScope.user}">
					               <li>
					                                  ${sessionScope.user.username}<a href="javascript:void(0)" onclick="loginOut()">[退出]</a> &nbsp;
					             </li>
					             
					              <li>
					              个人信息<a href="${pageContext.request.contextPath}/myinfo">修改</a>
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
			 		<h2>注册页面</h2>
			 	</div>	
		 	</div>
       	       <form class="form-horizontal" role="form"  action="${pageContext.request.contextPath}/userReg.action" method="post"  onsubmit="return check()">
       	     	 <div class="form-group">
				    <label for="inputmane3" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-10">
				      <input type="loginName" class="form-control" id="username" name="username" placeholder="用户名">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="loginpw" class="form-control" id="loginpw" name="loginpw" placeholder="密码">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">确认密码</label>
				    <div class="col-sm-10">
				      <input type="confirpw" class="form-control" id="confirpw" name="confirpw" placeholder="确认密码">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">地址</label>
				    <div class="col-sm-10">
				      <input type="address" class="form-control" id="address" name="address" placeholder="地址">
				    </div>
				  </div>
				  
				  
				  
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">手机</label>
				    <div class="col-sm-10">
				      <input type="phone" class="form-control" id="phone" name="phone" placeholder="电话">
				    </div>
				  </div>
				  
				  
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="email" name="email" placeholder="邮箱">
				    </div>
				  </div>
				  
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">注册</button>
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
			<p> 
				<c:if test="${empty applicationScope.counts}">
			      当前在线用户为:0
			</c:if>
			
			<c:if test="${not empty applicationScope.counts}">
			     当前在线用户为:${applicationScope.counts}
			</c:if>
			
			</p>	
		</div>
	</div>
</div>
		
		

</body>
</html>


<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ page import="com.shop.entity.Tuser"%>
<%
String path = request.getContextPath();
String goodID=request.getParameter("goodID");
String orderID=request.getParameter("orderID");
Tuser user=null;
if((Tuser)request.getSession().getAttribute("user")!=null){
	user=(Tuser)request.getSession().getAttribute("user");
}



	if(user==null){
		%>
			<script type="text/javascript">
				alert("请先登录");
			window.location.href="<%=path%>/page/login.jsp";
			</script>
   <%
		return;
	 }
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>网上预约系统</title>
		<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<link href="css/theme.css" rel='stylesheet' type='text/css' />
		
		
		<link type="text/css" rel="stylesheet" href="css/application.css">
   

		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
             
       </script>
	  
		<!----webfonts---->
		
		<!----//webfonts---->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		
	
		<script type="text/javascript" src="js/jquery.raty.min.js"></script>
		
		 <script type="text/javascript">
		  function gE(x){ return document.getElementById(x);} 
	      
	      function loginOut(){
		      window.location.href="/dingcan/user?type=userLogout";
						
		  }
	  
	      function check(){
	    	  if(gE("content").value==""){
		        alert("内容不能为空");
		    	return false;
		     }
	    	  
	    	 gE("filetype").value=gE("yuanshiname").value.substr(gE("yuanshiname").value.lastIndexOf("."))
	    	 if(gE("filetype").value==""){
	   	        alert("图片不能为空");
	   	    	return false;
	   	   }
		    
		    return true;
		 }
	      
	    $(document).ready(function(){
        $.fn.raty.defaults.path = '<%=path%>/lib/img';
        $('#function-demo').raty({
	  	number: 5,//多少个星星设置		
		targetType: 'hint',//类型选择，number是数字值，hint，是设置的数组值
        path      : '<%=path%>/img',
		hints     : ['1','2','3','4','5'],
        cancelOff : 'cancel-off-big.png',
        cancelOn  : 'cancel-on-big.png',
        size      : 24,
        starHalf  : 'star-half-big.png',
        starOff   : 'star-off-big.png',
        starOn    : 'star-on-big.png',
        target    : '#function-hint',
        cancel    : false,
        targetKeep: true,
		targetText: '请选择评分',

        click: function(score, evt) {
          
           $("#score").val(score);
        }
      });   
          }); 
          </script>
		<!--  jquery plguin -->
	</head>
	<body>
		<!----start-container----->
		<div class="header-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="logo"></div>
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
			 		<h2>评价</h2>
			 	</div>	
		 	</div>
       	       <form class="form-horizontal" role="form"  action="<%=path %>/addpingjia" enctype="multipart/form-data" method="post"  onsubmit="return check()">
       	     	     <input type="hidden" id="goodID" name="goodID" value="<%=goodID%>"/>
       	     	 	 <input type="hidden" id="orderID" name="orderID" value="<%=orderID%>"/>
       	     	      <input type="hidden" id="score" name="score" value="3"/>
       	   
       	     	 <div class="form-group">
				      <textarea  name="content"  id="content" rows="3" cols="100">Your Comment...</textarea>
				      
				  </div>
				  
				  
				 <div class="demo">
                 <div id="function-demo" class="target-demo"></div>
                                                                     分数:<div id="function-hint" class="hint"></div>
                 </div>
				  
				 <div class="form-group"> 
				   <label for="inputEmail3" class="col-sm-2 control-label">评价图片</label>
				    <div class="col-sm-10">
				      <input type="file" name="yuanshiname" id="yuanshiname" size="30" readonly="readonly"/>
					 <input type="hidden" name="filetype" id="filetype" ></input>
				    </div>		        
			    </div>	        
						        
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">提交</button>
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
			<p>版权所有</p>	
		</div>
	</div>
</div>
		
		

</body>
</html>


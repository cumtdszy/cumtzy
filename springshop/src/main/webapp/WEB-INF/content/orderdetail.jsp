<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ page import="com.shop.entity.Tuser"%>
<%@ page import="com.shop.entity.TOrderItem"%>
<%@ page import="java.util.*"%>
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
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
		<!----webfonts---->
		
		<!----//webfonts---->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<!--  jquery plguin -->
	</head>
	<body>
		<!----start-container----->
		<div class="header-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="logo"><a href="<%=path%>/page/index.jsp"><img src="<%=path%>/images/logo.png" alt=""/></a></div>
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
			 		<h2>订单明细</h2>
			 	</div>	
		 	</div>
       	    
       	 <h3>订单明细</input></h3>
				
				<a href="<%=path %>/cartClear.action">清空购物车</a>&nbsp;
			
				<a href="<%=path %>/orderAll">查看我的订单</a> &nbsp;
				<a href="<%=path %>/cart">返回购物车</a> &nbsp;
			
				
			
	
      <table width="80%" align="center" style=" color:#CC0000; font-size:12px" cellpadding="0" cellspacing="0" border="1" class="pay-table">
         <tr >
            <td  height="28"><div align="center">名称</div></td>
            <td><div align="center">价格</div></td>
            <td ><div align="center">数量</div></td>
              <td ><div align="center">状态</div></td>
               <td ><div align="center">操作</div></td>
        </tr>
       
       	<c:forEach items="${requestScope.orderItemList}" var="item">
         <tr>
         
            <td><div align="center">${item.goodName}</div></td>
            <td><div align="center">${item.goodPrice}元</div></td>
            <td><div align="center">${item.goodnum}</div></td>
             <td><div align="center">${item.itemStatus}</div></td>
             <td>      
                  <c:if test="${item.itemStatus=='已发货'}">
                 <a href="<%=path%>/topingjia?goodID=${item.goodID}&orderID=${item.orderID}">去评价</a>
               </c:if>
            
            </td>
        </tr>
       </c:forEach>

   <tr>
   </tr>
 </table>
 
           </div>
       </div>
       
<div class="footer">
	<div class="container">
		 <div class="row">
		 	
		 </div>	
		 <div class="copy-right text-center">
		<p> <%
        String onLineCount = String.valueOf(application.getAttribute("counts"));
		if(onLineCount!=null&&!onLineCount.equalsIgnoreCase("")&&!onLineCount.equalsIgnoreCase("null")){
			   out.write("当前在线人数：" + onLineCount);
		   }else{
			   out.write("当前在线人数：0"); 
		   }
	        
    %></p>	
		</div>
	</div>
</div>
		

</body>
</html>


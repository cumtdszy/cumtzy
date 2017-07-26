<%@ page language="java" pageEncoding="UTF-8"%>
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
        
        
       <script type="text/javascript">
          function loginOut(){
						window.location.href="/cd/user?type=userLogout";
						
					}
		
          </script> 
		<!----webfonts---->
		
		<!----//webfonts---->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<!--  jquery plguin -->
	</head>
	<body>
		<!----start-container----->
		<div class="header-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="logo"><a href="${pageContext.request.contextPath}/index"></a></div>
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
						        
						         <c:if test="${ empty  sessionScope.user}">
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
			 		<h2>我的购物车页面</h2>
			 	</div>	
		 	</div>
       	    
       	    <h3>我的购物车 </input></h3>
				
				<a href="${pageContext.request.contextPath}/cartClear">清空购物车</a>&nbsp;
			
				<a href="${pageContext.request.contextPath}/orderAll">查看我的订单</a> &nbsp;
				<a href="${pageContext.request.contextPath}/cart">返回购物车</a> &nbsp;
			
	
      <table width="800" align="center" style=" color:#CC0000; font-size:12px" cellpadding="0" cellspacing="0" border="1" class="pay-table">
         <tr >
         
            <td ><div align="center">商品名称</div></td>
            <td ><div align="center">商品价格</div></td>
            <td ><div align="center">数量</div></td>
       
             <td ><div align="center">操作</div></td>
        </tr>
     
 
  <c:forEach items="${sessionScope.cart}" var="item">
  <tr>
         
           
            <td><div align="center">${item.goodName}</div></td>
            <td><div align="center">${item.goodPrice}元</div></td>
            <td><div align="center">${item.goodnum}</td>
           
            <td><a href="${pageContext.request.contextPath}/cartDel?goodID=${item.goodID}">删除</a>
             
                <form action="${pageContext.request.contextPath}/tocartmod" method="post">
						    <input type="hidden" name="goodID" value="${item.goodID}"/>
						    <input type="hidden" name="goodName" value="${item.goodName}"/>
						        <input type="hidden" name="num" value="${item.goodnum}"/>
						    <input type="submit"  value="修改数量"/>
              </form>
              </td>
  </tr>
 </c:forEach>


   <tr>
   </tr>
 </table>
 
 
 
 				
		  <c:if test="${not empty  sessionScope.cart}">
		 <form  action="${pageContext.request.contextPath}/orderAdd" method="post">			
		</br>			
		 <p>
            
              请选择支付方式:<select id="paymode"  name="paymode">
              <option value="线下货到付款">线下货到付款</option>
              <option value="网银">网银</option>
              <option value="支付宝">支付宝</option>
            </select>
       
       </p>			
	
		</br>			
		 <p>
          <input type="submit" name="提交" value="提交">
       
      </p>							
	</form>			
	</c:if>		
					
					
					
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


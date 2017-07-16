<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ page import="com.shop.entity.Tuser"%>
<%@ page import="com.shop.entity.Tpingjia"%>
<%@ page import="com.shop.entity.Tproduct"%>
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
	    <script type="text/javascript" src="js/jquery.min.js"></script>
	    <!-- start details -->
<!----details-product-slider--->
				<!-- Include the Etalage files -->
					<link rel="stylesheet" href="css/etalage.css">
					<script src="js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<script>
						jQuery(document).ready(function($){
			
							$('#etalage').etalage({
								thumb_image_width: 450,
								thumb_image_height: 400,
								
							});
							// This is for the dropdown list example:
							$('.dropdownlist').change(function(){
								etalage_show( $(this).find('option:selected').attr('class') );
							});
							
							
					

					});
					
					
				   function loginOut(){
						window.location.href="<%=path%>/userLogout";
						
					}
					
				function down1(fujianPath,fujianYuashiMing) {
               
	               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
			       url=encodeURI(url); 
	               url=encodeURI(url); 
	               window.open(url,"_self");
	           
               }
               
               
           
     
				</script>
				<!----//details-product-slider--->	



	</head>
	<body>
		<!----start-container----->
		<div class="header-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="logo"><a href="index.html"><img src="<%=path%>/images/logo.png" alt=""/></a></div>
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
    
     
    <div class="single">
         <div class="container">
     	 
		<div class="cont span_2_of_3">
			 <div class="labout span_1_of_a1">
				<!-- start product_slider -->
				     <ul id="etalage">
							<li>
								<a href="#">
									<img class="etalage_thumb_image" src="<%=path %>/${requestScope.product.goodPic}" />
									<img class="etalage_source_image" src="<%=path %>/${requestScope.product.goodPic}" />
								</a>
							</li>
							
						</ul>
					
					
			<!-- end product_slider -->
			</div>
			<div class="cont1 span_2_of_a1 pull-right">
				
				
				<div class="btn_form">
					   
				</div>
			    
			   <form  action="<%=path %>/cartAdd" method="post">
    			<h3 class="m_3">详情  &nbsp;
    			          <c:if test="${not empty  sessionScope.user}">
    			<a href="<%=path%>/addFavoriate?goodID=${product.goodID}">收藏</a>
    			</c:if>
    			
    			</h3>
    			名称 :<p class="m_desc">${product.goodName} &nbsp;</p>
    			分类:<p class="m_desc">${product.catergoryName}</p>
    			简介：<p class="m_desc">${product.goodMiaoshu}</p>
    			库存：<p class="m_desc">${product.cunkun}</p>
    		         价格：<p class="m_desc">${product.price}</p>
    			   <input name="goodID" type="hidden"  value="${product.goodID}">
    		   <input type="hidden" name="goodPrice" value="${product.price}" readonly>
    		  <input type="hidden" name="goodName"  value="${product.goodName}">
                                        数量：<input name="goodnum" type="text" class="shul" value="1">
                   <c:if test="${not empty  sessionScope.user}">
                      <input type="submit" value="加入购物车" title="">     
                  </c:if>         
               </form>     
                
                <div class="social_single">	
				  	  	
			  <c:forEach items="${requestScope.pingjiaList}" var="pingjia">
			  <p>${pingjia.username}于	${pingjia.createDate}</p>
			   <p><img src="<%=path %>/${pingjia.image}" width="100px" height="100px"></p>
			  <p>打分：${pingjia.fenshu},内容：${pingjia.content}</p>
			   
			  </c:forEach>	
				  
			    </div>
			</div>
			<div class="clearfix"></div>
         </div>
     
         <div class="nbs-flexisel-container"><div class="nbs-flexisel-inner">
         <div class="nbs-flexisel-nav-left" style="top: 74px;"></div><div class="nbs-flexisel-nav-right" style="top: 74px;"></div></div></div>
	   
	<script type="text/javascript" src="<%=path%>/js/jquery.flexisel.js"></script>
	 <div class="toogle">
     	
     	
     </div>					
	 
     </div>
     <div class="clearfix"></div>
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
</div>
		

</body>
</html>


<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ page import="com.shop.entity.Tadmin"%> 
<%
String path = request.getContextPath();
Tadmin admin=null;
if((Tadmin)request.getSession().getAttribute("admin")!=null){
	admin=(Tadmin)request.getSession().getAttribute("admin");
}



	if(admin==null){
		%>
			<script type="text/javascript">
				alert("请先登录");
			window.location.href="<%=path%>/toadminlogin";
			</script>
   <%
		return;
	 }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=path%>">
    
    <title>基于java web的B2C网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  <frameset rows="15%,*">
  <frame src="<%=path%>/m1" name="f1top">
  
  <frameset cols="15%,*">
  <frame src="<%=path%>/m2" name="f1left">
<frame src="<%=path%>/m3" name="f1main">
  </frameset>
  </frameset>
  <body>
    
  </body>
</html>

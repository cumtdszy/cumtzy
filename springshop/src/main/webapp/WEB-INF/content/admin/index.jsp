<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 


			<script type="text/javascript">
			 <c:if test="${empty  sessionScope.admin}">
			alert("请先登录");
			window.parent.location.href="${pageContext.request.contextPath}/toadminlogin";
			  </c:if>
			</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${pageContext.request.contextPath}">
    
    <title>基于java web的B2C网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  <frameset rows="15%,*">
  <frame src="${pageContext.request.contextPath}/m1" name="f1top">
  
  <frameset cols="15%,*">
  <frame src="${pageContext.request.contextPath}/m2" name="f1left">
<frame src="${pageContext.request.contextPath}/m3" name="f1main">
  </frameset>
  </frameset>
  <body>
    
  </body>
</html>

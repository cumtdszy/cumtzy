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
			window.parent.location.href="<%=path%>/toadminlogin";
			</script>
   <%
		return;
	 }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=path%>">
    
    <title>My JSP 'm2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">

	function logout(){
		if(confirm('您确定要退出系统吗？')){
			window.location.href='<%=path%>/toadminlogin';
		}
	}
	
</script>
  </head>
  <style type="text/css">
a{
color:blue;
text-decoration:none;
} 
a:hover{
color:red;
text-decoration:underline;
}
</style>
  <body bgcolor="#COCOCO">
    <p>菜单<br>
  
    			
    	     &nbsp;&nbsp;<a href="<%=path%>/userMana" target="f1main"><font size="2">用户管理</font></a><br>
    		 &nbsp;&nbsp;<a href="<%=path%>/categoryMana" target="f1main"><font size="2">分类管理</font></a><br>
    		 &nbsp;&nbsp;<a href="<%=path%>/productMana" target="f1main"><font size="2">产品管理</font></a><br>
    		 &nbsp;&nbsp;<a href="<%=path%>/orderMana" target="f1main"><font size="2">订单管理</font></a><br>	
    		 &nbsp;&nbsp;<a href="<%=path%>/tofenxi" target="f1main"><font size="2">销售统计分析</font></a><br>	
  </p>
</body>
</html>

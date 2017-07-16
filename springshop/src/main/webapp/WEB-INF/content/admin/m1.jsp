<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'm1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript">

	function logout(){
		if(confirm('您确定要退出系统吗？')){
			window.parent.location.href='<%=path%>/toadminlogin';
		}
		window.location.reload();
	}
	
</script>
  </head>
  <body bgcolor="#COCOCO">
  
  <body>
    <div align="center">
    <b><u>
    <font  size="6" color="red" face="隶书">B2C网站</font>
 
 
  &nbsp;&nbsp;&nbsp; &nbsp; <a href="javascript:logout()">退出系统</a>
    
    </u></b></div>
  </body>
</html>

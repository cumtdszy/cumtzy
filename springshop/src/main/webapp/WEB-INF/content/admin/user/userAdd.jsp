<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
       <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
       <script language="javascript"  src="<%=path%>/js/jquery.showLoading.min.js"></script>
       <script type="text/javascript">
          function gE(x){ return document.getElementById(x);} 
        
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
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/userAdd" name="formAdd" method="post"  onsubmit="return check()">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>用户添加</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         账号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="username" name="username" size="40"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="loginpw" id="loginpw" size="40"/>
						    </td>
						</tr>
						
					
						
					  <tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         电话：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="phone" id="phone" size="40"/>
						    </td>
					 </tr>
					
				    
				    <tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         地址：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="address" id="address" size="40"/>
						    </td>
					 </tr>
					 
					   <tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         邮箱：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="email" id="email" size="40"/>
						    </td>
					 </tr>
						
					<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="提交"/> 
						       <input type="reset" value="返回" onclick="javascript:history.back()"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>

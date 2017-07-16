<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String goodName=request.getParameter("goodName");
String goodMiaoshu=request.getParameter("goodMiaoshu");//new String(req.getParameter("goodMiaoshu").getBytes("iso-8859-1"), "utf-8");
String goodPic=request.getParameter("goodPic");
String price=request.getParameter("price");
String cunkun=request.getParameter("cunkun");
String goodID=request.getParameter("goodID");
String categoryID=request.getParameter("categoryID");




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
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
       
        <script language="javascript" src="<%=path %>/js/jquery-1.3.2.min.js"></script>
        <script language="javascript"  src="<%=path %>/js/jquery.showLoading.min.js"></script>
        <script language="javascript">
           
		    
		  function gE(x){ return document.getElementById(x);} 
           $(document).ready(function(){
               init1();
               $("#categoryID").val('<%=categoryID%>');
           }); 
        
           function init1(){
               $.ajax({  
  	        async :false,  
  	        cache:true,  
  	        type: 'POST',  
  	        url: "<%=path%>/categoryJson",//请求的action路径  
  	        error: function () {//请求失败处理函数  
  	            alert('返回异常');  
  	            //jQuery('#registeruserDiv').hideLoading();	
  	        },  
  	        success:function(data){ //请求成功后处理函数。    
  	             var obj= eval('('+data+ ')');   
                   for (var i = 0; i<obj.length; i++){  
                  
                     $("#categoryID").append("<option value='"+obj[i].categoryID+"'>"+obj[i].categoryName+"</option>");  
                   }        
  	            
  	             //jQuery('#registeruserDiv').hideLoading();	
  	        }  
  	        });	
           } 
           
           
          
 		  function gE(x){ return document.getElementById(x);} 
 	      
 		  function loginOut(){
 		      window.location.href="<%=path%>/userLogout";
 						
 		  }
 	  

         function check(){
     	
 	    if(gE("goodName").value==""){
 	        alert("商品名称不能为空");
 	    	return false;
 	    }
 	    
 	    if(gE("goodMiaoshu").value==""){
 	        alert("商品描述不能为空");
 	    	return false;
 	    }
 	    
 	    
 	    
 	    if(gE("price").value==""){
 	        alert("价格不能为空");
 	    	return false;
 	    }
 	    
 	    if(gE("cunkun").value==""){
	        alert("库存不能为空");
	    	return false;
	    }
 	    return true;
 	   }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/productEdit" name="formAdd" enctype="multipart/form-data" method="post"  onsubmit="return check()">
			       <input type="hidden" id="goodID" name="goodID" value="<%=goodID%>"></input>
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>商品修改</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         商品名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="goodName" name="goodName" size="20" value="<%=goodName%>"/>
						    </td>
						</tr>
						
						
					   <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        商品简介：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						          <input type="text" id="goodMiaoshu" name="goodMiaoshu" size="60" value="<%=goodMiaoshu%>"/>
						    </td>
						</tr>
						
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        商品图片：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						          <img src="<%=path%>/<%=goodPic%>" width="200px" height="200px"/>
						    </td>
						</tr>
						
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="15%" bgcolor="#FFFFFF" align="center">
						       重新上传图片：
						    </td>
						    <td width="85%" bgcolor="#FFFFFF" align="left">
						        <input type="file" name="yuanshiname" id="yuanshiname" size="30" value="<%=goodPic%>" readonly="readonly"/>
						        <input type="hidden" name="filetype" id="filetype" ></input>
						    </td>
						</tr>
												
				      <tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         价格：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="price" name="price" value="<%=price%>" size="20" />
						    </td>
						</tr>
				    
				       <tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         库存：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="cunkun" name="cunkun" value="<%=cunkun%>" size="20"/>
						    </td>
						</tr>
						
						
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         类型：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select id="categoryID" name="categoryID">
						       
						       </select>
						    </td>
						</tr>
						
				       <tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         添加时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input name="createDate" type="text" id="createDate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
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

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css" />
        
        <script type="text/javascript">
		  function gE(x){ return document.getElementById(x);} 
	   
         function check(){
    	 
	    
	    if(gE("categoryName").value==""){
	        alert("分类名称不能为空");
	    	return false;
	    }
	    
	    if(gE("parentCatelogName").value==""){
	        alert("上级分类不能为空");
	    	return false;
	    }
	    return true;
         }
         
         
       function  opentree(){
    	   var openUrl = "${pageContext.request.contextPath}/totree";//弹出窗口的url
    	   var iWidth=400; //弹出窗口的宽度;
    	   var iHeight=400; //弹出窗口的高度;
    	   var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
    	   var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
    	   window.open(openUrl,"","height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft); 
       }
         </script>
	</head>

	<body leftmargin="2" topmargin="9" background='${pageContext.request.contextPath}/img/allbg.gif'>
			<form action="${pageContext.request.contextPath}/categoryAdd" name="formAdd" method="post" onsubmit="return check()">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="${pageContext.request.contextPath}/img/wbg.gif" class='title'><span>类别添加</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         类别名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="categoryName" name="categoryName" size="25"/>
						    </td>
						</tr>
						
						
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         上级名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" id="parentCatelogName" name="parentCatelogName" size="25" readonly/>
						        <input type="hidden" id="parentCategoryID" name="parentCategoryID" size="25"/>
						        <input type="button" value="选择分类"  onclick="opentree()"/>
						    </td>
						</tr>				
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         添加时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input name="createDate" type="text" id="createDate" value=""/>
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

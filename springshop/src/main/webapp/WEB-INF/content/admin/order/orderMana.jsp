<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
        <script language="javascript">
           function adminDel(userId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="${pageContext.request.contextPath}/orderDel?id="+orderID;
               }
           }
           
           function adminAdd()
           {
                 var url="${pageContext.request.contextPath}/admin/category/categoryAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='${pageContext.request.contextPath}/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="7" background="${pageContext.request.contextPath}/img/tbg.gif">&nbsp;所有订单&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>消费者</td>
					<td>订单编号</td>
					<td>订单金额</td>
				    <td >订单日期</td>
				    <td >送货地址</td>
				    <td >状态</td>
				    <td>操作</td>
		        </tr>	
				<c:forEach items="${requestScope.orderList}" var="order">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					
					<td bgcolor="#FFFFFF" align="center">
						${order.userName}
					</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
						${order.orderbianhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
							${order.ordermoney}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${order.orderDate}
					</td>
					<td bgcolor="#FFFFFF" align="center">
							${order.orderAddress}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${order.orderStatus}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						     
						 <a href="${pageContext.request.contextPath}/orderDel?id=${order.orderID}">删掉订单</a>     	     
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>

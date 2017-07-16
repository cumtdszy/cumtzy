<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link rel="stylesheet" href="css/style2.css" type="text/css">
        <script src="amcharts/amcharts.js" type="text/javascript"></script>    
        <script language="javascript" src="js/jquery-1.3.2.min.js"></script>
        <script language="javascript"  src="js/jquery.showLoading.min.js"></script>
        <script type="text/javascript">
        var obj1;
        var chart;
        var chartData =obj1;
       
        
        
        $(document).ready(function(){
            init1();
        }); 
     
        
        function init1(){
            $.ajax({  
	        async :false,  
	        cache:true,  
	        type: 'POST',  
	        url: "<%=path%>/fenxi",//请求的action路径  
	        error: function () {//请求失败处理函数  
	            alert('返回异常');  
	            //jQuery('#registeruserDiv').hideLoading();	
	        },  
	        success:function(data){ //请求成功后处理函数。    
	             
	        	var obj1= eval('('+data+ ')');   
	            var chartData =obj1;
	             chart = new AmCharts.AmSerialChart();
	             chart.pathToImages = "../amcharts/images/";
	             chart.dataProvider = chartData;
	             chart.categoryField = "goodName";
	             chart.startDuration = 1;
	             
	             // AXES
	             // category
	             var categoryAxis = chart.categoryAxis;
	             categoryAxis.gridPosition = "start";

	             // value
	             // in case you don't want to change default settings of value axis,
	             // you don't need to create it, as one value axis is created automatically.
	             
	          
	             var graph2 = new AmCharts.AmGraph();
	             graph2.type = "line";
	             graph2.title ="商品销售金额分析";
	             graph2.valueField = "price";
	             graph2.lineThickness = 2;
	             graph2.bullet = "round";
	             chart.addGraph(graph2);
	          
	             // LEGEND                
	             var legend = new AmCharts.AmLegend();
	             chart.addLegend(legend);
	             chart.write("chartdiv");
	        }  
	        });	
            
            
            
        } 
        
        AmCharts.ready(function () {
  
       });
       
       
       function gE(x){ return document.getElementById(x);} 
   </script>
    </head>

	<body leftmargin="2" topmargin="2" >
			      <input type="reset" value="返回" onclick="javascript:history.back()"/>&nbsp;
			     <div id="chartdiv" style="width: 100%; height: 500px;"></div>
			     
			
			    
			  
    </body>
</html>

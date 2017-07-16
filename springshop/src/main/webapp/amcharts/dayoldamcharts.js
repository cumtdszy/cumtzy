

var xmlHttp;//用于保存XMLHttpRequest对象的全局变量

/************************************获取一个对象*********************************************/
function gE(x){ return document.getElementById(x);} 


/**开始查询***********************************************************************/
function updatechart(){
	
	if(gE("beginDay").value==""|| gE("beginDay").value==""){
		     alert("开始日期不能为空！！");
		     return ;
	 }
	
	if(gE("endDay").value==""|| gE("endDay").value==""){
	     alert("截止日期不能为空！！");
	     return ;
    }
 
	if(gE("propertyID").value==""|| gE("propertyID").value==""){
	     alert("属性不能为空");
	     return ;
   }
	
	
	jQuery('#asynchartdiv').showLoading();
	
	$.ajax({  
	        async :false,  
	        cache:true,  
	        type: 'POST',  
	        url: "/ywChart/power.do?action=getOldDayData&beginDay="
	        	+encodeURI(encodeURI(gE("beginDay").value))
	        	+"&endDay="+encodeURI(encodeURI(gE("endDay").value))
	        	+"&ywID="+encodeURI(encodeURI(gE("ywID").value))
	        	+"&propertyID="+encodeURI(encodeURI(gE("propertyID").value)),
	        error: function () {//请求失败处理函数  
	            alert('返回异常');  
	            jQuery('#asynchartdiv').hideLoading();	
	        },  
	        success:function(data){ //请求成功后处理函数。    
	        	 if(data.length<5){
	        		 alert("对不起,没有找到相关数据");
	        		 jQuery('#asynchartdiv').hideLoading();	   
	        		 
	        	 }else{
	        		 chart.dataProvider =eval('('+data + ')');  
				     chart.validateNow();  
				     chart.validateData(); 
				     jQuery('#asynchartdiv').hideLoading();	     
	        	 }
	        }  
	    });	
}





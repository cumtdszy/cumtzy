<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>树</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ztree/css/zTreeStyle.css" type="text/css" />
		
		
		  <style>
	body {
	background-color: white;
	margin:0; padding:0;
	text-align: center;
	}
	div, p, table, th, td {
		list-style:none;
		margin:0; padding:0;
		color:#333; font-size:12px;
		font-family:dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;
	}
	#testIframe {margin-left: 10px;}
  </style>
  
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/ztree/jquery.ztree.all-3.0.min.js"></script>
		<script type="text/javascript">
       var nodeid='';
       var nodename='';
		function init1(){
              $.ajax({  
 	        async :false,  
 	        cache:true,  
 	        type: 'POST',  
 	        url: "${pageContext.request.contextPath}/categoryTree.action",//请求的action路径  
 	        error: function () {//请求失败处理函数  
 	            alert('返回异常');  
 	            //jQuery('#registeruserDiv').hideLoading();	
 	        },  
 	        success:function(data){ //请求成功后处理函数。    
 	        
 	            var obj= eval('('+data+ ')');   
 	             zNodes=obj;
 	            
 	        }  
 	        });	
          } 
		var zNodes;
		
		var zTree;
		var demoIframe;

		var setting = {
			view: {
				dblClickExpand: false,
				showLine: true,
				selectedMulti: false
			},
			data: {
				simpleData: {
					enable:true,
					idKey: "id",
					pIdKey: "pId",
					rootPId: ""
				}
			},
			callback: {
				beforeClick: function(treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("tree");
					if (treeNode.isParent) {
						zTree.expandNode(treeNode);
						nodeid=treeNode.id;
						nodename=treeNode.name;
										return false;
					} else {
						nodeid=treeNode.id;
						nodename=treeNode.name;
						return true;
					}
				}
			}
		};
		
		$(document).ready(function(){
			init1();
			
			var t = $("#tree");
		
			t = $.fn.zTree.init(t, setting, zNodes);
		});
		
		function selectree(){
			
			window.opener.parentCategoryID.value=nodeid;
			window.opener.parentCatelogName.value=nodename;
			window.close();
			
		}
		</script>
	</head>

	<body>
		<TABLE border=0 height=600px align=left>
	<TR>
		<TD width=260px align=left valign=top style="BORDER-RIGHT: #999999 1px dashed">
			<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
			
				<input type="button" value="确定" onclick="selectree()">
		</TD>
	    
	</TR>
	
	<TR>
		<TD >
		
		</TD>   
	</TR>
</TABLE>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="<%=basePath%>lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
</head>
<body>
	<label style="width: 20%">&nbsp;&nbsp;名称：</label><input id="name" type="text" style="margin-top: 10px; width: 80%"><br>
	<label style="width: 20%">&nbsp;&nbsp;单位：</label><input id="unit" type="text" style="margin-top: 5px; width: 80%"><br>
	<br>
	<button onclick="loadData()" style="float:right;margin-right: 30px;">确定</button>
	<script type="text/javascript">
	var pdialog = frameElement.dialog;
	
	function loadData(){
		var param1=$("#name").val();
		var param2=$("#unit").val();
		if(param1==null||param1==""){
			parent.$.ligerDialog.success('请输入名称!');
			return;
		}
		if(param2==null||param2==""){
			parent.$.ligerDialog.success('请输入单位!');
			return;
		}
    	$.ajax({
            url: "<%=basePath%>SaveAction",
            type: "post",
            data: { name: $("#name").val(),unit:$("#unit").val() },
            dataType: "json",
            success: function(msg) {
            	if(msg){
	            	parent.$grid.loadData();
	            	pdialog.close();
            	}else{
            		$.ligerDialog.success('添加失败,请确认是否重名!');	
            	}
            }
        });  
    }
	</script>
</body>
</html>
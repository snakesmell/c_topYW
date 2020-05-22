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
	<label style="width: 20%">&nbsp;&nbsp;名称：</label><input id="name" autocomplete="off" type="text" style="margin-top: 10px; width: 80%"><br>
	<label style="width: 20%">&nbsp;&nbsp;主机：</label><input id="fwip" autocomplete="off" type="text" style="margin-top: 10px; width: 80%"><br>
	<label style="width: 20%">&nbsp;&nbsp;服务：</label><input id="serverip" autocomplete="off" type="text" style="margin-top: 10px; width: 80%"><br>
	<label style="width: 20%">&nbsp;&nbsp;内容：</label><input id="value" autocomplete="off" type="text" style="margin-top: 5px; width: 80%"><br><br>
	<label style="width: 20%">&nbsp;&nbsp;类别：</label>
	<select style="margin-left: -4px;" id="remark" >
		<option value="Tomcat">Tomcat</option>
		<option value="Server">Server</option>
	</select>
	<br>
	<button onclick="loadData()" style="float:right;margin-right: 30px;">确定</button>
	<script type="text/javascript">
	var pdialog = frameElement.dialog;
	
	var CommonID="";
	$(document).ready(function(){
		var id=<%=request.getParameter("ID")%>;
		$.ajax({
	        url: "<%=basePath%>NumsQuery",
	        type: "post",
	        data: { ID: id },
	        dataType: "json",
	        success: function(msg) {
	        	//console.log(msg);
	        	$("#name").val(msg.NAME);
	    		$("#value").val(msg.VALUE);
	    		$("#remark").val(msg.REMARK);
	    		$("#fwip").val(msg.FWIP);
	    		$("#serverip").val(msg.SERVERIP);
	    		CommonID=msg.ID;
	        }
	    });  
	});
	
	
	function loadData(){
		var param1=$("#name").val();
		var param2=$("#value").val();
		var param3=$("#remark").val();
		var param4=$("#fwip").val();
		var param5=$("#serverip").val();
		if(param1==null||param1==""){
			parent.$.ligerDialog.success('请输入名称!');
			return;
		}
		if(param2==null||param2==""){
			parent.$.ligerDialog.success('请输入内容!');
			return;
		}
    	$.ajax({
            url: "<%=basePath%>NumsEdit",
            type: "post",
            data: { NAME: $("#name").val(),VALUE:$("#value").val(),REMARK:$("#remark").val(),ID:CommonID,FWIP:$("#fwip").val(),SERVERIP:$("#serverip").val() },
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
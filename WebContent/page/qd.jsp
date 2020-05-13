<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String flag=request.getParameter("flag");%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物资管理系统</title>
	<link href="<%=basePath%>lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

</head>
<!-- <div id="maingrid"></div>  -->
<body>
	<button style="width: 120px;height: 30px;" class="lb" onclick="materialAdd()">物资添加</button>
	<button style="width: 120px;height: 30px;" class="lb" onclick="materialRemove()">物资删除</button>
	<button style="width: 120px;height: 30px;" class="lb" onclick="save()">入库</button>
	<button style="width: 120px;height: 30px;" class="lb" onclick="out()">出库</button>
	<div id="maingrid" style="width: 90%"></div>
</body>
 <script type="text/javascript">
	 	var initF=<%=flag%>;
		if(initF==1){
			
		}else{
			window.location.href='<%=basePath%>index.jsp'
		}
        
		var $grid;
        var CommonName="";
        var CommonNums="";
        $(function (){
        	$("#layout1").ligerLayout({ leftWidth: 200});
            //v1.02以上支持直接返回grid的管理对象
           /*  $grid = $("#maingrid").ligerGrid({
                columns: [
                { display: '名称', name: 'name', width: 200 },
                { display: '数量', name: 'nums', width: 100 },
                { display: '单位', name: 'unittype', width: 100 },
                { display: '更新时间', name: 'updatetime', width: 100 },
                ], 
                width: '100%', 
                pkName: 'id', 
                rownumbers:true,
                pageSizeOptions: [5, 10, 15, 20], 
                height: '100%',
                onSelectRow: function (data, rowindex, rowobj)
                {
                	CommonName=data.name;
                	CommonNums=data.nums;
                    //console.log('1选择的是' + data.name);
                }
            }); */
            //延时加载数据
            //grid.setOptions({ data: jsonObj }); //设置数据参数
            // grid.loadData();//加载数据
            
            $grid = $("#maingrid").ligerGrid({
        		width : "100%",
        		columns : [ {
        			display : "名称",
        			name : "name",
        			width : 150,
        			type : "text",
        			align : "center"
        		}, {
        			display : "数量",
        			name : "nums",
        			width : 100,
        			type : "text",
        			align : "center"
        		}, {
        			display : "单位",
        			name : "unittype",
        			width : 100,
        			type : "text",
        			align : "center"
        		}, {
        			display : "更新时间",
        			name : "updatetime",
        			width : 160,
        			type : "text",
        			align : "center"
        		} ],
        		heightDiff : -5,
        		sortName : 'name',
        		sortOrder : 'desc',
        		dataAction : 'server',
        		showToggleColBtn : false,
        		height : '100%',
        		rowHeight : 20,
        		fixedCellHeight : true,
        		frozen : false,
        		usePager : true,
        		checkbox : false,
        		rownumbers : true,
        		url : "<%=basePath%>DbAction",
        		onSelectRow : function(data, rowindex, rowobj) {
        			CommonName=data.name;
                	CommonNums=data.nums;
        		}
        	});
            
        });
        
        
       <%--  function loadData(){
        	$.ajax({
                url: "<%=basePath%>DbAction",
                type: "post",
                data: { id: '0' },
                dataType: "json",
                success: function(msg) {
                    console.log(msg);
                    var jsonObj = {};
                    jsonObj.Rows = msg;
                    $grid.set({ data: jsonObj }); 
                    $grid.loadData();//加载数据
                }
            });  
        } --%>
        
        function getCheckedData()
        {
            var rows = $grid.getCheckedRows();
            var str = "";
            $(rows).each(function ()
            {
                str += this.name + ",";
            });
            $.ligerDialog.alert('选择的是' + str);
        }
        
        function materialAdd(){
        	$.ligerDialog.open({ title:"新增物资",height: 200,width:400 , url: '<%=basePath%>/page/materialAdd.jsp' });
        }
        
		function materialRemove(){
			if(CommonName=="")return;
			$.ligerDialog.confirm('确认删除物资：'+CommonName+'?', function (yes) {
				if(yes){
					$.ajax({
		                url: "<%=basePath%>DelAction",
		                type: "post",
		                data: { name: CommonName },
		                dataType: "json",
		                success: function(msg) {
		                	CommonName="";
		                	$grid.loadData();//加载数据	                	
		                }
		            });  
				}
			});
        }
		
		function save(){
			if(CommonName=="")return;
			$.ligerDialog.prompt('入库：'+CommonName, function (yes,value) { if(yes) {
				$.ajax({
	                url: "<%=basePath%>NumsAdd",
	                type: "post",
	                data: { name:CommonName,numsbefore:CommonNums,numsafter: value },
	                dataType: "json",
	                success: function(msg) {
	                	CommonName="";
	                	$grid.loadData();//加载数据	
	                }
	            });  
			} });
		}
		
		function out(){
			if(CommonName=="")return;
			$.ligerDialog.prompt('出库：'+CommonName, function (yes,value) { if(yes) {
				$.ajax({
	                url: "<%=basePath%>NumsDel",
	                type: "post",
	                data: { name:CommonName,numsbefore:CommonNums,numsafter: value },
	                dataType: "json",
	                success: function(msg) {
	                	CommonName="";
	                	$grid.loadData();//加载数据	
	                }
	            });  
			} });
		}
		
    </script>
</html>
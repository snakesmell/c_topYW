<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String flag=request.getParameter("flag");%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务配置</title>
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
	<button style="width: 120px;height: 30px;" class="lb" onclick="materialAdd()">新增</button>
	<button style="width: 120px;height: 30px;" class="lb" onclick="materialEdit()">修改</button>
	<button style="width: 120px;height: 30px;" class="lb" onclick="materialRemove()">删除</button>
	<!-- <button style="width: 120px;height: 30px;" class="lb" onclick="save()">入库</button>
	<button style="width: 120px;height: 30px;" class="lb" onclick="out()">出库</button> -->
	<div id="maingrid" style="width: 90%"></div>
</body>
 <script type="text/javascript">
	 	<%-- var initF=<%=flag%>;
		if(initF==1){
			
		}else{
			window.location.href='<%=basePath%>index.jsp'
		} --%>
        
		var $grid;//框架GIRD
        var CommonName="";//名称
        //var CommonNums="";//
        var CommonID="";//ID
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
        			display : "主键",
        			name : "ID",
        			width : 100,
        			type : "text",
        			align : "center"
        		}, {
        			display : "服务名称",
        			name : "NAME",
        			width : 200,
        			type : "text",
        			align : "center"
        		}, {
        			display : "运维服务",
        			name : "FWIP",
        			width : 200,
        			type : "text",
        			align : "center"
        		}, {
        			display : "服务端口",
        			name : "SERVERIP",
        			width : 200,
        			type : "text",
        			align : "center"
        		}, {
        			display : "内容",
        			name : "VALUE",
        			width : 300,
        			type : "text",
        			align : "center"
        		}, {
        			display : "类别",
        			name : "REMARK",
        			width : 100,
        			type : "text",
        			align : "center"
        		}, {
        			display : "状态",
        			name : "STATUS",
        			width : 100,
        			type : "text",
        			align : "center"
        		}  ],
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
        			CommonName=data.NAME;
                	CommonID=data.ID;
        		}
        	});
            
        });
        
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
        //新增页面
        function materialAdd(){
        	$.ligerDialog.open({ title:"新增设备",height: 250,width:400 , url: '<%=basePath%>/page/materialAdd.jsp' });
        }
        //修改页面
        function materialEdit(){
        	if(CommonID==null||CommonID==""){
        		parent.$.ligerDialog.success('请选择服务!');
        		return;
        	}
        	$.ligerDialog.open({ title:"修改设备",height: 250,width:400 , url: "<%=basePath%>/page/materialEdit.jsp?ID='"+CommonID+"'" });
        }
        
		function materialRemove(){
			if(CommonID=="")return;
			$.ligerDialog.confirm('确认删除物资：'+CommonName+'?', function (yes) {
				if(yes){
					$.ajax({
		                url: "<%=basePath%>NumsDel",
		                type: "post",
		                data: { ID: CommonID },
		                dataType: "json",
		                success: function(msg) {
		                	CommonID="";
		                	CommonName="";
		                	$grid.loadData();//加载数据	                	
		                }
		            });  
				}
			});
        }
		
    </script>
</html>
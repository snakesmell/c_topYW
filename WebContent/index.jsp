<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% request.getServletContext().setAttribute("login", false);%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物资管理系统</title>
	<style type="text/css">
	ul li {
		font-size: 30px;
		color: #00BFFF;
	}

	.tyg-div {
		z-index: -1000;
		float: left;
		position: absolute;
		left: 5%;
		top: 20%;
	}

	.tyg-p {
		font-size: 14px;
		font-family: 'microsoft yahei';
		position: absolute;
		top: 135px;
		left: 60px;
	}

	.tyg-div-denglv {
		z-index: 1000;
		float: right;
		position: absolute;
		right: 3%;
		top: 10%;
	}

	.tyg-div-form {
		background-color: #23305a;
		width: 300px;
		height: auto;
		margin: 120px auto 0 auto;
		color: #00BFFF;
	}

	.tyg-div-form form {
		padding: 10px;
	}

	.tyg-div-form form input[type="text"] {
		width: 270px;
		height: 30px;
		margin: 25px 10px 0px 0px;
	}

	.submit-btn {
		cursor: pointer;
		width: 270px;
		height: 44px;
		margin-top: 25px;
		padding: 0;
		background: #00BFFF;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		border-radius: 6px;
		border: 1px solid #00BFFF;
		-moz-box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset, 0 2px 7px
		0 rgba(0, 0, 0, .2);
		-webkit-box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset, 0 2px
		7px 0 rgba(0, 0, 0, .2);
		box-shadow: 0 15px 30px 0 rgba(255, 255, 255, .25) inset, 0 2px 7px 0
		rgba(0, 0, 0, .2);
		font-family: 'PT Sans', Helvetica, Arial, sans-serif;
		font-size: 14px;
		font-weight: 700;
		color: #fff;
		text-shadow: 0 1px 2px rgba(0, 0, 0, .1);
		-o-transition: all .2s;
		-moz-transition: all .2s;
		-webkit-transition: all .2s;
		-ms-transition: all .2s;
		align: center;
	}

	.loginbm {
		height: 50px;
		line-height: 50px;
		text-align: center;
		position: absolute;
		bottom: 0;
		width: 100%;
		color: white;
	}

	.loginbm a {
		font-weight: bold;
		color: #0b3a58;
	}

	.loginbm a:hover {
		color: #fff;
	}
	body{background: url(page/bk.jpg) } 
</style>
	<script src="<%=basePath%>lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script src="<%=basePath%>lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
</head>
<body>

<div id="contPar" class="contPar">
	<div id="page1" style="z-index:1;">
		<div style="width:100px;height:100px"></div>
		<div class="title0">
			<font
					style="font-family:华文行楷;font-size:60px;text-shadow:2px 2px white;"><b></b>
			</font>
		</div>
		<div class="title1"></div>
		<div class="imgGroug">
		</div>
	</div>
</div>
<div class="tyg-div-denglv" >
	<div class="tyg-div-form" >
		<form action="" >
			<h2>登录</h2>
			<p class="tyg-p"></p>
			<div style="margin:5px 0px;">
				<input type="text" placeholder="请输入账号..." id="loginname" />
			</div>
			<div style="margin:5px 0px;">
				<input style="width:270px;height:30px;margin: 25px 10px 0px 0px;"
					   id="loginpwd" type="password" placeholder="请输入密码..." />
			</div>
			<button type="button" onclick="login();" class="submit-btn">
				登<span style="width:20px;"></span>录
			</button>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
    var loginname="admin";
    var loginpassword="admin123";
	function login(){
		var pw=$("#loginpwd").val();
		var name=$("#loginname").val();
		if(pw==loginpassword&&name==loginname){
			window.location.href='<%=basePath%>page/qd.jsp?flag=1'
		}else{
			alert('登录失败!');	
		}
	}
</script>
</html>
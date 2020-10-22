<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>后台</title>
<!-- Custom Theme files -->
<link href="./CSS/Hstyle.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->
<link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<!--Google Fonts-->
</head>
<body>
<div class="login">
	<h2>后台管理</h2>
	<div class="login-top">
		<h1>LOGIN FORM</h1>
		<form action="Alogin.do" method="post">
			<input placeholder="Username" name="username" id="username"type="text" required="">
			<input placeholder="Password" id="password" name="password" type="password" required="">
	    <div class="forgot">
	    	<input type="submit" value="Login" >
	    </div>
	    </form>
	</div>
	<div class="login-bottom">
		<h3>New User Do Not Support Registration</h3>
	</div>
</div>	
<div class="copyright">
    <p>Copyright &copy; 2019.Mr.Liu-power All rights reserved.</p>
</div>


</body>
</html>
<script> 
//取出传回来的参数error并与yes比较
  var error ='<%=request.getParameter("error")%>';
  if(error=='yes'){
   alert("登录失败！用户名或密码错误！");
   }
</script>
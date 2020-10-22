<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>找回密码</title>
<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset=ISO-8859-1 />
	<meta name="keywords" content=""
	/>
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="./CSS/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="./CSS/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<!-- //web-fonts -->
<script type="text/javascript">

  function login(){
	
  window.open("login.jsp","_self");

  }
</script>
</head>

<body>
	<!-- bg effect -->
	<div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
	</div>
	<!-- //bg effect -->
	<!-- title -->
	<h1>找回密码</h1>
	<!-- //title -->
	<!-- content -->
	<div class="sub-main-w3">
		<form action="seekpassword.do" method="post">
			<h2>立即找回
				<i class="fas fa-level-down-alt"></i>
			</h2>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-user"></i>
					Username
				</label>
				<input placeholder="登陆用户名" name="username" id="username" type="text" required="">
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-user"></i>
					ID-Card
				</label>
				<input placeholder="身份证号码" id="idnum" name="idnum" type="text" required="">
			</div>
			
			
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					New-Password
				</label>
				<input placeholder="新密码" id="newpassword" name="newpassword" type="password" required="">
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					Confirm-Password
				</label>
				<input placeholder="确认密码" id="Confirmpassword" name="Confirmpassword" type="password" required="">
			</div>
			
			<!-- //checkbox -->
			<input type="submit" value="确定修改" id="sub">	
			<input type="button" value="返回" onclick=login() />
		</form>
	</div>
	<!-- //content -->

	<!-- copyright -->
	<div class="footer">
		<p>Copyright &copy; 2019.Mr.Liu-power All rights reserved.</p>
	</div>
	<!-- //copyright -->

	<!-- Jquery -->
	<script src="./JS/jquery-3.3.1.min.js"></script>
	<!-- //Jquery -->

	<!-- effect js -->
	<script src="./JS/canva_moving_effect.js"></script>
	<!-- //effect js -->

</body>
</html>
<script> 
$(function(){
   
    $("#sub").click(function(){
   
    var pwd = $("input[name='newpassword']").val();

    var cpwd = $("input[name='Confirmpassword']").val();
    if(pwd != cpwd){
    alert("两次密码不一致,请重新输入!");
    $("input[name='newpassword']").val("");
    $("input[name='Confirmpassword']").val("");
    return false;
    }
    });
    });
</script>

<script> 
//取出传回来的参数error并与yes比较
  var error123 ='<%=request.getParameter("error123")%>';
  if(error123=='yes'){
   alert("用户名或身份证错误-·修改失败!");
  }
</script>

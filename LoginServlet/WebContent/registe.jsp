 <%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>注册中心</title>
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

  function rollback(){
	
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
	<h1>欢迎注册</h1>
	<!-- //title -->
	<!-- content -->
	<div class="sub-main-w3">
		<form action="registe.do" method="post">
			<h2>请注册
				<i class="fas fa-level-down-alt"></i>
			</h2>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-user"></i>
					Username
				</label>
				<input placeholder="登陆用户名" name="Rusername" id="Rusername" type="text" required="">
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-user"></i>
					ID-Card
				</label>
				<input placeholder="身份证号码" id="Ridnum" name="Ridnum" type="text" required="">
			</div>		
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					Password
				</label>
				<input placeholder="密码" id="Rpassword" name="Rpassword" type="password" required="">
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					Confirm-Password
				</label>
				<input placeholder="确认密码" id="RConfirmpassword" name="RConfirmpassword" type="password" required="">
			</div>
			<!-- //checkbox -->
			<input type="submit" value="注册">	
			<input type="button" value="返回" onclick=rollback() />
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
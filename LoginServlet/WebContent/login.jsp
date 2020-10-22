<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>个人信息健康管理</title>
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

  function registe(){
	
  window.open("registe.jsp","_self");

  }
</script>
<script type="text/javascript">

  function seekpassword(){
	
  window.open("seekpassword.jsp","_self");

  }
</script>
<script type="text/javascript">

  function getDL(){
	
  window.open("doctor.jsp","_self");

  }
</script>
</head>

<body>
<%
 String username="";
 String password="";
 Cookie[] cookies=request.getCookies();
 if(cookies!=null && cookies.length>0)
 {
	 for(Cookie c : cookies){
		 if(c.getName().equalsIgnoreCase("username"))
		 {
			 username = c.getValue();
		 }
		 if(c.getName().equalsIgnoreCase("password"))
		 {
			 password = c.getValue();
		 }
	 }
 }
%>
	<!-- bg effect -->
	<div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
	</div>
	<!-- //bg effect -->
	<!-- title -->
	<h1>普通用户登录</h1>
	<!-- //title -->
	<!-- content -->
	<div class="sub-main-w3">
		<form action="login.do" method="post">
			<h2>Login Now
				<i class="fas fa-level-down-alt"></i>
			</h2>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-user"></i>
					Username
				</label>
				<input placeholder="Username" name="username" id="username"type="text" required="">
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					Password
				</label>
				<input placeholder="Password" id="password" name="password" type="password" required="">
			</div>
			<!-- checkbox -->
			<div class="wthree-text">
				<ul>
					<li>
						<label class="anim">
							<input type="checkbox" class="checkbox" required="" id="bixuan">
							<span>Stay Signed In</span>
						</label>
					</li>
					<li>
					<a href="#" onclick=getDL()>医师登录入口</a>
					</li>
					<li>
					<a href="#" onclick=seekpassword()>Forgot Password?</a>
					</li>
					
				</ul>
			</div>
			<!-- //checkbox -->
			
			<input type="submit" id="submit" value="登录">	
			<input type="button" value="注册" onclick=registe() />
			
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


<script> 
function checkClick(chk, id){
if(chk.checked==true){
document.getElementById(id).checked = false;
}
}
</script> 
</html>
<script> 
//取出传回来的参数error并与yes比较
  var error ='<%=request.getParameter("error")%>';
  if(error=='yes'){
   alert("登录失败！用户名或密码错误！");
   }
</script>

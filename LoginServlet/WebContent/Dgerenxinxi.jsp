<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>健康信息</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset=ISO-8859-1 />
	<meta name="keywords" content=""
	/>
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link href="./CSS/colors/blue.css" id="theme" rel="stylesheet">
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
	<link rel="stylesheet" href="./CSS/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="./CSS/mystyle.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="./CSS/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<!-- //web-fonts -->
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<style> 
body{ text-align:center} 
.juzhong{ margin:0 auto; width:1180px; height:1200px}  

</style> 
</head>

<body>
    <div class="juzhong">
	<div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
	</div>
	<div class="header_top">
	<div class="header_left">
	  <div class="first_top">
	    <div class="nav_li_left">
        <script>
	  	var weekDayLabels = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
		var now = new Date();
		var year=now.getFullYear();
		var month=now.getMonth()+1;
		var day=now.getDate()
		var currentime = '<span class="special">'+year+'年'+month+'月'+day+'日                '+weekDayLabels[now.getDay()]+'</span><br>'
		document.write(currentime)
       </script>
       </div>
       
	</div>
	<div class="top_top">
	 
	   <div class="logo"> 
	      <a href="index.jsp" title="欢迎访问主页页面">
		  <img src="images/logo1.png">
	      </a>
	   </div>
       <div class="right_top">
	   <iframe width="420" scrolling="yes" height="60" frameborder="1" allowtransparency="true" src="//i.tianqi.com/index.php?c=code&id=12&color=%23FFFFFF&icon=1&num=5&site=13"></iframe>
	   </div>
	</div>
	</div>
	<div class="header_right">
	<div class="right_images">
	 <div class="nav_li_right">
        <div class="top-box" style="text-align:center;">
        <!--登陆后的情况-->
        <% if(session.getAttribute("userDid")!=null){
        %>
        欢迎[<%=session.getAttribute("userDid")%>] 医生  | <a href="javascript:location.href='exitServlet'" style="color:red;" >注销</a>

        <%
        }else{
        %>
        <!--登陆后的情况end-->
        <!--未登录的情况-->
        <span class="weather-login" style="" id="unlogined">
          <a class="fas fa-user" onclick=login() style>登录</a>
          <a class="nihao" onclick=registe()> 注册</a>
        </span>
        <!--未登录的情况end-->
        <%
        }
        %>
      </div>
      </div>
	</div>
    </div>
    </div>
    
    
    <div class="main_message">
      <div class="left_button">
         <div class="nav active">
            <ul id="sidebarnav" class="in" >
             <li ><a href="index.jsp" ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>首页</a></li>

             <li class="active"><a href=<%=request.getContextPath() +"/ShowDPersonalMessage" %> class="waves-effect active"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>基本信息</a></li>

             <li><a href="DsearchBL.jsp"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>患者病历</a></li>

             <li><a href=<%=request.getContextPath() +"/ShowDPersonalJZ" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>就诊</a></li>

             <li><a href="Dtijian.jsp"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>体检系统</a></li>
          </ul>
       </div>
     </div>
     <div class="right_message">
      <form action="update_Dpersonalmessage.do" method="post">
        <span class="formbox">
        <table class="formlist" width="80%" align="center">
			<tbody>
				<tr>
					<td class="trbg1" style='width:50px;'minlength="5" maxlength="5">
						<span id="gerenxinxi-realname">姓名:
						</span>
					</td>
					<td width="50">
					<input name="RealName" type="text" id="RealName" value="<%=request.getAttribute("DDname") %>" style=" width:100px;background-color: transparent;color:white;">
					</td>
					<td class="trbg1" style='width:50px;'minlength="5" maxlength="5">
					    <span id="gerenxinxi-age">年龄：
					    </span>
					</td>
					<td width="125px">
					 <input name="userage" type="text" id="userage" value="<%=request.getAttribute("DDage") %>" style="background-color: transparent; width:80px; color:white;">
					</td>
					<td class="trbg1" style='width:90px;'minlength="5" maxlength="5">
					    <span id="gerenxinxi-tel" style='width:80px;'>手机号码：
					    </span>
					</td>
					<td width="165">
					    <input  name="usertel" type="text" id="usertel" value="<%=request.getAttribute("DDtel") %>" style="background-color: transparent; width:100px;color:white;">
					</td>
			    </tr>
			    <tr>
				<td class="trbg1">
				<span id="lbxsgrxx_xb">性别：</span>
				</td>
				<td >
				<select name="XB" id="XB" style="background-color: transparent; width:80px;color:white;">
	                     <option value="<%=request.getAttribute("DDsex")%>" class="xbweixuan" ><%=request.getAttribute("DDsex")%></option>
	                     <option value="男" class="xbnan">男</option>
	                     <option value="女" class="xbnv">女</option>
	            </select>
	            </td>
	            <td class="trbg1">
				<span id="jiatingzhuzhi">所在科号：</span>
				</td>
				<td>
				<input name="jtzhuzhi" type="text" id="jtzhuzhi" value="<%=request.getAttribute("DDeptno") %>" style="background-color: transparent; width:200px;color:white;" >
				</td>
				<td class="trbg1">
				<span id="jiatingID">身份ID：</span>
				</td>
				<td>
				<input name="jtID" type="text" id="jtID" value="<%=request.getAttribute("DDidnum") %>" style="background-color: transparent; color:white;" >
				</td>
	            </tr>
	            </tbody>
	            </table>
	            </span>
	            </form>
	           
      </div>
    </div>
	<script src="./JS/jquery-3.3.1.min.js"></script>
	<script src="./JS/canva_moving_effect.js"></script>
</body>
<script type="text/javascript">

  function registe(){
	
  window.open("Dregiste.jsp","_self");

  }
</script>
<script type="text/javascript">

  function login(){
	
  window.open("doctor.jsp","_self");

  }
</script>
</html>












  










<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
<%@page import="entity.PersonalBlDetail" %>
 <%@page import="entity.Personalbingli" %> 
 <%@page import="java.util.*" %>
 <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>体检系统</title>
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
<% ArrayList listBL =(ArrayList)request.getAttribute("listBL"); 
%>
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
             <li ><a href="index.jsp" class="waves-effect active" ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>首页</a></li>

             <li><a href=<%=request.getContextPath() +"/ShowDPersonalMessage" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>基本信息</a></li>

             <li ><a href="DsearchBL.jsp" ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>患者病历</a></li>

             <li ><a href="Djiuzhen.jsp" class="waves-effect active" ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>就诊</a></li>

             <li class="active"><a href="Dtijian.jsp" class="waves-effect active"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>体检系统</a></li>
          </ul>
       </div>
     </div>
     <div class="right_message">
     <div class="searchBL">
     <label style="color:white;">
		<i class="fas fa-user"></i>
		请输入体检用户的身份号：
		</label>
      </div>
      <div class="searchBLID">
      <form action="inputTJPID.do" method="post" id="getPID" onsubmit="javascript:return setcok(this);">
      <input placeholder="体检用户身份ID" id="TJPID" name="TJPID" type="TJPID" required="" style="background-color: transparent;float:left;color:white;">
      <input type="submit" id="submit" value="体检">	
      </form>
      </div>
       <div style="width:80%">
      <form action="InsertTJ.do" method="post">
       <table border="1" cellpadding="4" cellspacing="1"  width="100%" style="background-color: transparent;">
         <tr align="center" style="background-color: transparent;">
         <td style="color:white;">血压</td><td style="color:white;">血糖</td style="color:green;"><td style="color:white;">甘油三酯</td><td style="color:white;">总胆固醇</td>
         </tr>
         <tr>
         <td > 
         <input name="xy" id="xy" style="width:100%;background-color: transparent;border:none; color:white;">
         </td>
         <td >
         <input name="xt" id="xt" style="width:100%;background-color: transparent;border:none;color:white;" >
         </td>
         <td >
         <input name="gysz" id="gysz"  style="width:100%;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <input name="zdgc" id="zdgc" style="width:98%;background-color: transparent;border:none;color:white;" >
         </td>
         </tr>	
         <tr align="center" style="background-color: transparent;">
         <td style="color:white;">总蛋白</td><td style="color:white;">谷丙转氨酶</td><td style="color:white;">胆结石</td><td style="color:white;">血尿酸</td>
         </tr>
         <tr>
         <td > 
         <input name="zdb" id="zdb"  style="width:100% ;background-color: transparent;border:none;color:white;">
         </td>
         <td>
         <input name="gbzam" id="gbzam" style="width:100% ;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <select name="djs" id="djs" style="background-color: transparent; width:100%;color:white;border:none;">
	                     <option value="有" class="djs1" style="background-color:red">有</option>
	                     <option value="无" class="djs2" style="background-color:red">无</option>
	     </select>
         </td>
         <td >
         <input name="xns" id="xns" style="width:98% ;background-color: transparent;border:none;color:white;" >
         </td>
         </tr>	
         <tr align="center" style="background-color: transparent;">
         <td style="color:white;">血肌酐</td><td style="color:white;">尿蛋白</td><td style="color:white;">尿糖</td><td style="color:white;">幽门螺杆菌</td>
         </tr>
         <tr>
         <td > 
         <input name="xjg" id="xjg" style="width:100%;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <input name="ndb" id="ndb" style="width:100%;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <select name="nt" id="nt" style="background-color: transparent; width:100%;color:white;border:none;">
	                     <option value="阳性" class="nt1" style="background-color:red">阳性</option>
	                     <option value="阴性" class="nt2" style="background-color:red">阴性</option>
	     </select>
         </td>
         <td >
         <input name="ymlgj" id="ymlgj" style="width:98%;background-color: transparent;border:none;color:white;" >
         </td>
         </tr>	
         <tr align="center" style="background-color: transparent;">
         <td style="color:white;">红细胞</td><td style="color:white;">白细胞</td><td style="color:white;">血小板</td><td style="color:white;">血红蛋白</td>
         </tr>
         <tr>
         <td > 
         <input name="hxb" id="hxb"  style="width:100%;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <input name="bxb" id="bxb" style="width:100%;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <input name="xxb" id="xxb"  style="width:100%;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <input name="xhdb" id="xhdb"  style="width:98%;background-color: transparent;border:none;color:white;">
         </td>
         </tr>	
         <tr align="center" style="background-color: transparent;">
         <td style="color:white;">癌胚抗原</td><td style="color:white;">甲胎蛋白</td><td style="color:white;">体检用户ID</td>
         </tr>
         <tr>
         <td > 
         <input name="apky" id="apky" style="width:100%;background-color: transparent;border:none;color:white;">
         </td>
         <td >
         <input name="jtdb" id="jtdb" style="width:100%;background-color: transparent;border:none;color:white;" >
         </td>
         <td style="color:white;">
         <%=session.getAttribute("getTJPID") %>
         </td>
         <td> <input type="submit" id="submit" value="录入">	</td>
         </tr>
         </table>
         </form>
         
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

<script type="text/javascript">

  function openyourBL(bbb){
	var getDgno=document.getElementById("binglihao");
	var B=bbb;
	var PersonalDGNO=getDgno.rows[B].cells[0].innerHTML;
	window.location.href="ShowPersonalBingliDetail?PersonalDGNO="+PersonalDGNO;
}
</script>
<script> 
//取出传回来的参数error并与yes比较
  var error ='<%=request.getParameter("error")%>';
  if(error=='no'){
   alert("信息录入成功!");
   }
</script>
</html>












  










<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
 <%@page import="entity.PageZx" %>
 <%@page import="java.util.*" %>
 <%@page import="java.util.List" %>
  <%@page import="java.util.ArrayList" %>
  <%@page import="entity.MessageAll" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>健康资讯</title>
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
<% List listZX =(ArrayList)request.getAttribute("listZX"); 
%>
<% ArrayList listMessage =(ArrayList)request.getAttribute("listMessage"); 
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
		  <img src="images/logo.png">
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
        <% if(session.getAttribute("userid")!=null){
        %>
        欢迎[<%=session.getAttribute("userid")%>] 用户  | <a href="javascript:location.href='exitServlet'" style="color:red;" >注销</a>

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

   <li ><a href=<%=request.getContextPath() +"/ShowPersonalMessage" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>基本信息</a></li>

   <li ><a href=<%=request.getContextPath() +"/ShowPersonalTijian" %> ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>体检数据</a></li>

   <li ><a href=<%=request.getContextPath() +"/ShowPersonalbingli" %> ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>病历</a></li>

   <li class="active"><a href=<%=request.getContextPath() +"/ShowHealthy" %> class="waves-effect active"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>健康资讯</a></li>
 </ul>

</div>
      </div>
      <div class="right_message">
      <div class="left_acknowledge">
      <!--  
      <iframe style="width:100%" height="100%" src="https://news.sina.com.cn/"></iframe>
      -->
      <table width="100%" border="0" cellspacing="10" cellpadding="0">
      <tbody>
      <tr valign="top">
      <td class="news_list">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="box">
      <tbody>
      <tr>
      <td>
      <ul>
      <%for(int i=1;i<listZX.size();i++){
            	PageZx getZX=(PageZx) listZX.get(i);
          %>
          
      <li><label style="float:left"><%=getZX.getPagetitle()%></label><label style="float:right"><%=getZX.getPagecontent()%></label></li>
      <% } %>
      </ul>
      </td>
      </tr>
      </tbody>
      </table>
      </td>
      </tr>
      </tbody>
      </table>
      </div>
      <div  class="right_tousu">
      <h2 style="float:left">共享留言栏</h2>
      <%for(int i=0;i<listMessage.size();i++){
    	  MessageAll Message=(MessageAll) listMessage.get(i);
          %>
          <table>
          <tr><td style="color:white;">&nbsp;&nbsp;&nbsp;<%=Message.getPno()%><b style=" color:white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Message.getMessage_time()%></b>
          </td></tr>
          <tr><td style="float:left; color:white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Message.getMessage_content() %></td></tr>
          </table>
          <%} %>
          <form action="Addmoremessage.do" method="post">
          <table>
          <tr>
        
          <td><textarea name="content" style="color:white; background-color: transparent;" rows="10" cols="40"></textarea>
          </td>
          </tr>
          <tr>
          <td align="center" colspan="2"><input type="submit" style="color:white; background-color: transparent;" value="提交">
          </tr>
          </table>
          </form>
      </div>
    </div>
	<script src="./JS/jquery-3.3.1.min.js"></script>
	<script src="./JS/canva_moving_effect.js"></script>
</body>
<script type="text/javascript">

  function registe(){
	
  window.open("registe.jsp","_self");

  }
</script>
<script type="text/javascript">

  function login(){
	
  window.open("login.jsp","_self");

  }
</script>
</html>












  










<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
 <%@page import="entity.PersonalBlDetail" %>
 <%@page import="entity.Personalbingli" %> 
  <%@page import="entity.ReturnOpenMedical" %> 
 <%@page import="java.util.*" %>
 <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>个人病历</title>
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
<% ArrayList listBLD =(ArrayList)request.getAttribute("listBLD"); 
%>
<% ArrayList listM =(ArrayList)request.getAttribute("listM"); 
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

   <li ><a href=<%=request.getContextPath() +"/ShowPersonalTijian" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>体检数据</a></li>

   <li class="active"><a href=<%=request.getContextPath() +"/ShowPersonalbingli" %> class="waves-effect active"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>病历</a></li>

   <li><a href=<%=request.getContextPath() +"/ShowHealthy" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>健康资讯</a></li>
 </ul>

</div>
      </div>
      <div class="right_message">
      <div class="left_tijian">
            <div ng-if="config.titleClickHandler == undefined" class="product-nav-title ng-scope" id="nav-title" style="color:#ddfbf4;" aliyun-truncate-text="" append-to-body="true" source-text="个人病历"  text-length="20"><p style="font-size:20px;">个人病历</p></div>
            <div class="Message-center-list">
            <div class="left-list" style="color:#ddfbf4;" >病历流水号</div>
            <div class="right-list" style="color:#ddfbf4;" >时间</div>
            <table border=1px align="center" id="binglihao">
            
            <%for(int i=0;i<listBL.size();i++){
            	Personalbingli BL=(Personalbingli) listBL.get(i);
            	%>
            	<tr onclick=openyourBL(this.rowIndex)>
            	<th class="thWidthAndHeight" title="点击可查看" ><%=BL.getDgno()%></th>
            	<th class="thWidthAndHeight"><%=BL.getDgtime()%></th>
            	</tr>
            <% }%>
            </table>
            </div>
      </div>
      <div class="right_tijian">
         <table border="1" cellpadding="4" cellspacing="1"style="background-color: transparent;" width="100%" id="openMedical">
         <tr align="center" style="background-color: transparent;">
         <td style="color:green;">病因</td><td style="color:green;">诊断</td><td style="color:green;">主治医师</td><td style="color:green;">医师联系方式</td>
         </tr>
                <tr >
            	<td style="height:100px;width:220px;"><textarea  readonly="readonly"; style="text-align:center;font-size:18px; background-color: transparent; resize:none; width: 100%; height: 100%; border:none; vertical-align:top;outline:none;color:#ddfbf4;"><%=request.getAttribute("ShowSympton")%></textarea></td>
            	<td style="height:100px;width:220px;"><textarea  readonly="readonly"; style="text-align:center;font-size:18px; background-color: transparent; resize:none; width: 100%; height: 100%;   border:none; vertical-align:top;outline:none;color:#ddfbf4;"><%=request.getAttribute("ShowDiognosis")%></textarea></td>
            	<td style="height:100px;width:220px;"><textarea  readonly="readonly"; style=" text-align:center; font-size:18px; background-color: transparent; resize:none; width: 100%; height: 100%;  border:none; vertical-align:top;outline:none;color:#ddfbf4;"><%=request.getAttribute("ShowDname")%></textarea></td>
            	<td style="height:100px;width:220px;"><textarea  readonly="readonly"; style="text-align:center; font-size:18px; background-color: transparent; resize:none; width: 97%; height: 100%; border:none;  vertical-align:top;outline:none;color:#ddfbf4;"><%=request.getAttribute("ShowDiphone")%></textarea></td>
            	</tr>
             
         <tr align="center" style="background-color: transparent">
         <td></td><td style="color:green">药名</td><td style="color:green">数量</td><td></td>
         </tr>
         <%if(listM!=null)
         for(int i=0;i<listM.size();i++){
        	 ReturnOpenMedical M=(ReturnOpenMedical) listM.get(i);
            	%>
            	<tr>
            	 <td></td><td style="font-size:18px;color:#ddfbf4;"><%=M.getMname()%></td><td style="font-size:18px;color:#ddfbf4;"><%=M.getMamount()%></td><td></td>
            	</tr>
            	<%}%>
            	
            	</table>
            	<label style="font-size:17px;color:#ddfbf4;">总金额：</label><label style="font-size:15px;color:#bedefe;"><%=request.getAttribute("getprice") %>元</label>
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
<script type="text/javascript">

  function openyourBL(bbb){
	var getDgno=document.getElementById("binglihao");
	var B=bbb;
	var PersonalDGNO=getDgno.rows[B].cells[0].innerHTML;
	window.location.href="ShowPersonalBingliDetail?PersonalDGNO="+PersonalDGNO;
}
</script>

</html>












  










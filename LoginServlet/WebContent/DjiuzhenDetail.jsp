<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
 <%@page import="entity.ListAllMedical" %>
 <%@page import="java.util.*" %>
 <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>就诊</title>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="jquery-1.8.3.min.js"></script>
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
<% ArrayList listMedical =(ArrayList)request.getAttribute("listMedical"); 
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

             <li ><a href="DsearchBL.jsp" class="waves-effect active" ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>患者病历</a></li>

             <li class="active"><a href="Djiuzhen.jsp" class="waves-effect active" ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>就诊</a></li>

             <li><a href="Dtijian.jsp"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>体检系统</a></li>
          </ul>
       </div>
     </div>
     <div class="right_message">
     <div class="searchBL">
     <label style="color:white;">
		<i class="fas fa-user"></i>
		请输入就诊患者的身份号：
		</label>
      </div>
      <div class="searchBLID">
      <form action="ConfirmSessionPID.do" method="post" id="getPID" onsubmit="javascript:return setcok(this);">
      <input placeholder="就诊患者身份ID" id="JZPID" name="JZPID" type="JZPID" required="" style="background-color: transparent;float:left;color:white;">
      <input type="submit" id="submit" value="看诊">	
      </form>
      </div>
      <div style="width:80%">
      <form action="insertBL.do" method="post">
       <table border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" width="100%">
         <tr align="center" bgcolor="#FAFAF1">
         <td>病因</td><td>诊断</td><td>备注||注意事项</td><td>患者身份证ID</td>
         </tr>
         <tr>
         <td style="height:100px;width:220px;"> 
         <textarea name="BY" id="BY"  style="resize:none; width: 100%; height: 100%; vertical-align:top;outline:none;"></textarea>
         </td>
         <td style="height:50px;width:220px;">
         <textarea name="ZD" id="ZD"  style="resize:none; width: 100%;height:100%; vertical-align:top;outline:none;"></textarea>
         </td>
         <td style="height:50px;width:220px;">
         <textarea name="BZ" id="BZ"  style="resize:none; width: 100%; height: 100%; vertical-align:top;outline:none;"></textarea>
         </td>
         <td style="height:50px;width:220px;"><div style="width:100%;height:40px;"><%=session.getAttribute("getJZPID")%></div>
         <div style="width:100%;height:40px"><input type="submit" id="submit" value="确诊"></td>
         </tr>	
         </table>
         </form>
      </div>
      <div class="showBLdetail">
      </div>
      <div class="list-all-medical">
         <table id="MedicalList" border="1" cellpadding="4" cellspacing="1" style="background-color: transparent" width="100%">
         <tr align="center" style="background-color: transparent">
         <td style="color:white">药号</td><td style="color:white">药名</td><td style="color:white">数量</td><td style="color:white">操作</td>
         </tr>
          <%for(int i=0;i<listMedical.size();i++){
            	ListAllMedical Medical=(ListAllMedical) listMedical.get(i);
          %>
         <tr >
         <td style="color:white"><%=Medical.getMno()%></td>
         <td style="color:white"><%=Medical.getMname()%></td>
		 <td >
			<button type="button" class="btn btn-primary btn-sm "
			onclick="insc<%=i%>()">+</button>
			<button type="button" class="btn btn-sm"
			id=get<%=i%>>0</button>
			<button type="button" class="btn btn-primary btn-sm "
		    onclick="dec<%=i%>()">-</button>
		</td>
		<td ><input  style="margin-top:5px;text-align:center;float:left;color:green" type="button" id=Add<%=i%> value="添加">
		<input  style="margin-top:5px;text-align:center;float:right;color:red" type="button" id=Remove<%=i%> value="去除">
		</td>
		</tr>
		<% } %>
         </table>
      
      </div>
      <div class="OpenListMedical">
       <form action=" " method="post">
      <table id="PMlist" class="PMlist" border="1" cellpadding="4" cellspacing="1" style="background-color: transparent" width="100%">
         <tr align="center" style="background-color: transparent">
         <td style="color:white">药名</td><td style="color:white">数量</td>
         </tr>
         </table>
         <input style="margin-top:50px" type="submit" id="submit" onclick="submitjson()" value="确认药方">
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

<script type="text/javascript">

  function openyourBL(bbb){
	var getDgno=document.getElementById("binglihao");
	var B=bbb;
	var PersonalDGNO=getDgno.rows[B].cells[0].innerHTML;
	window.location.href="ShowPersonalBingliDetail?PersonalDGNO="+PersonalDGNO;
}
</script>
<script type="text/javascript">
<%for(int i=0;i<listMedical.size();i++){%>
function insc<%=i%>() {
var count=document.getElementById("get<%=i%>").innerHTML;
document.getElementById("get<%=i%>").innerHTML=parseInt(count)+1;
}

function dec<%=i%>() {
	var count=document.getElementById("get<%=i%>").innerHTML;
	if(parseInt(count)>0){
		document.getElementById("get<%=i%>").innerHTML=parseInt(count)-1;		
	};
	
}
 var Abtn<%=i%>=document.getElementById( "Add<%=i%>");
 Abtn<%=i%>.onclick=function(){
	var getMedical=document.getElementById("MedicalList");
	var Mname=getMedical.rows[<%=i+1%>].cells[1].innerHTML;
	var Mamount=document.getElementById("get<%=i%>").innerHTML;
	var tables = $('.PMlist');
	var addtr = $("<tr id=TR<%=i%>>"+
			"<td id=CTN<%=i%>>"+Mname+"</td>"+
			"<td id=CTM<%=i%>>"+Mamount+"</td>"+
			"</tr>"
			);
	addtr.appendTo(tables);     
}
 var Dbtn<%=i%>=document.getElementById( "Remove<%=i%>");
 Dbtn<%=i%>.onclick=function(){
	 var table = document.getElementById("PMlist");
	 var trId= document.getElementById("TR<%=i%>");
	 $(trId).remove();
}
<%}%>
</script>
<script type="text/javascript">
function submitjson(){
		var tr=$("#PMlist tr");//获取table中每一行内容
		var getData=document.getElementById("PMlist");
		var result=[]; //数组
		for(var i=1;i<tr.length;i++){
				result.push({
					"Mname": getData.rows[i].cells[0].innerHTML,
				    "Mamount":getData.rows[i].cells[1].innerHTML
				    });
		}
		var jsonData=result;
		
	$.ajax({  
		type:"post",  
	    url:"OpenMedical.do",  
	    contentType:"application/json; charset=UTF-8",  
	    data:JSON.stringify(jsonData),   //将json数据转化为字符串
	    dataType:"json",
	    success:function(data){
	    	
	    }  
	});
}
</script>
</html>












  










<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>基本信息</title>
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

   <li class="active"><a href=<%=request.getContextPath() +"/ShowPersonalMessage" %> class="waves-effect active"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>基本信息</a></li>

   <li><a  href=<%=request.getContextPath() +"/ShowPersonalTijian" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>体检数据</a></li>

   <li><a href=<%=request.getContextPath() +"/ShowPersonalbingli" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>病历</a></li>

   <li><a href=<%=request.getContextPath() +"/ShowHealthy" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>健康资讯</a></li>
 </ul>

</div>
      </div>
      <div class="right_message">
      <form action="update_personalmessage.do" method="post">
        <span class="formbox">
        <table class="formlist" width="80%" align="center">
			<tbody>
				<tr>
					<td class="trbg1" style='width:50px;'minlength="5" maxlength="5">
						<span id="gerenxinxi-realname">姓名:
						</span>
					</td>
					<td width="50">
					<input name="RealName" type="text" id="RealName" value="<%=request.getAttribute("gerenrealname") %>" style=" width:100px;background-color: transparent;color:white;">
					</td>
					<td class="trbg1" style='width:50px;'minlength="5" maxlength="5">
					    <span id="gerenxinxi-age">年龄：
					    </span>
					</td>
					<td width="125px">
					 <input name="userage" type="text" id="userage" value="<%=request.getAttribute("gerenage") %>" style="background-color: transparent; width:80px; color:white;">
					</td>
					<td class="trbg1" style='width:90px;'minlength="5" maxlength="5">
					    <span id="gerenxinxi-tel" style='width:80px;'>手机号码：
					    </span>
					</td>
					<td width="165">
					    <input  name="usertel" type="text" id="usertel" value="<%=request.getAttribute("gerentel") %>" style="background-color: transparent; width:100px;color:white;">
					</td>
			    </tr>
				<tr>
					<td class="trbg1">
					     <span id="gerenxinxi-height">身高：
					     </span>
					</td>
					<td class="gerenheight">
					<span class="combo" style="width:100px;">
						<input  class="combo combo-text" name="userheight" type="text" id="userheight" value="<%=request.getAttribute("gerenheight") %>">
						<span style="width:25px;">cm</span>
					</span>
					</td>
					<td class="trbg1"><span id="lbxsgrxx_zyfx">体重：</span></td>
					<td class="gerenheight">
					<span class="combo" style="width:100px;">
						<input  class="combo combo-text" name="userweight" type="text" id="userweight" value="<%=request.getAttribute("gerenweight") %>">
						<span style="width:25px;">kg</span>
					</span>
					</td>
				</tr>
				<tr>
				<td class="trbg1">
				<span id="lbxsgrxx_xb">性别：</span>
				</td>
				<td >
				<select name="XB" id="XB" style="background-color: transparent; width:80px;color:white;">
	                     <option value="<%=request.getAttribute("gerensex") %>" class="xbweixuan" ><%=request.getAttribute("gerensex") %></option>
	                     <option value="男" class="xbnan">男</option>
	                     <option value="女" class="xbnv">女</option>
	            </select>
	            </td>
	            <td class="trbg1">
				<span id="jiatingzhuzhi">住址：</span>
				</td>
				<td>
				<input name="jtzhuzhi" type="text" id="jtzhuzhi" value="<%=request.getAttribute("gerenaddress") %>" style="background-color: transparent; width:200px;color:white;" >
				</td>
				<td class="trbg1">
				<span id="jiatingID">身份ID：</span>
				</td>
				<td>
				<input name="jtID" type="text" id="jtID" value="<%=request.getAttribute("personalID")%>" style="background-color: transparent;color:white;" >
				</td>
	            </tr>

<td class="trbg1">
<span id="lbxsgrxx_mz" >民族：</span>
</td>

<td>
<select name="mz" id="mz" style="background-color: transparent; width:80px;color:white; ">
    <option value="<%=request.getAttribute("gerenmeizu")%>" class="mingzu"><%=request.getAttribute("gerenmeizu")%></option>
	<option value="汉族" class="mingzu">汉族</option>
	<option value="满族" class="mingzu">满族</option>
	<option value="侗族"class="mingzu">侗族</option>
	<option value="瑶族"class="mingzu">瑶族</option>
	<option value="白族"class="mingzu">白族</option>
	<option value="土家族"class="mingzu">土家族</option>
	<option value="哈尼族"class="mingzu">哈尼族</option>
	<option value="哈萨克族"class="mingzu">哈萨克族</option>
	<option value="傣族"class="mingzu">傣族</option>
	<option value="黎族"class="mingzu">黎族</option>
	<option value="傈僳族"class="mingzu">傈僳族</option>
	<option value="佤族"class="mingzu">佤族</option>
	<option value="畲族"class="mingzu">畲族</option>
	<option value="高山族"class="mingzu">高山族</option>
	<option value="拉祜族"class="mingzu">拉祜族</option>
	<option value="水族"class="mingzu">水族</option>
	<option value="东乡族"class="mingzu">东乡族</option>
	<option value="纳西族"class="mingzu">纳西族</option>
	<option value="景颇族"class="mingzu">景颇族</option>
	<option value="柯尔克孜族"class="mingzu">柯尔克孜族</option>
	<option value="土族"class="mingzu">土族</option>
	<option value="达斡尔族"class="mingzu">达斡尔族</option>
	<option value="仫佬族"class="mingzu">仫佬族</option>
	<option value="羌族"class="mingzu">羌族</option>
	<option value="布朗族"class="mingzu">布朗族</option>
	<option value="撒拉族"class="mingzu">撒拉族</option>
	<option value="毛难族"class="mingzu">毛难族</option>
	<option value="仡佬族"class="mingzu">仡佬族</option>
	<option value="锡伯族"class="mingzu">锡伯族</option>
	<option value="阿昌族"class="mingzu">阿昌族</option>
	<option value="普米族"class="mingzu">普米族</option>
	<option value="塔吉克族"class="mingzu">塔吉克族</option>
	<option value="怒族"class="mingzu">怒族</option>
	<option value="乌孜别克族"class="mingzu">乌孜别克族</option>
	<option value="俄罗斯族"class="mingzu">俄罗斯族</option>
	<option value="鄂温克族"class="mingzu">鄂温克族</option>
	<option value="崩龙族"class="mingzu">崩龙族</option>
	<option value="保安族"class="mingzu">保安族</option>
	<option value="裕固族"class="mingzu">裕固族</option>
	<option value="京族"class="mingzu">京族</option>
	<option value="塔塔尔族"class="mingzu">塔塔尔族</option>
	<option value="独龙族"class="mingzu">独龙族</option>
	<option value="鄂伦春族"class="mingzu">鄂伦春族</option>
	<option value="赫哲族"class="mingzu">赫哲族</option>
	<option value="门巴族"class="mingzu">门巴族</option>
	<option value="珞巴族"class="mingzu">珞巴族</option>
	<option value="基诺族"class="mingzu">基诺族</option>
	<option value="蒙古族"class="mingzu">蒙古族</option>
	<option value="回族"class="mingzu">回族</option>
	<option value="藏族"class="mingzu">藏族</option>
	<option value="维吾尔族"class="mingzu">维吾尔族</option>
	<option value="苗族"class="mingzu">苗族</option>
	<option value="彝族"class="mingzu">彝族</option>
	<option value="壮族"class="mingzu">壮族</option>
	<option value="布依族"class="mingzu">布依族</option>
	<option value="朝鲜族"class="mingzu">朝鲜族</option>
	<option value="外国血统"class="mingzu">外国血统</option>
	<option value="其他"class="mingzu">其他</option>
</select>
</td>
<td>
<span id="gerenxinxi-updatemessage" >更新时间:
</span>
<td >
<input name="updatemessage" type="text" id="updatemessage" readonly="true" value="<%=request.getAttribute("gerentime")%>" style="background-color: transparent; width:80px; color:white;">
</td>
</tr>

</tbody>
</table>
      </span>
      <div class="sub-main-w3">
      <input type="submit" value="确认" style="width:80px;">	
      <div>
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












  










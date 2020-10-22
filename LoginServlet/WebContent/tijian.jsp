<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
 <%@page import="entity.PersonalCheck" %>
 <%@page import="java.util.*" %>
 <%@page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
    <link href="./images/favicon.ico" type="image/x-icon" rel="shortcut icon" />
	<title>体检信息</title>
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
<% ArrayList list =(ArrayList)request.getAttribute("list"); 
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
          <a class="fas fa-user" onclick=login()>登录</a>
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

   <li class="active"><a href=<%=request.getContextPath() +"/ShowPersonalTijian" %> class="waves-effect active"><i class="fa fa-globe m-r-10" aria-hidden="true"></i>体检数据</a></li>

   <li ><a href=<%=request.getContextPath() +"/ShowPersonalbingli" %> ><i class="fa fa-globe m-r-10" aria-hidden="true"></i>病历</a></li>

   <li><a href=<%=request.getContextPath() +"/ShowHealthy" %>><i class="fa fa-globe m-r-10" aria-hidden="true"></i>健康资讯</a></li>
 </ul>

</div>
      </div>
      <div class="right_message">
         <div class="left_tijian">
            <div ng-if="config.titleClickHandler == undefined" class="product-nav-title ng-scope" id="nav-title" style="color:#ddfbf4;" aliyun-truncate-text="" append-to-body="true" source-text="个人体检历史" is-unicode-length="true" text-length="20"><p style="font-size:20px;">个人体检历史</p></div>
            <div class="Message-center-list">
            <div class="left-list" style="color:#ddfbf4;" >体检流水号</div>
            <div class="right-list" style="color:#ddfbf4;" >时间</div>
            <table border=1px align="center" id="liushuihao">
            
            <% for(int i=0;i<list.size();i++){
            	PersonalCheck TJ=(PersonalCheck) list.get(i);
            	%>
            	<tr onclick=openyourTJ(this.rowIndex) >
            	<th class="thWidthAndHeight" title="点击可查看" ><%=TJ.getTno()%></th>
            	<th class="thWidthAndHeight"><%=TJ.getTdatetime()%></th>
            	</tr>
            	<%}
            	%>
            </table>
            </div>
            <ul role="tijianshi">
            <li></li>
            </ul>
            
         </div>
         <div class="right_tijian">
         <table id="TIJIANLIST"cellpadding="4" cellspacing="1" style="background-color: transparent;border-collapse:separate; border-spacing:0px 10px; " width="100%">
         <tr align="center" style="background-color: transparent">
         <td style="color:green;">名称</td><td style="color:green;">测量指数</td><td style="color:green;">建议</td>
         </tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >血压</td>
            	<td ><%=request.getAttribute("ShowTxueya")%> mmHg</td>
            	<td ><div id="XY01"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >血糖</td>
            	<td ><%=request.getAttribute("ShowTxuetang")%> mmol/L</td>
            	<td ><div id="XY2"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td>甘油三酯</td>
            	<td ><%=request.getAttribute("ShowTganyousanzhi")%> mmol/L</td>
            	<td ><div id="XY3"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >总胆固醇</td>
            	<td ><%=request.getAttribute("ShowTzongdanguchun")%> mmol/L</td>
            	<td ><div id="XY4"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >总蛋白</td>
            	<td ><%=request.getAttribute("ShowTzongdanbai")%> g/L</td>
            	<td ><div id="XY5"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >谷丙转氨酶</td>
            	<td ><%=request.getAttribute("ShowTgubingzhuananmei")%> U/L</td>
            	<td ><div id="XY6"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >胆结石</td>
            	<td ><%=request.getAttribute("ShowTdanjieshi")%></td>
            	<td ><div id="XY7"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >血尿酸</td>
            	<td ><%=request.getAttribute("ShowTxueniaosuan")%> mmol/L</td>
            	<td ><div id="XY8"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >血肌酐</td>
            	<td ><%=request.getAttribute("ShowTxuejigan")%> μmol/L</td>
            	<td ><div id="XY9"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >尿蛋白</td>
            	<td ><%=request.getAttribute("ShowTniaodanbai")%> 克</td>
            	<td ><div id="XY10"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >尿糖</td>
            	<td ><%=request.getAttribute("ShowTniaotang")%> </td>
            	<td ><div id="XY11"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >幽门螺杆菌</td>
            	<td ><%=request.getAttribute("ShowTyoumenluoganjun")%></td>
            	<td ><div id="XY12"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >红细胞</td>
            	<td ><%=request.getAttribute("ShowThongxibao")%></td>
            	<td ><div id="XY13"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >白细胞</td>
            	<td ><%=request.getAttribute("ShowTbaixibao")%></td>
            	<td ><div id="XY14"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >血小板</td>
            	<td ><%=request.getAttribute("ShowTxuexiaoban")%></td>
            	<td ><div id="XY15"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >血红蛋白</td>
            	<td ><%=request.getAttribute("ShowTxuehongdanbai")%> g/L</td>
            	<td><div id="XY16"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >癌胚抗原</td>
            	<td ><%=request.getAttribute("ShowTaipeikangyuan")%> μg/L</td>
            	<td><div id="XY17"></div></td>
            	</tr>
            	<tr style="font-size:15px;color:#ddfbf4;">
            	<td >甲胎蛋白</td>
            	<td><%=request.getAttribute("ShowTjiataidanbai")%> μg/L</td>
            	<td ><div id="XY18"></div></td>
            	</tr>
         </table>
         </div>
      </div>
    </div>
	<script src="./JS/jquery-3.3.1.min.js"></script>
	<script src="./JS/canva_moving_effect.js"></script>
</body>
<script type="text/javascript">
window.onload=function(){
	var getTJtable=document.getElementById("TIJIANLIST");
	var wu="无";
	var yin="阴性";
	<%for(int i=1;i<19;i++){%>
	var Tjsz<%=i%>=getTJtable.rows[<%=i%>].cells[1].innerHTML;
	<%}%>
	if(parseInt(Tjsz1,10)<130&&parseInt(Tjsz1,10)>90){
			document.getElementById('XY01').innerHTML="正常";
		}
		else {
			document.getElementById('XY01').innerHTML="少吃盐，控制体重；戒烟限酒";
		}
	if(7>=parseInt(Tjsz2,10)){
		document.getElementById('XY2').innerHTML="正常";
	}
	else {
		document.getElementById('XY2').innerHTML="减少精制食物，多吃五谷杂粮";
	}
	if(1.7>=parseFloat(Tjsz3)){
		document.getElementById('XY3').innerHTML="正常";
	}
	else {
		document.getElementById('XY3').innerHTML="多吃高纤维食物，少吃高脂、高胆固醇食物";
	}
	if(parseFloat(Tjsz4)>=3.1&&parseFloat(Tjsz4)<=5.2){
		document.getElementById('XY4').innerHTML="正常";
	}
	else {
		document.getElementById('XY4').innerHTML="多吃些高纤维食物如玉米、糙米、大豆、燕麦、芹菜等";
	}
	if(parseFloat(Tjsz5)>=60 && parseFloat(Tjsz5)<=80){
		document.getElementById('XY5').innerHTML="正常";
	}
	else {
		document.getElementById('XY5').innerHTML="肝脏受损:坚持锻炼，消耗多余的脂肪和热量";
	}
	if(parseFloat(Tjsz6)<=40){
		document.getElementById('XY6').innerHTML="正常";
	}
	else {
		document.getElementById('XY6').innerHTML="多吃富含维生素B和高蛋白的食物，促进肝细胞修复再生";
	}
	if(Tjsz7==wu){
		document.getElementById('XY7').innerHTML="正常";
	}
	else {
		document.getElementById('XY7').innerHTML="少吃零食、高油高糖食品，适当多喝水";
	}
	if(parseFloat(Tjsz8)<360){
		document.getElementById('XY8').innerHTML="正常";
	}
	else {
		document.getElementById('XY8').innerHTML="少吃动物内脏、海鲜、啤酒、火锅等高嘌呤食物";
	}
	if(parseInt(Tjsz9,10)>=44&&parseInt(Tjsz9,10)<=133){
		document.getElementById('XY9').innerHTML="正常";
	}
	else {
		document.getElementById('XY9').innerHTML="练好肌肉可维持肌酐水平;多运动即可";
	}
	if(parseFloat(Tjsz10)<2){
		document.getElementById('XY10').innerHTML="正常";
	}
	else {
		document.getElementById('XY10').innerHTML="低蛋白饮食，多吃果疏，禁食辛辣刺激性食品，少盐";
	}
	if(Tjsz11==yin){
		document.getElementById('XY11').innerHTML="正常";
	}
	else {
		document.getElementById('XY11').innerHTML="减少精制食物，多吃五谷杂粮；减肥";
	}
	if(parseFloat(Tjsz12)<=50){
		document.getElementById('XY12').innerHTML="正常";
	}
	else {
		document.getElementById('XY12').innerHTML="与胃癌有关，不管有没有症状都建议就医治疗";
	}
	if(parseFloat(Tjsz13)>=3500000&&parseFloat(Tjsz13)<=5500000){
		document.getElementById('XY13').innerHTML="正常";
	}
	else {
		document.getElementById('XY13').innerHTML="补充富含蛋白质、铁、叶酸、维生素B12等食物";
	}
	if(parseFloat(Tjsz14)>=4000&&parseFloat(Tjsz14)<=10000){
		document.getElementById('XY14').innerHTML="正常";
	}
	else {
		document.getElementById('XY14').innerHTML="明确是感染导致，治疗炎症即可";
	}
	if(parseFloat(Tjsz15)>=100000&&parseFloat(Tjsz15)<=300000){
		document.getElementById('XY15').innerHTML="正常";
	}
	else {
		document.getElementById('XY15').innerHTML="<异常>，尽早去医院就诊";
	}
	if(parseFloat(Tjsz16)>=130&&parseFloat(Tjsz16)<=175){
		document.getElementById('XY16').innerHTML="正常";
	}
	else {
		document.getElementById('XY16').innerHTML="缺铁性贫血选择补铁食物：红肉、动物血、动物肝脏等";
	}
	if(parseFloat(Tjsz17)<=20){
		document.getElementById('XY17').innerHTML="正常";
	}
	else {
		document.getElementById('XY17').innerHTML="尽早戒烟；并进行相关检查";
	}
	if(parseFloat(Tjsz18)>=0&&parseFloat(Tjsz18)<=25){
		document.getElementById('XY18').innerHTML="正常";
	}
	else {
		document.getElementById('XY18').innerHTML="数据异常，建议再进行相关检查";
	}
	
	
  }
</script>
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

  function openyourTJ(aaa){ //aaa是传入点击时这个table下的某一行数据
	var getTno=document.getElementById("liushuihao");
	var A=aaa;
	var PersonalTNO=getTno.rows[A].cells[0].innerHTML;
	window.location.href="ShowPersonalTijianDetail?PersonalTNO="+PersonalTNO;//把数据传给Servlet
}
</script>
</html>












  










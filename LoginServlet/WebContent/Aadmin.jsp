<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理界面</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="./CSS/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="./CSS/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="./CSS/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="./CSS/assets/css/admin.css">
<script src="./CSS/assets/js/jquery.min.js"></script>
<script src="./CSS/assets/js/app.js"></script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->






</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="./CSS/assets/i/logo.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown>
  
</li>

 <li class="soso">
<p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
 </li>
</ul>
  </div>
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：<%=session.getAttribute("Auserid")%></div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href=<%=request.getContextPath() +"/ShowAllyonghu" %>>普通用户管理</a></h3>
      <ul>
        <li>普通用户列表</li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em> <a href=<%=request.getContextPath() +"/ShowAlldoctor" %>> 医师用户管理</a></h3>
      <ul>
        <li>医师用户列表</li>
      </ul>
      <h3 class="am-icon-users"><em></em> <a href="#">科室管理</a></h3>
      <ul>
        <li>科室列表 </li>
        <li>添加科室</li>
        <li>删除科室</li>
      </ul>
      <h3 class="am-icon-users"><em></em> <a href="#">药品管理</a></h3>
      <ul>
        <li>药品列表 </li>
        <li>添加药品</li>
        <li>删除药品</li>
      </ul>
      <h3 class="am-icon-volume-up"><em></em> <a href="#">留言栏管理</a></h3>
      <ul>
        <li>留言列表 </li>
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 

    
    
    
    
    
    
    
</div>

<div class=" admin-content">
	
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"> 首页 </li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				
			</ul>

       

	
</div>
	
	


<div class="admin">
	

	
	
   
   <div class="admin-index">
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
        <dt class="qs"><i class="am-icon-users"></i></dt>
        <dd><%=request.getAttribute("ycount") %></dd>
        <dd class="f12">普通用户数量</dd>
      </dl>
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
        <dt class="cs"><i class="am-icon-area-chart"></i></dt>
        <dd><%=request.getAttribute("dcount") %></dd>
        <dd class="f12">医师用户数量</dd>
      </dl>
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 600}">
        <dt class="hs"><i class="am-icon-shopping-cart"></i></dt>
        <dd><%=request.getAttribute("adcount") %></dd>
        <dd class="f12">管理员总数</dd>
      </dl>
    </div>
    <div class="admin-biaoge">
   
   
      </div>
      <script type="text/javascript">jQuery(".slideTxtBox").slide();</script> 
   
   
   
   
   
   
   
   
</div>

    <div class="foods">
    	<ul>版权所有@2019</ul>
    	<dl><a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a></dl>


    	
    </div>







</div>

</div>




</div>

<script src="./CSS/assets/js/amazeui.min.js"></script>
<!--<![endif]-->



</body>
</html>
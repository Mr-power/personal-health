<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>
 <%@page import="entity.ListAlldoctor" %> 
 <%@page import="java.util.*" %>
 <%@page import="java.util.ArrayList" %>
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
<% ArrayList listdoctor =(ArrayList)request.getAttribute("listdoctor"); 
%>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="./CSS/assets/i/logo.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown>
  
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
        <li>用户列表</li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em> <a href=<%=request.getContextPath() +"/ShowAlldoctor" %>> 医师用户管理</a></h3>
      <ul>
        <li>医师列表</li>
        <li>添加医师</li>
        <li>删除医师</li>
      </ul>
      <h3 class="am-icon-users"><em></em> <a href=<%=request.getContextPath() +"/ShowAlldept" %>>科室管理</a></h3>
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
      <h3 class="am-icon-volume-up"><em></em> <a href=<%=request.getContextPath() +"/ShowAllmessage" %>>留言栏管理</a></h3>
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


<div class="am-popup am-popup-inner" id="my-popup">
	
	    <div class="am-popup-hd">
      <h4 class="am-popup-title">添加商品一级分类</h4>
      <span data-am-modal-close
            class="am-close">&times;</span>
    </div>
	
	    <div class="am-popup-bd">
      

      <form class="am-form tjlanmu">


        <div class="am-form-group">
          <div class="zuo">栏目名称：</div>
          <div class="you">
            <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题">
          </div>
        </div>
        <div class="am-form-group">
          <div class="zuo">栏目关键词：</div>
          <div class="you">
            <input type="password" class="am-input-sm" id="doc-ipt-pwd-1" placeholder="请输入关键词">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">栏目描述：</div>
          <div class="you">
            <textarea class="" rows="2" id="doc-ta-1"></textarea>
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">栏目图片：</div>
          <div class="you" style="height: 45px;">
            <input type="file" id="doc-ipt-file-1">
            <p class="am-form-help">请选择要上传的文件...</p>
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">简介：</div>
          <div class="you">
            <textarea class="" rows="2" id="doc-ta-1"></textarea>
          </div>
        </div>
        <div class="am-form-group am-cf">
        <div class="zuo">状态：</div>
        <div class="you" style="margin-top: 3px;">
          <label class="am-checkbox-inline">
            <input type="checkbox" value="option1">
            显示 </label>
          <label class="am-checkbox-inline">
            <input type="checkbox" value="option2">
            隐藏 </label>

            </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="you">
            <p>
              <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
            </p>
          </div>
        </div>
      </form>
    











    </div>

	

</div>
	
	
	
	
	
	<div class="am-popup am-popup-inner" id="my-popups">
	
	    <div class="am-popup-hd">
      <h4 class="am-popup-title">修改栏目名称</h4>
      <span data-am-modal-close
            class="am-close">&times;</span>
    </div>
	
	    <div class="am-popup-bd">
      

      <form class="am-form tjlanmu">


        <div class="am-form-group">
          <div class="zuo">栏目名称：</div>
          <div class="you">
            <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题">
          </div>
        </div>
        <div class="am-form-group">
          <div class="zuo">栏目关键词：</div>
          <div class="you">
            <input type="password" class="am-input-sm" id="doc-ipt-pwd-1" placeholder="请输入关键词">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">栏目描述：</div>
          <div class="you">
            <textarea class="" rows="2" id="doc-ta-1"></textarea>
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">栏目图片：</div>
          <div class="you" style="height: 45px;">
            <input type="file" id="doc-ipt-file-1">
            <p class="am-form-help">请选择要上传的文件...</p>
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">简介：</div>
          <div class="you">
            <textarea class="" rows="2" id="doc-ta-1"></textarea>
          </div>
        </div>
        <div class="am-form-group am-cf">
        <div class="zuo">状态：</div>
        <div class="you" style="margin-top: 3px;">
          <label class="am-checkbox-inline">
            <input type="checkbox" value="option1">
            显示 </label>
          <label class="am-checkbox-inline">
            <input type="checkbox" value="option2">
            隐藏 </label>

            </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="you">
            <p>
              <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
            </p>
          </div>
        </div>
      </form>
    











    </div>

	

</div>
	
	
	
	


<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-users"> 医师管理</ul>
      
      <dl class="am-icon-home" style="float: right;">当前位置： 首页 > <a href="#">医师列表</a></dl>
      
      <dl>
        <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" onclick="opendoc();" > 手动添加医师账号</button>
      </dl>
      <!--这里打开的是新页面-->
      
      
      
      
      
      
      
      
      
      
      
      
      
    </div>
    
    
    
    
    
    
    
    
    
    
    
	
	


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead>
              <tr class="am-success">
                <th class="table-check"><input type="checkbox" /></th>

                <th class="table-id">ID</th>
                <th class="table-title">医师名称</th>
                <th class="table-type">真实姓名</th>
                <th class="table-author am-hide-sm-only">手机号</th>
                <th class="table-author am-hide-sm-only">科室</th>
                <th width="130px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
             <%for(int i=0;i<listdoctor.size();i++){
            	ListAlldoctor doctor=(ListAlldoctor) listdoctor.get(i);
            	%>
              <tr>
                <td><input type="checkbox" /></td>
                
                <td><%=doctor.getDno()%></td>
                <td><a href="#"><%=doctor.getDusername()%></a></td>
                <td><%=doctor.getDname()%></td>
                <td class="am-hide-sm-only"><%=doctor.getDiphone()%></td>
                <td class="am-hide-sm-only"><%=doctor.getDeptno()%></td>
                <td>
                	
                	
                      	
                	<div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                      <button class="am-btn am-btn-default am-btn-xs am-text-success am-round"><span class="am-icon-search" title="查看订单详情"></span> </button>
                      <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改订单"><span class="am-icon-pencil-square-o"></span></button>
                      <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除订单"><span class="am-icon-trash-o" ></span></button>
                    </div>
                  </div>
                	
                	
                	
                	
                	
                	
                </td>
              </tr>
                <% }%>
            </tbody>
          </table>
          
          
          <ul class="am-pagination am-fr">
                <li class="am-disabled"><a href="#">«</a></li>
                <li class="am-active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">»</a></li>
              </ul>
          
          
          
      
          <hr />
          <p>注：.....</p>
        </form>
  <div id="tianjiadoctor" style="display:none;width:100%;">
    <div class="fbneirong">
      <form action="Adddoctor.do" method="post">
        <div class="am-form-group am-cf">
          <div class="zuo">医师登录名：</div>
          <div class="you">
            <input name="doctorname" id="doctorname" placeholder="请输入注册用户名">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">登录密码：</div>
          <div class="you">
             <input name="doctorpwd" id="doctorpwd" placeholder="请输入密码">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">真实姓名：</div>
          <div class="you">
             <input name="doctorrname" id="doctorrname" placeholder="请输入真实姓名">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">身份证号：</div>
          <div class="you">
             <input name="doctorid" id="doctorid" placeholder="请输入身份证号">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">科室号：</div>
          <div class="you">
             <input name="doctordept" id="doctordept" placeholder="请输入科室号">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">性别：</div>
          <div class="you">
             <input name="doctorxb" id="doctorxb" placeholder="请输入性别">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">手机号：</div>
          <div class="you">
             <input name="doctortel" id="doctortel" placeholder="请输入手机号">
          </div>
        </div><div class="am-form-group am-cf">
          <div class="zuo">年龄：</div>
          <div class="you">
             <input name="doctorage" id="doctorage" placeholder="请输入年龄">
          </div>
        </div>
            
       
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius" onclick="closeW();">添加并关闭窗口</button>
          </div>
        </div>
      </form>
    </div>
  
  
  </div>
 
 
 
 <div class="foods">
  <ul>
    版权所有@2019
  </ul>
  <dl>
    <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
  </dl>
</div>




</div>

</div>




</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->



</body>
<script type="text/javascript">
function opendoc() {
	var odiv=document.getElementById("tianjiadoctor");
	odiv.style.display="block";
	
}

</script>
<script type="text/javascript">
function closedoc() {
	var odiv=document.getElementById("tianjiadoctor");
	odiv.style.display="none";
	
}

</script>
</html>
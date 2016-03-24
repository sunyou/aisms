<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%--    <%@ include file="/common/meta.jsp" %>--%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="All" name="Robots" />
<meta name="Generator" content="Notepad" />
<meta name="Copyright" content="" />
<meta name="Description" content="" />
<meta name="Keywords" content="" />
<title>阳光医药监管信息系统</title>
<script language="javascript"> 
var GLOBAL = {
    WEBROOT:"${ctx}"
};
</script>
<script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-1.11.2.js"></script>
<link href="${ctx}/sms/statics/pages/css/index/css/public.css" rel="stylesheet" type="text/css"></link>
<link href="${ctx}/sms/statics/pages/css/index/css/login.css" rel="stylesheet" type="text/css"></link>
<script src="${ctx}/sms/statics/pages/js/iepng.js" type="text/javascript"></script>
<script src="${ctx}/sms/statics/pages/js/jquery.placeholder.min.js" type="text/javascript"></script>
<script language="javascript" src="${ctx}/sms/statics/pages/login.js?_dc=${staticVersion}"></script>
  <script type="text/javascript">
     $(function () {
         // Invoke the plugin
         $('input, textarea').placeholder();
     });
 </script>
 
 <script type="text/javascript">
     EvPNG.fix('div, ul, img, li, input');
 </script>


</head>

<body>
<input type="hidden" name="errorCode" id="errorCode" value="${errorCode}"/>
<input type="hidden" name="errorMessage" id="errorMessage" value="${errorMessage}"/>
<div class="wrap topBg">
	<div class="top">
    	<div class="logo"><a href="#"><img src="${ctx}/sms/statics/pages/css/index/images/logo.png" alt="阳光医药监管信息系统"  /></a></div>
        <div class="time" id="time">今天是2015年11月3日 星期二</div>
    </div>
</div>

<div class="wrap100 loginContent">
	<div class="banner" id="banner">
    
        <a href="#" class="d1" style="background:url(${ctx}/sms/statics/pages/css/index/images/banner1.jpg) center no-repeat;"></a>
        <!--<div class="d2" id="banner_id">
            <ul>
                <li></li>
            </ul>
        </div>-->
    </div>
    <script type="text/javascript">banner()</script>
        
	<form id="loginForm" method="post" action="${ctx}/sms/index.html">
        <div class="loginInput" id="normal">
            <div class="login">
            	<h3>登录系统</h3>
                <ul>
                    <li><span>账 号</span><input placeholder=" 请输入帐号" class="Linput"  name="accountName"  id="normalRegistName"/></li>
                    <li><span>密 码</span><input type="password" placeholder=" 请输入密码" class="Linput"  name="passwd" id="normalPass"/></li>
                    <li><span>验证码</span><input placeholder=" 请输入验证码" class="Linput"  name="imageCode"/> <p><a href="#"><img id="imageCheckCode" src="${ctx}/sms/common/checkCode/code?page=login_user"/></a> </p></li>
                </ul>
                <ul class="prompt" id="alt_normal"></ul>
                <ul class="enter"><a href="javascript:void();" id="loginSubmit">立即登录</a></ul>
            </div>
            <div class="loginBg"></div>
        </div>
	</form>
        
    </div>
    
    
</div>



<!--copyright begin-->
<div class="wrap100 copyright">©2015 北京亚信融创科技有限公司. All rights reserved.</div>
<!--copyright end-->






</body>
</html>

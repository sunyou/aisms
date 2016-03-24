<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="All" name="Robots" />
<meta name="Generator" content="Notepad" />
<meta name="Copyright" content="" />
<meta name="Description" content="" />
<meta name="Keywords" content="" />
<title>阳光医药监管信息系统</title>
<link href="${ctx}/sms/statics/pages/css/index/css/public.css" rel="stylesheet" type="text/css"></link>
<link href="${ctx}/sms/statics/pages/css/index/css/icon.css" rel="stylesheet" type="text/css">
<link href="${ctx}/sms/statics/pages/css/index/css/manage.css" rel="stylesheet" type="text/css">
<link href="${ctx}/sms/statics/pages/css/index/css/content.css" rel="stylesheet" type="text/css">
<script language="javascript" src="${ctx}/sms/statics/pages/manage.js" ></script>
<script type="text/javascript" src="${ctx}/sms/statics/ace/init/jquery.js"></script> 
<script type="text/javascript" src="${ctx}/sms/statics/ace/js/bootstrap.min.js"></script>
<script language="javascript" src="${ctx}/sms/statics/pages/js/jquery.placeholder.min.js" ></script>

    
   
    <script type="text/javascript">
        $(function () {
            // Invoke the plugin
            $('input, textarea').placeholder();
        });
    </script>
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input');
    </script>
    <![endif]-->
    <script type="text/javascript">
        function displaySubMenu(li) {
            var subMenu = li.getElementsByTagName("ul")[0];
             $(subMenu).css("display","block");
        }
        function hideSubMenu(li) {
            var subMenu = li.getElementsByTagName("ul")[0];
             $(subMenu).css("display","none");
        }
    </script>
</head>

<body>
<input type="hidden" id="org" value='${ORG_ID}'>
<input type="hidden" id="menus" value='${_USER_MENU}'>
<div class="wrap100 topBg">
	<div class="top">
    	<div class="logo"><a href="#"><img src="${ctx}/sms/statics/pages/css/index/images/logo1.png" alt="阳光医药监管信息系统"  /></a></div>
        <div class="personInfo">
            <span class="fl"> 今2015年11月3日 星期二 </span><a href="#" class="h-icon1">林晨曦</a> <a href="#" class="h-icon2">修改密码</a><a href="#" class="h-icon3">退出</a>
            <div class="cl"></div>
        </div>
    </div>
</div>

<div class="wrap100 menuBg">
    <div class="menu">
		<ul id="navigation">
            
        </ul>
        
        <div class="cl"></div>

    </div>
</div>


<div class="wrap100 quickNav" id="home-icon">
    
</div>


<div class="wrap100 manage_group" id="indexInfo">
   
     

</div>
<div id="otherIndexInfo" style="display: none;">
	      <iframe width="100%" style="border:0px;width:100%;height:670px;" id="infoIframe" name="infoIframe" src="" 	frameborder="0"   scrolling="auto"></iframe>
</div>   



<!--copyright begin-->
<div class="wrap100 copyright">©2015 北京亚信融创科技有限公司. All rights reserved.</div>
<!--copyright end-->
 
</body>
</html>

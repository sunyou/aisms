<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>咸阳公交一卡通</title>
    <input type="hidden" id="org" value='${_USER_ORG_JSON}'>
    <input type="hidden" id="user" value='${_USER_INFO_MAP_}'>
    <input type="hidden" id="userStation" value='${_OPERATOR_STATION}'>
    <link href="${ctx}/sms/statics/pages/css/index/css/public.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/sms/statics/pages/css/index/css/detail.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/sms/statics/pages/index.js"></script>
    <script type="text/javascript">
        var org = eval("(" + $('#org').val() + ")");
        var user = eval("(" + $('#user').val() + ")");
        var userStation = $('#userStation').val();
        var GLOBAL = {WEBROOT: "${ctx}"};
    </script>
</head>
<body>
<!--top beign-->
<div class="header clearfix b-blue">
    <h1><a href="javascript:void(0);"> <img src="${ctx}/sms/statics/pages/css/index/images/food_logo.png"
                                            alt="一卡通管理系统"></a></h1>

    <div class="head-nav" id="menuHeader">
    </div>
    <div class="head-mem">
        <div class="navbar-header pull-right" role="navigation">
            <ul class="profile-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="user-info" id="userinfo">
                        </span>
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                使用卷
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                联系人
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${ctx}/sms/logout.html">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <%-- <a id="userinfo" href="#" class="dropdown-toggle" data-toggle="dropdown"  >
          <span class="caret"></span>
         </a>
         <ul class="dropdown-menu" >
          <li><a href="index.jsp"><i class="icon-user"></i>我的账户</a></li>
          <li><a href="#">使用卷</a></li>
          <li><a href="#">联系人</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="${ctx}/sms/logout.html">退出</a></li>--%>
        </ul>
    </div>
</div>
<!--top end-->


<!--左侧导航 start-->
<div class="wrap100 fM_content">
    <div class="fl left" id="menuTree">
    </div>
    <div class="fl l_close" id="left_scroll"><a href="javascript:void(0);"><img
            src="${ctx}/sms/statics/pages/css/index/images/fM-left.png" id="makeleft" onclick="switchBarl()"/></a>
    </div>
    <!--左侧导航 over-->
    <!--右侧内容 begin-->
    <div class="fl right" style="height: 100%;" id="left_content">
        <iframe id="content" name="view_frame" frameborder="0" height="100%" width="100%" scrolling="auto" src="javascript:false"></iframe>
    </div>
    <!--右侧内容 end-->
</div>
</body>
</html>

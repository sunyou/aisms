<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/meta.jsp" %>
 <script src="${ctx}/sms/statics/common/js/jquery-1.11.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="${ctx}/sms/statics/ace/css/bootstrap.min.css" rel="stylesheet" type="text/css">
 <link href="${ctx}/sms/statics/common/index/css/public.css" rel="stylesheet" type="text/css">
 <%--<script src="${ctx}/sms/statics/common/index/js/bootstrap.min.js"></script>--%>
    <script src="${ctx}/sms/statics/ace/js/bootstrap.min.js"></script>
    <%--<script src="${ctx}/sms/statics/ace/js/typeahead-bs2.min.js"></script>--%>

    <%--<script src="${ctx}/sms/statics/ace/js/fuelux/data/fuelux.tree-sampledata.js"></script>--%>
    <%--<script src="${ctx}/sms/statics/ace/js/fuelux/fuelux.tree.min.js"></script>--%>

    <%--<script src="${ctx}/sms/statics/ace/js/ace-elements.min.js"></script>--%>
    <%--<script src="${ctx}/sms/statics/ace/js/ace.min.js"></script>--%>

    <link href="${ctx}/sms/statics/ace/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctx}/sms/statics/ace/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${ctx}/sms/statics/ace/css/font-awesome-ie7.min.css" />
    <![endif]-->


    <%--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>--%>

    <%--<link rel="stylesheet" href="${ctx}/sms/statics/ace/css/ace.min.css"/>--%>
    <%--<link rel="stylesheet" href="${ctx}/sms/statics/ace/css/ace-rtl.min.css"/>--%>
    <%--<link rel="stylesheet" href="${ctx}/sms/statics/ace/css/ace-skins.min.css"/>--%>
    <%--<script src="${ctx}/sms/statics/ace/js/ace-extra.min.js"></script>--%>

    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/zTreeStyle/metro.css">
    <script src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.all-3.5.min.js"></script>

    <script src="${ctx}/sms/statics/pages/index2.js"></script>
    <script src="${ctx}/sms/statics/common/js/util.js"></script>

 <input type="hidden" id="menus" value='${_USER_MENU}'>
<title>咸阳公交一卡通</title>
  <script type="text/javascript">
          function showContent(content,target){
           document.getElementById(target).innerHTML=content;
          }
 </script>
</head>
<body>
<!--top beign-->
<div class="header clearfix b-blue">
 <h1><a href="#"><img src="${ctx}/sms/statics/common/index/images/food_logo.png" alt="一卡通系统"></a></h1>
 <div class="head-nav" id="menuHeader">
 </div>

 <div class="head-mem">
  <a id="userinfo" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
   miniyaya2014
   <span class="caret"></span>
  </a>
  <ul class="dropdown-menu">
   <li><a href="index.html">我的账户</a></li>
   <li><a href="#">使用卷</a></li>
   <li><a href="#">联系人</a></li>
   <li role="separator" class="divider"></li>
   <li><a href="#">退出</a></li>
  </ul>
 </div>
</div>
<!--top end-->



<!--主体 begin-->
<div class="wrap100 fM_content">
 <!--主体右侧内容 begin-->
 <div class="fl right">
       第一个选择：<input  type="text" id="treeselect1" style="width: 300px;">
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       <br/>
       第二个选择：<input  type="text" id="treeselect2" style="width: 300px;">
 </div>
 <!--主体右侧内容 begin-->
</div>


</body>
</html>

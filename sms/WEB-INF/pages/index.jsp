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
<link href="${ctx}/sms/statics/common/css/public.css" rel="stylesheet" type="text/css"></link>
<link href="${ctx}/sms/statics/common/css/icon.css" rel="stylesheet" type="text/css">
<link href="${ctx}/sms/statics/common/css/index.css" rel="stylesheet" type="text/css">
<script src="${ctx}/sms/statics/common/js/jquery-1.11.2.js"></script>
<%--<script src="${ctx}/sms/statics/common/js/banner.js"></script>--%>
<script src="${ctx}/sms/statics/common/js/bootstrap.min.js"></script>
<script src="${ctx}/sms/statics/common/js/jquery.placeholder.min.js" type="text/javascript"></script>
    
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
</head>

<body>
<div class="wrap topBg">
	<div class="top">
    	<div class="logo"><img src="${ctx}/sms/statics/common/images/logo.png" alt="阳光医药监管信息系统"  /></div>
        <div class="personInfo">
            <span class="fl"> 今2015年11月3日 星期二 </span><a href="#" class="h-icon1">林晨曦</a> <a href="#" class="h-icon2">修改密码</a><a href="#" class="h-icon3">退出</a>
            <div class="cl"></div>
        </div>
    </div>
</div>

<div class="wrap i-content">
    <div class="timeAndEnter">
        <div class="fl StatisticalTime"><i class="time-icon"></i> 统计时间：2015年11月2日</div>
        <div class="fr enterSystem"><a href="bigScreen/index.html" class="arrow1">大屏展示</a> </div>
        <div class="fr enterSystem"><a href="manage.html" class="arrow1">进入系统</a> </div>
        <div class="cl"></div>
    </div>
    <div class="statistical">
        <dl class="fl w-b-50 m-r-20">
            <dt class="b-c-green"><i class="t_icon1"></i>合理用药监管统计 </dt>
            <dd class="b-c-lightGreen">
                <ul>
                    <li><label>超量用药：</label>涉及医院<strong>17</strong>家，医生<strong>276</strong>人，患者<strong>3756</strong>人次</li>
                    <li><label>重复用药：</label>涉及医院<strong>21</strong>家，医生<strong>345</strong>人，患者<strong>4022</strong>人次</li>
                    <li><label>适应性不当用药：</label>涉及医院<strong>10</strong>家，医生<strong>195</strong>人，患者<strong>2076</strong>人次</li>
                    <li><label>目录外用药：</label>涉及医院<strong>9</strong>家，医生<strong>87</strong>人，患者<strong>1985</strong>人次</li>
                    <li><label>滥用抗菌药物：</label>涉及医院<strong>13</strong>家，医生<strong>164</strong>人，患者<strong>3021</strong>人次</li>
                    <li><label>合计：</label>涉及医院<strong>28</strong>家，医生<strong>505</strong>人，患者<strong>7893</strong>人次</li>
                </ul>
            </dd>
        </dl>
        <dl class="fl w-b-23 m-r-20">
            <dt class="b-c-orage"><i class="t_icon2"></i>大处方筛查统计 </dt>
            <dd class="b-c-lightOrage">
                <ul>
                    <li>涉及医院<strong>34</strong>家</li>
                    <li>涉及医生<strong>3124</strong>人</li>
                    <li>涉及患者<strong>31234</strong>人次</li>
                    <li>涉及处方<strong>31314</strong>张</li>
                    <li>涉及病种<strong>3124</strong>种</li>
                </ul>
            </dd>
        </dl>
        <dl class="fr w-b-23">
            <dt class="b-c-blue"><i class="t_icon3"></i>医保稽查统计 </dt>
            <dd class="b-c-lightBlue">
                <ul>
                    <li>人工派单<strong>15</strong>件</li>
                    <li>自动派单<strong>11</strong>件</li>
                    <li>执行<strong>12</strong>件</li>
                    <li>完结<strong>34</strong>件</li>
                    <li>撤销<strong>12</strong>件</li>
                </ul>
            </dd>
        </dl>
        <div class="cl"></div>

    </div>

</div>



<!--copyright begin-->
<div class="wrap100 copyright">©2015 北京亚信融创科技有限公司. All rights reserved.</div>
<!--copyright end-->






</body>
</html>

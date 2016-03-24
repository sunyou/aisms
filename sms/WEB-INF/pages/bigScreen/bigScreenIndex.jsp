<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp" %>
<html class="no-js"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${ctx}/sms/statics/pages/css/bigscreen/bootstrap.css">
    <link href="${ctx}/sms/statics/pages/css/bigscreen/bigscreen.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
    <!--
    <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
    -->
    <!--[endif]---->
    <script src="${ctx}/sms/statics/common/js/jquery-1.11.2.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/sms/statics/pages/css/bigscreen/anonymous.css">


    <title>大屏</title>
</head>

<body>

<!--top begin--->
<div class="wrap100 bigscreen">
    <div class="title">
        <h1>基于GIS的阳光医药监管信息平台<span >当前时间：<span id="time"></span></span></h1>
    </div>
    <div class="listTable">


    </div>
</div>
<!--top end--->

<div class="wrap100 content">
    <div class="fl menu">
        <ul>
            <li><a href="${ctx}/bigScreen/index.html" class="current">合理用药监管统计</a> </li>
            <li><a href="${ctx}/bigScreen/index2.html">大处方筛查统计</a> </li>
            <li><a href="#">医保稽查统计</a> </li>
        </ul>
    </div>
    <div class="fl left">
        <div class="map">
            <div class="mapPhoto">
                <div class="photo"><embed src="${ctx}/sms/statics/pages/images/bigscreen/map.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="590" height="593" wmode="transparent"></embed>
                </div>
            </div>
        </div>
    </div>
    <div class="fr right">
        <div class="fl rightBorder">
            <dl>
                <dt>违规事件机构级别统计</dt>
                <dd> <table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <div id="chart1"  style="height: 100%;width: 100%"></div>
                        </td>
                    </tr> </table>
                </dd>
            </dl>
            <dl>
                <dt>违规事件类别统计</dt>
                <dd><table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <div  id="chart2" style="height: 100%;width: 100%"></div>
                        </td>
                    </tr> </table></dd>
            </dl><div class="clear"></div><!--换行作用-->
            <dl>
                <dt>违规事件数量趋势变化</dt>
                <dd><table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <div  id="chart3"style="height: 100%;width: 100%"></div>
                        </td>
                    </tr> </table> </dd>
            </dl>
            <dl>
                <dt>涉及医生职称占比</dt>
                <dd><table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <div  id="chart4"style="height: 100%;width: 100%"></div>
                        </td>
                    </tr> </table></dd>
            </dl><div class="clear"></div><!--换行作用-->
            <dl>
                <dt>违规事件涉案金额趋势</dt>
                <dd><table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <div  id="chart5"style="height: 100%;width: 100%"></div>
                        </td>
                    </tr> </table> </dd>
            </dl>
            <dl>
                <dt>涉及参保人员年龄段</dt>
                <dd><table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <div  id="chart6"style="height: 100%;width: 100%"></div>
                        </td>
                    </tr> </table></dd>
            </dl>


        </div>
    </div>
    <div class="clear"></div>
</div>

<div id="particles-js">
    <canvas class="particles-js-canvas-el" style="width: 100%; height: 100%;" width="1424" height="763"></canvas>
</div>

<script type="text/javascript" src="${ctx}/sms/statics/common/Highcharts-4.2.1/js/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/sms/statics/common/Highcharts-4.2.1/js/highcharts-3d.js"></script>
<script type="text/javascript" src="${ctx}/sms/statics/common/Highcharts-4.2.1/js/highcharts-more.js"></script>
<script src="${ctx}/sms/statics/pages/js/bigscreen/particles.min.js"></script>
<script src="${ctx}/sms/statics/pages/js/bigscreen/anonymous.js"></script>
<script src="${ctx}/sms/statics/pages/js/bigscreen/bigScreenIndex.js"></script>


</body>
</html>

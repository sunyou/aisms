<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<script language="javascript"> 
var GLOBAL = {
    WEBROOT:"${ctx}"
};
</script>
<script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-1.11.2.js"></script>
<meta charset="utf-8">
<script language="javascript" src="${ctx}/sms/statics/pages/js/sign/phone.js"></script>
<script language="javascript" src="${ctx}/sms/statics/pages/js/sign/SignRecord.js"></script>
<script type="text/javascript" src="${ctx}/sms/statics/common/js/date/skin/phoneDate/date.js"></script> 
<script type="text/javascript" src="${ctx}/sms/statics/common/js/date/skin/phoneDate/iscroll.js"></script> 
<title>签到记录</title>
<link href="${ctx}/sms/statics/pages/css/sign/table.css" rel="stylesheet" type="text/css">
<link href="${ctx}/sms/statics/common/js/date/skin/phoneDate/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--手机 begin-->
<div class="wrap90">   
    <!--头部 begin-->
    <div class="wrap100 fl cw_top">
        <input class="cw_input01 fl"  id="signDate"  name="" type="text" placeholder="签到日期">
        <div id="datePlugin"></div>
        <select  id="workContent" name="workContent" class="cw_select fr">
            <option value="-1">所有工作</option>
        </select>
        <a href="javascript:query();" class="cw_buttonBack">查询</a>
    </div>
    <!--头部 over-->
    
    <!--表格 begin-->   
    <div id="divList">
    </table>
    </div>
    <!--表格 over-->
    
    <div class="clear"></div>
    <!--加载中 begin-->
<%--    <div class="cw_jiazai">--%>
<%--    	<img src="images/loading.png">--%>
<%--        <span>正在加载中，请稍等</span>--%>
<%--    </div>--%>
    <!--加载中 over-->
</div>
<!--手机 over-->





<script>
	adaptUILayout.adapt(480); //适配当前页面
</script>
</body>
</html>
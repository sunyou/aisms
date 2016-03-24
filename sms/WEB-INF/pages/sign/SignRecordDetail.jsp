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
<title>签到记录</title>
<link href="${ctx}/sms/statics/pages/css/sign/table.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--手机 begin-->
<div class="wrap100 fl mat20">
	<div class="wrap90">
    	<table class="reu_table" cellspacing="0" cellpadding="0">
          <tr class="reu_grayBG">
            <td colspan="2">
            	<img class="reu_icon01" src="${ctx}/sms/statics/pages/images/sign/qur_icon02.png">
                <span class="qur_span01">详细信息</span>
            </td>
          </tr>
          <tr>
            <td class="reu_dsBG">姓名</td>
            <td>${recordBean.userName}</td>
          </tr>
          <tr>
            <td class="reu_dsBG">性别</td>
            <td>${recordBean.sex}</td>
          </tr>
          <tr>
            <td class="reu_dsBG">单位</td>
            <td>${recordBean.unitName}</td>
          </tr>
          <tr>
            <td class="reu_dsBG">身份证号码</td>
            <td>${recordBean.cardNumber}</td>
          </tr>
          <tr>
            <td class="reu_dsBG">手机号码</td>
            <td>${recordBean.phone}</td>
          </tr>
          <tr>
            <td class="reu_dsBG">签到日期</td>
            <td>${recordBean.signDate}</td>
          </tr>
          <tr>
            <td class="reu_dsBG">签到状态</td>
            <td>${recordBean.signStatusStr}</td>
          </tr>
        </table>
        
        <a href="javascript:history.go(-1);" class="cw_buttonBack">返回</a>
    </div>
</div>
<!--手机 over-->






<script>
	adaptUILayout.adapt(480); //适配当前页面
</script>
</body>
</html>
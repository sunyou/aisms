<meta charset="utf-8" >
<base href="${ctx}/"/>
<!--css-->

<%
 request.setAttribute("jkxw_jsversion" ,"1");
 %>
<link rel="stylesheet" href="${ctx}/querycardstatus/style/healthHut.css?v=${jkxw_jsversion}" type="text/css">
<link rel="stylesheet" href="${ctx}/querycardstatus/style/css3icon/css/font-awesome.min.css?v=${jkxw_jsversion}" type="text/css">
<!--js-->
<script language="javascript" src="${ctx}/sms/statics/ace/plugins/easyui/jquery.min.js"></script>
<script language="javascript" src="${ctx}/querycardstatus/js/phone.js" ></script>
<script language="javascript"> 

var GLOBAL = {
    WEBROOT:"${ctx}"
};


adaptUILayout.adapt(480); //适配当前页面
</script>


	
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title></title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link href="${ctx}/sms/statics/pages/css/configManage/default.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/configManage/dynamicModule.js"></script>
    <style>
    	.title{
    	        background: #F1F9F7;font-size: 13px;
    	}
    	.lineborder{
    		border: 1px solid #e1e1e1;margin-top: 0px;width:730px;height: 32px;line-height:32px;
    	}
    </style>
</head>
<body>
<input type="hidden" id="moduleId" value="${bean.moduleId }" />
<input type="hidden" id="ruleId" value="${ruleId }" />
<input type="hidden" id="isFix" value="${bean.isFix }" />
<input type="hidden" id="tabName" value="${bean.businessTableName }" />
<div class="wrap100 quickrecharge">
	<div class="q_r_list">
		<div>
			<table style="width: 730px">
				<div class="title lineborder">${bean.moduleName}信息</div>
				<div class="lineborder">
					<tr>
						<td>1111</td>
					</tr>
					<tr>
						<td>222</td>
					</tr>
				</div>
			</table>
			<table style="width: 730px">
				<div class="title lineborder">${bean.moduleName}信息</div>
				<div id="divStatic">
					<div class="lineborder">
						字段名：<select name="selStaicCol" style="height:28px;"></select>
						<button onclick="addRow($(this).parent())">+</button>
						<button onclick="delRow($(this).parent())">-</button>
					</div>
				</div>
			</table>
		</div>
		
		
		<div style="text-align: center;margin-top: 10px;">
			<a id="btnStaticConfig" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary" >
            	保存
			</a>
			<a id="btnClose" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary">
            	关闭
			</a>
		</div>
	</div>	
</div>
</body>
</html>
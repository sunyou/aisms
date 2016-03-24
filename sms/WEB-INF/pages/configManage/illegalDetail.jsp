<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>违规详情配置</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link href="${ctx}/sms/statics/pages/css/configManage/default.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/configManage/illegalDetail.js"></script>
    <style>
    	.title{
    	        background: #F1F9F7;font-size: 13px;
    	}
    	.lineborder{
    		border: 1px solid #e1e1e1;margin-top: 0px;width:1200px;height: 32px;line-height:32px;
    	}
    </style>
</head>
<body>
<input type="hidden" id="dirId" value="${dirId }" />
<input type="hidden" id="ruleId" value="${ruleId }" />
<div class="wrap100 quickrecharge">
	<div class="q_r_list">
		<div class="title lineborder">规则基本信息</div>
		<div>
			<table style="width: 1200px">
				<tr class="lineborder">
					<td>规则名称：</td>
					<td>
						<span id="ruleName"></span>
					</td>
					<td>
						建立时间：
					</td>
					<td>
						<span id="createTime"></span>
					</td>
					<td>
						建立人：
					</td>
					<td>
						<span id="createStaffName"></span>
					</td>
				</tr>
				<tr class="lineborder">
					<td>状态：</td>
					<td>
						<span id="status"></span>
					</td>
					<td>
						规则描述：
					</td>
					<td>
						<span id="remark"></span>
					</td>
					<td>
						数据汇总频率：
					</td>
					<td>
						<span id="selFreq"></span>
					</td>
				</tr>
			</table>
		</div>
		<div class="title lineborder">违规信息详情配置</div>
		<div>
			<table style="width: 1200px" id="illegalDetail"> 
				
			</table>
		</div>
		
		<div style="text-align: center;margin-top: 10px;">
			<a id="btnIllgal" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary" >
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
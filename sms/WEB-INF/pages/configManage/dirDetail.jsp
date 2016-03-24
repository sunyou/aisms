<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>展示管理</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link href="${ctx}/sms/statics/pages/css/configManage/default.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/configManage/dirDetail.js"></script>
    <style>
    	.lineborder{
    		 border: 1px solid #e1e1e1;margin-top: 1px;height: 32px;line-height:32px;
    	}
    </style>
</head>
<body>
<input type="hidden" id="dirId" value="${dirId }" />
<div class="wrap100 quickrecharge">
	<div class="q_r_list">
		<div>
			<table style="width: 730px">
				<tr class="lineborder">
					<td>分类名称：</td>
					<td>
						<input type="text" id="dirName" />
					</td>
					<td>
						建立时间：
					</td>
					<td>
						<input type="text" id="createTime" />
					</td>
					<td>
						建立人：
					</td>
					<td>
						<input type="text" id="createStaffName" />
					</td>
				</tr>
				<tr class="lineborder">
					<td>状态：</td>
					<td>
						<input type="text" id="dirStatus" />
					</td>
					<td>
						分类描述：
					</td>
					<td>
						<input type="text" id="remark" />
					</td>
					<td>
						业务表名：
					</td>
					<td>
						<select id="selYwbm" style="height:28px;"></select>
					</td>
				</tr>
			</table>
		</div>
		<div id="divRow" class="lineborder">
			表名：<select name="selTable" style="height:28px;" onchange="bindSelCol($(this).next(),$(this).val())"></select>
			字段名：<select name="selCol" style="height:28px;"></select>
			是否排序字段：<select name="selOrder" style="height:28px;"><option value="1">是</option><option value="0">否</option></select>
			是否查询条件：<select name="selSelect" style="height:28px;"><option value="1">是</option><option value="0">否</option></select>
			比较符号：<input type="text" name="txtCompare" style="width: 50px;" />
			<button onclick="addRow($(this).parent())">+</button>
			<button onclick="delRow($(this).parent())">-</button>
		</div>
		<div style="text-align: center;margin-top: 10px;">
			<a id="btnSave" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary" id="btnShowDir">
            	保存
			</a>
			<a id="btnClose" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary" id="btnShowDir">
            	关闭
			</a>
		</div>
	</div>	
</div>
</body>
</html>
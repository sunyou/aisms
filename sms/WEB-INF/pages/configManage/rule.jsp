<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>展示管理</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link href="${ctx}/sms/statics/pages/css/configManage/default.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/configManage/rule.js"></script>
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
<input type="hidden" id="dirId" value="${dirId }" />
<input type="hidden" id="ruleId" value="${ruleId }" />
<div class="wrap100 quickrecharge">
	<div class="q_r_list">
		<div class="title lineborder">规则基本信息</div>
		<div>
			<table style="width: 730px">
				<tr class="lineborder">
					<td>规则名称：</td>
					<td>
						<input type="text" id="ruleName" />
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
						<input type="text" id="status" value="0" />
					</td>
					<td>
						规则描述：
					</td>
					<td>
						<input type="text" id="remark" />
					</td>
					<td>
						数据汇总频率：
					</td>
					<td>
						<select id="selFreq" style="height:28px;">
							<option value="1">日</option>
							<option value="2">周</option>
							<option value="3">旬</option>
							<option value="4">月</option>
							<option value="5">季度</option>
							<option value="6">年</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<div class="title lineborder">数据日期定义</div>
		<div id="divDate">
			<div class="lineborder">
				字段名：<select name="selDateCol" style="height:28px;"></select>
				<button onclick="addRow($(this).parent())">+</button>
				<button onclick="delRow($(this).parent())">-</button>
			</div>
		</div>
		<div class="title lineborder">数据过滤信息定义</div>
		<div id="divWhere">
			<div class="lineborder">
				字段名：<select name="selWhereCol" style="height:28px;"></select>
				比较符：<input type="text" name="txtWhereCompare" />
				比较值：<input type="text" name="txtwhereVlue" />
				<button onclick="addRow($(this).parent())">+</button>
				<button onclick="delRow($(this).parent())">-</button>
			</div>
		</div>
		<div class="title lineborder">数据分组信息定义</div>
		<div id="divGroupby">
			<div class="lineborder">
				字段名：<select name="selGroupbyCol" style="height:28px;"></select>
				<button onclick="addRow($(this).parent())">+</button>
				<button onclick="delRow($(this).parent())">-</button>
			</div>
		</div>
		<div class="title lineborder">数据过滤信息定义</div>
		<div id="divHaving">
			<div class="lineborder">
				字段名：<select name="selHavingCol" style="height:28px;"></select>
				比较符：<input type="text" name="txtHavingCompare" />
				比较值：<input type="text" name="txtHavingValue" />
				<button onclick="addRow($(this).parent())">+</button>
				<button onclick="delRow($(this).parent())">-</button>
			</div>
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
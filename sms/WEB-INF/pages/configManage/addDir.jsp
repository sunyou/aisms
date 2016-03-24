<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>展示管理</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link href="${ctx}/sms/statics/pages/css/configManage/default.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/configManage/addDir.js"></script>
</head>
<body>
<input type="hidden" id="dirId" value="${dirId }" />
<input type="hidden" id="parentId" value="${parentId }" />
<div class="wrap100 quickrecharge">
	<div class="q_r_list">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	            <td>分类名称：</td>
	            <td>
	                <input name="input" class="inputW160" id="dirName"/>
	            </td>
	            <td>分类描述 ：</td>
	            <td><input name="input3" class="inputW160" id="remark"/></td>
	        <tr>
	            <td>节点类型 ：</td>
	            <td><input type="radio" checked="checked" name="dirType" value="0"/>目录<input type="radio" name="dirType" value="1"/>节点</td>
	            <td>状态 ：</td>
                <td><input type="radio" checked="checked" name="dirStatus" value="0"/>启用 <input type="radio" name="dirStatus" value="1"/>停用</td>
	        </tr>
	    </table>
	    <div style="text-align: center;margin-top: 10px;">
			<button id="btnSaveDir" class="button">保存</button>
	        <button id="btnShowDir" class="button">展示管理</button>
		</div>
	</div>	
</div>
</body>
</html>
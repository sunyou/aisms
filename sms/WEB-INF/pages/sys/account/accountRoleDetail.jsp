<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <link rel="stylesheet" href="${ctx}/sms/statics/ace/plugins/validate/jquery.validate.css" type="text/css">
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/validate/additional-methods.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/validate/messages_cn.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/sys/jquery.multiselect2side.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/sys/accountroledetail.js"></script>
    <link rel="stylesheet" href="${ctx}/sms/statics/pages/css/multiselect2side/jquery.multiselect2side.css" type="text/css">
</head>
 <body class="body">
 
<div class="wrap100 quickrecharge">
 	<div class="q_r_list">
 		<div class="listTable">
            	<form id="searchFormSe" action="#" accountCode="${accountBean.accountCode}" orgId="${accountBean.orgId}">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                	  <tr>
                	  	<td width="25%"> 用户名： </td>
                	  	<td width="25%">${accountBean.accountName}</td>
                	  	<td width="25%"> 账号： </td>
                	  	<td width="25%">${accountBean.accountCode}</td>
                	  <tr>
                	  <tr>
                	  	<td> 密码： </td>
                	  	<td>${accountBean.accountPwd}</td>
                	  	<td> 状态： </td>
                	  	<td><span id="status">${status}</span></td>
                	  <tr>
                	  <tr>
                	  	<td>备注： </td>
                	  	<td>${accountBean.remark}</td>
                	  	<td>所属机构： </td>
                	  	<td><span id="orgName">${orgName}</span></td>
                	  <tr>
                	  <tr>
                	  	<td>创建人： </td>
                	  	<td>${accountBean.createStaff}</td>
                	  	<td>创建时间：</td> 
                	  	<td>${roleBea.createTime}</td>
                	  <tr>
                   	  <tr>
            			<td colspan="4">
            				<select name="searchable" id='rolelist' multiple='multiple' >
							</select>
						</td>
						
            		  </tr>
                	</table>
           	 </form>
        </div>
        
		<div class="clearfix form-actions">
			<div class="col-bt-center">
				<button class="btn btn-info" type="button" id="saveBtn">
		   			<i class="ace-icon fa fa-check bigger-110"></i>
						<span id="showText">保  存</span>
				</button>
				<button class="btn btn-info" type="button" id="closeBtn">
					<i class="ace-icon fa fa-check bigger-110"></i>
					   取 消
			   </button>
		   </div>
		</div>
    </div>
</div>
 </body>
</html>

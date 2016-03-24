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
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/sys/rolestaffdetail.js"></script>
    <link rel="stylesheet" href="${ctx}/sms/statics/pages/css/multiselect2side/jquery.multiselect2side.css" type="text/css">
</head>
 <body class="body">
 
<div class="wrap100 quickrecharge">
 	<div class="q_r_list">
 		<div class="listTable">
            	<form id="searchFormSe" action="#" roleCode="${roleBean.roleCode}" orgId="${roleBean.orgId}">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                	  <tr>
                	  	<td width="25%"> 角色编码： </td>
                	  	<td width="25%">${roleBean.roleCode}</td>
                	  	<td width="25%"> 角色名称： </td>
                	  	<td width="25%">${roleBean.roleName}</td>
                	  <tr>
                	  <tr>
                	  	<td> 状态： </td>
                	  	<td><span id="status">${status}</span></td>
                	  	<td> 角色描述： </td>
                	  	<td>${roleBean.roleDescribe}</td>
                	  <tr>
                	  <tr>
                	  	<td>所属机构： </td>
                	  	<td><span id="orgName">${orgName}</span></td>
                	  	<td>创建人： </td>
                	  	<td>${roleBean.createStaff}</td>
                	  <tr>
                	  <tr>
                	  	<td>创建时间：</td> 
                	  	<td>${roleBea.createTime}</td>
                	  <tr>
                   	  <tr>
            			<td colspan="2">
            				<select name="searchable" id='accountlist' multiple='multiple' >
							</select>
						</td>
						<td colspan="2">
            				<select name="searchable1" id='menulist' multiple='multiple' >
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

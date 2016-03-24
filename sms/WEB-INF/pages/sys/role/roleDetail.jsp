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
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/sys/roledetail.js"></script>

</head>
 <body class="body">
<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <form class="form-horizontal" role="form" id="medicalRoleForm" dataType="${dataType}" old_orgId="${roleBean.orgId}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 角色编码： </label>
                        <div class="col-xs-3"  style="width: 35%"  >
                            <input  class="inputW160"  type="text" id="roleCode" name="roleCode" value="${roleBean.roleCode}"/>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 角色名称： </label>
                        <div class="col-xs-3"  style="width: 35%" >
                           <input  class="inputW160"  type="text" id="roleName" name="roleName" value="${roleBean.roleName}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 状态： </label>
                        <div class="col-xs-3"  style="width: 35%">
                        	<select  id="status" name="status" class="selectinput160" >
                            	<option value="0">启用</option>
                            	<option value="1">停用</option>
                            </select>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 角色描述： </label>
                        <div class="col-xs-3"  style="width: 35%">
                           <input  class="inputW160" type="text" id="roleDescribe" name="roleDescribe" value="${roleBean.roleDescribe}"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 所属机构： </label>
                        <div class="col-xs-3"  style="width: 35%">
                        	<select  id="orgId" name="orgId" class="selectinput160" >
                            	<option value="-1">请选择</option>
                            </select>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 创建人： </label>
                        <div class="col-xs-3"  style="width: 35%">
                       		<input  class="inputW160" type="text" id="createStaff" name="createStaff" value="${roleBean.createStaff}"/>
                        </div>
                    </div>
                     
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 创建时间： </label>
                        <div class="col-xs-3"  style="width: 35%">
                           <input  class="inputW160" type="text" id="createTime"  value="${roleBean.createTime}"/>
                        </div>
                    </div>
                    
                    <div class="clearfix form-actions">
                        <div class="col-bt-center">
                            <button class="btn btn-info" type="button" id="saveBtn">
                                <i class="ace-icon fa fa-check bigger-110"></i>
                                	<span id="showText">保 存</span>
                            </button>
                            <button class="btn btn-info" type="button" id="closeBtn">
                                <i class="ace-icon fa fa-check bigger-110"></i>
                             	   取 消
                            </button>
                        </div>
                    </div>
                </form>
			</div>
		</div>	
	</div>
</div>
 </body>
</html>

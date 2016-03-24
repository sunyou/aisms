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
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/sys/accountdetail.js"></script>

</head>
 <body class="body">
<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <form class="form-horizontal" role="form" id="medicalAccountForm" dataType="${dataType}" accountId="${accountBean.accountId}" old_orgId="${accountBean.orgId}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 用户名： </label>
                        <div class="col-xs-3"  style="width: 35%"  >
                            <input  class="inputW160"  type="text" id="accountName" name="accountName" value="${accountBean.accountName}"/>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 账号： </label>
                        <div class="col-xs-3"  style="width: 35%" >
                           <input  class="inputW160"  type="text" id="accountCode" name="accountCode" value="${accountBean.accountCode}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 密码： </label>
                        <div class="col-xs-3"  style="width: 35%">
                        	<input  class="inputW160"  type="text" id="accountPwd" name="accountPwd" value="${accountBean.accountPwd}"/>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 状态： </label>
                        <div class="col-xs-3"  style="width: 35%">
                        	<select  id="status" name="status" class="selectinput160" >
                            	<option value="0">启用</option>
                            	<option value="1">停用</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 备注： </label>
                        <div class="col-xs-3"  style="width: 35%">
                       		<input  class="inputW160" type="text" id="remark" name="remark" value="${accountBean.remark}"/>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 所属机构： </label>
                        <div class="col-xs-3"  style="width: 35%">
                        	<select  id="orgId" name="orgId" class="selectinput160" >
                            	<option value="-1">请选择</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 创建人： </label>
                        <div class="col-xs-3"  style="width: 35%">
                       		<input  class="inputW160" type="text" id="createStaff" name="createStaff" value="${accountBean.createStaff}"/>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 创建时间： </label>
                        <div class="col-xs-3"  style="width: 35%">
                           <input  class="inputW160" type="text" id="createTime"  value="${accountBean.createTime}"/>
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

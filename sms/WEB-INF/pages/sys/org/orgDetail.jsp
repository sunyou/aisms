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
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/sys/orgdetail.js"></script>

</head>
 <body class="body">
<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <form class="form-horizontal" role="form" id="medicalOrgForm" dataType="${dataType}" old_cityCode="${orgBean.cityCode}" old_countyCode="${orgBean.countyCode}" old_provinceCode="${orgBean.provinceCode}" >
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 所在地区： </label>
                        <div class="col-xs-9"  >
                            <select  id="provinceCode" name="provinceCode" class="selectinput160" onchange="getCityList(this)">
                            	 <option value="-1">请选择</option>
                            </select>&nbsp;&nbsp;
                            <select  id="cityCode" name="cityCode" class="selectinput160" onchange="getCountyList(this)">
                            	<option value="-1">请选择</option>
                            </select>&nbsp;&nbsp;
                            <select  id="countyCode" name="countyCode" class="selectinput160" >
                            	<option value="-1">请选择</option>
                            </select>
                        </div>
                       
                    </div>
                    <div class="form-group">
 						<label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 机构名称： </label>
                        <div class="col-xs-3"  style="width: 35%" >
                           <input  class="inputW160"  type="text" id="orgName" name="orgName" value="${orgBean.orgName}"/>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 机构编码： </label>
                        <div class="col-xs-3"  style="width: 35%">
                        	<input  class="inputW160" type="text" id="orgId" name="orgId" value="${orgBean.orgId}"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 负责人： </label>
                        <div class="col-xs-3"  style="width: 35%">
                           <input  class="inputW160" type="text" id="director" name="director" value="${orgBean.director}"/>
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
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 联系人： </label>
                        <div class="col-xs-3"  style="width: 35%">
                       		<input  class="inputW160" type="text" id="contacts" name="contacts" value="${orgBean.contacts}"/>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 联系电话： </label>
                        <div class="col-xs-3"  style="width: 35%">
                           <input  class="inputW160" type="text" id="contactsPhone" name="contactsPhone" value="${orgBean.contactsPhone}"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 详细地址： </label>
                        <div class="col-xs-9" >
                           <input  style="width:85%" type="text" id="address" name="address" value="${orgBean.address}"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" style="width: 15%"> 备注： </label>
                        <div class="col-xs-9"  >
                            <input  style="width:85%" type="text" id="remark" name="remark" value="${orgBean.remark}"/>
                        </div>
                    </div>
                    
                    <div class="clearfix form-actions">
                        <div class="col-bt-center">
                            <button class="btn btn-info" type="button" id="saveBtn">
                                <i class="ace-icon fa fa-check bigger-110"></i>
                                	<span id="showText">新 增</span>
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

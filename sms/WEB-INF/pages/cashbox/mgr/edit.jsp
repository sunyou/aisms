<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>

    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/selectTree.css" type="text/css">
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript"
            src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript"
            src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.exedit-3.5.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/mgr/edit.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/additional-methods.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/messages_cn.js"></script>
</head>

<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal" role="form" id="editForm">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right must"> 钱箱号： </label>

                        <div class="col-sm-9">
                            <input class="inputW170" type="text" id="cashboxNo" name="cashboxNo" readonly="readonly" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right must"> 网点名称： </label>

                        <div class="col-sm-9">
                            <input class="inputW170" type="text" id="orgName" name="orgName" readonly="readonly"/>
                            <input id="orgCode" type="hidden" readonly name="orgCode"/>
                            <input id="orgId" type="hidden" readonly name="orgId"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right must"> 操作员： </label>

                        <div class="col-sm-9">
                            <select id="cashboxOwnerCode" name="cashboxOwnerCode"
                                    onchange="checkOwnerCode();" readonly="readonly" style="width:170px">
                                <option value="-1">请选择操作员</option>
                            </select>
                            <input id="cashboxOwnerName" type="hidden" readonly name="cashboxOwnerName"/>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-bt-center">
                            <button class="btn btn-primary" type="button" id="saveBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-save"></i>
                                保 存
                            </button>

                            <button class="btn btn-gray" type="button" id="closeBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-remove"></i>
                                关 闭
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</html>